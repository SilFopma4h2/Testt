import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class WoordenScreen extends StatefulWidget {
  const WoordenScreen({super.key});

  @override
  State<WoordenScreen> createState() => _WoordenScreenState();
}

class _WoordenScreenState extends State<WoordenScreen> {
  final List<Map<String, String>> _wordSets = [
    {'name': 'Engels - Basis', 'language': 'Engels', 'count': '45'},
    {'name': 'Frans - Reis', 'language': 'Frans', 'count': '32'},
    {'name': 'Duits - School', 'language': 'Duits', 'count': '58'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Woorden Leren'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Statistics Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('135', 'Totaal woorden', Icons.translate),
                _buildStatColumn('24', 'Vandaag', Icons.today),
                _buildStatColumn('89%', 'Succes', Icons.trending_up),
              ],
            ),
          ),
          
          // Word Sets List
          Expanded(
            child: _wordSets.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.translate_outlined,
                          size: 80,
                          color: AppTheme.primaryColor.withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Nog geen woordenlijsten',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Maak je eerste woordenlijst aan',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _wordSets.length,
                    itemBuilder: (context, index) {
                      final set = _wordSets[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.translate,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          title: Text(
                            set['name']!,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text('${set['count']} woorden'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.play_arrow),
                                onPressed: () {
                                  _showLearningMode(context, set['name']!);
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: AppTheme.accentColor,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.chevron_right),
                            ],
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddWordDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Nieuw Woord'),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  void _showLearningMode(BuildContext context, String setName) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Kies leer modus',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            _buildModeOption(
              context,
              'Meerkeuze',
              'Kies het juiste antwoord',
              Icons.radio_button_checked,
            ),
            _buildModeOption(
              context,
              'Typen',
              'Typ het woord in',
              Icons.keyboard,
            ),
            _buildModeOption(
              context,
              'Luisteren',
              'Luister en typ het woord',
              Icons.headphones,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeOption(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pop(context);
          // Start learning mode
        },
      ),
    );
  }

  void _showAddWordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nieuw Woord Toevoegen'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Woord',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Betekenis',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Voorbeeldzin (optioneel)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuleren'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Add word logic
            },
            child: const Text('Toevoegen'),
          ),
        ],
      ),
    );
  }
}
