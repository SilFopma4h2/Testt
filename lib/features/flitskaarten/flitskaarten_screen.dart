import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class FlitskaartenScreen extends StatefulWidget {
  const FlitskaartenScreen({super.key});

  @override
  State<FlitskaartenScreen> createState() => _FlitskaartenScreenState();
}

class _FlitskaartenScreenState extends State<FlitskaartenScreen> {
  final List<Map<String, String>> _cardSets = [
    {'name': 'Wiskunde Formules', 'count': '28', 'dueToday': '12'},
    {'name': 'Geschiedenis 1900-2000', 'count': '45', 'dueToday': '8'},
    {'name': 'Biologie Cellen', 'count': '36', 'dueToday': '15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flitskaarten'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Daily Review Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(Icons.style, color: Colors.white, size: 48),
                const SizedBox(height: 12),
                const Text(
                  '35 kaarten te herhalen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start je dagelijkse review sessie',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppTheme.primaryColor,
                  ),
                  child: const Text('Start Review'),
                ),
              ],
            ),
          ),
          
          // Card Sets List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mijn Sets',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Nieuwe Set'),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _cardSets.length,
              itemBuilder: (context, index) {
                final set = _cardSets[index];
                final dueToday = int.parse(set['dueToday']!);
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.style,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                    title: Text(
                      set['name']!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text('${set['count']} kaarten'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (dueToday > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.accentColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '$dueToday vandaag',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        if (dueToday == 0)
                          const Icon(Icons.check_circle, color: AppTheme.accentColor),
                      ],
                    ),
                    onTap: () {
                      _showSetOptions(context, set['name']!);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddCardDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Nieuwe Kaart'),
      ),
    );
  }

  void _showSetOptions(BuildContext context, String setName) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              setName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            _buildOptionButton(
              context,
              'Leren',
              Icons.school,
              AppTheme.primaryColor,
            ),
            _buildOptionButton(
              context,
              'Bewerken',
              Icons.edit,
              AppTheme.secondaryColor,
            ),
            _buildOptionButton(
              context,
              'Statistieken',
              Icons.bar_chart,
              AppTheme.accentColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAddCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nieuwe Flitskaart'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Set',
                border: OutlineInputBorder(),
              ),
              items: _cardSets.map((set) {
                return DropdownMenuItem(
                  value: set['name'],
                  child: Text(set['name']!),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Voorkant',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Achterkant',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
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
              // Add card logic
            },
            child: const Text('Toevoegen'),
          ),
        ],
      ),
    );
  }
}
