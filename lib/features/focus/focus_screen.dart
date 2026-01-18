import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  int _selectedDuration = 25;
  bool _isSessionActive = false;
  int _remainingSeconds = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Sessies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              _showSessionHistory(context);
            },
          ),
        ],
      ),
      body: _isSessionActive ? _buildActiveSession() : _buildSetupScreen(),
    );
  }

  Widget _buildSetupScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Statistics Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(Icons.timer, size: 48, color: AppTheme.accentColor),
                  const SizedBox(height: 12),
                  Text(
                    'Focus Statistieken',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn('12', 'Vandaag', Icons.today),
                      _buildStatColumn('156', 'Deze week', Icons.calendar_today),
                      _buildStatColumn('7', 'Streak', Icons.local_fire_department),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Duration Selection
          Text(
            'Kies focus duur',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: AppConstants.focusDurations.map((duration) {
              final isSelected = duration == _selectedDuration;
              return ChoiceChip(
                label: Text('$duration min'),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedDuration = duration;
                  });
                },
                selectedColor: AppTheme.accentColor,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          
          // Blocked Apps Section
          Text(
            'Apps blokkeren',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                _buildAppBlockOption('Social Media', Icons.groups, true),
                _buildAppBlockOption('Games', Icons.games, true),
                _buildAppBlockOption('Streaming', Icons.play_circle, false),
                _buildAppBlockOption('Browser', Icons.web, false),
              ],
            ),
          ),
          const SizedBox(height: 32),
          
          // Start Button
          ElevatedButton(
            onPressed: _startFocusSession,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              backgroundColor: AppTheme.accentColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.play_arrow, size: 28),
                const SizedBox(width: 8),
                Text(
                  'Start $_selectedDuration min Focus',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveSession() {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    final progress = 1 - (_remainingSeconds / (_selectedDuration * 60));
    
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          
          // Circular Timer
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 12,
                  backgroundColor: AppTheme.accentColor.withValues(alpha: 0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentColor),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.timer, size: 48, color: AppTheme.accentColor),
                  const SizedBox(height: 16),
                  Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Stay focused!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
          
          const Spacer(),
          
          // Status Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn('Apps', '4 geblokkeerd', Icons.block),
                      _buildInfoColumn('Punten', '+${AppConstants.pointsPerFocusSession}', Icons.stars),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _pauseFocusSession,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Pauzeren'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _stopFocusSession,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppTheme.errorColor,
                  ),
                  child: const Text('Stop'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.accentColor, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildAppBlockOption(String label, IconData icon, bool isBlocked) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: Switch(
        value: isBlocked,
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.accentColor),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  void _startFocusSession() {
    setState(() {
      _isSessionActive = true;
      _remainingSeconds = _selectedDuration * 60;
    });
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _completeFocusSession();
        }
      });
    });
  }

  void _pauseFocusSession() {
    _timer?.cancel();
    // Show pause dialog
  }

  void _stopFocusSession() {
    _timer?.cancel();
    setState(() {
      _isSessionActive = false;
      _remainingSeconds = 0;
    });
  }

  void _completeFocusSession() {
    _timer?.cancel();
    setState(() {
      _isSessionActive = false;
    });
    
    // Show completion dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('🎉 Gefeliciteerd!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.celebration, size: 64, color: AppTheme.accentColor),
            const SizedBox(height: 16),
            Text(
              'Je hebt $_selectedDuration minuten gefocust!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              '+${AppConstants.pointsPerFocusSession} punten',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.accentColor,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Klaar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _startFocusSession();
            },
            child: const Text('Nog een sessie'),
          ),
        ],
      ),
    );
  }

  void _showSessionHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sessie Geschiedenis'),
        content: const Text('Hier komt een overzicht van je focus sessies'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Sluiten'),
          ),
        ],
      ),
    );
  }
}
