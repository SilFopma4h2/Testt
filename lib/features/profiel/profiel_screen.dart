import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ProfielScreen extends StatefulWidget {
  const ProfielScreen({super.key});

  @override
  State<ProfielScreen> createState() => _ProfielScreenState();
}

class _ProfielScreenState extends State<ProfielScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _showSettings(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppTheme.primaryColor,
                      child: Text(
                        'JD',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Jan de Vries',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Normaal niveau',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatBadge(context, '7', 'Dagen streak', Icons.local_fire_department),
                        _buildStatBadge(context, '1250', 'Totaal punten', Icons.stars),
                        _buildStatBadge(context, '42', 'Level', Icons.trending_up),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Daily Goals Section
            Text(
              'Dagelijkse Doelen',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _buildGoalTile(
                    context,
                    'Woorden per dag',
                    '20',
                    Icons.translate,
                    AppTheme.primaryColor,
                  ),
                  const Divider(height: 1),
                  _buildGoalTile(
                    context,
                    'Kaarten per dag',
                    '30',
                    Icons.style,
                    AppTheme.secondaryColor,
                  ),
                  const Divider(height: 1),
                  _buildGoalTile(
                    context,
                    'Focus minuten',
                    '60',
                    Icons.timer,
                    AppTheme.accentColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Statistics Section
            Text(
              'Statistieken',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _buildStatTile(context, 'Totaal geleerde woorden', '342', Icons.translate),
                  const Divider(height: 1),
                  _buildStatTile(context, 'Flitskaarten gemaakt', '189', Icons.style),
                  const Divider(height: 1),
                  _buildStatTile(context, 'AI vragen gesteld', '156', Icons.psychology),
                  const Divider(height: 1),
                  _buildStatTile(context, 'Focus uren', '45.5', Icons.timer),
                  const Divider(height: 1),
                  _buildStatTile(context, 'Langste streak', '14 dagen', Icons.local_fire_department),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Achievement Section
            Text(
              'Prestaties',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildAchievement('🔥', '7 Dagen'),
                    _buildAchievement('⭐', 'Level 42'),
                    _buildAchievement('📚', '100 Woorden'),
                    _buildAchievement('🎯', 'Focus Master'),
                    _buildAchievement('🏆', 'Top Learner'),
                    _buildAchievement('💡', 'AI Expert'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Actions
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Herinneringen'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.shield),
                    title: const Text('Privacy'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help & Feedback'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('Over de app'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      _showAboutDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBadge(BuildContext context, String value, String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppTheme.primaryColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGoalTile(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          const Icon(Icons.edit, size: 20),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildStatTile(BuildContext context, String title, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(title),
      trailing: Text(
        value,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildAchievement(String emoji, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppTheme.accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 32),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _showSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Instellingen'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: const Text('Donkere modus'),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Notificaties'),
              value: true,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Geluiden'),
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Sluiten'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Over AI Leerapp'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Versie: 1.0.0'),
            SizedBox(height: 8),
            Text('Een AI-gestuurde leerapp met focus-sessies.'),
            SizedBox(height: 16),
            Text('© 2026 AI Leerapp'),
          ],
        ),
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
