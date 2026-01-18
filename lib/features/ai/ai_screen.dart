import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AIScreen extends StatefulWidget {
  const AIScreen({super.key});

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class _AIScreenState extends State<AIScreen> {
  final TextEditingController _messageController = TextEditingController();
  String _selectedLevel = 'normaal';
  final List<Map<String, dynamic>> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Leren'),
        actions: [
          PopupMenuButton<String>(
            initialValue: _selectedLevel,
            onSelected: (value) {
              setState(() {
                _selectedLevel = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'basis', child: Text('Basis niveau')),
              const PopupMenuItem(value: 'normaal', child: Text('Normaal niveau')),
              const PopupMenuItem(value: 'examen', child: Text('Examen niveau')),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(_selectedLevel, style: const TextStyle(fontSize: 14)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.psychology_outlined,
                          size: 80,
                          color: AppTheme.primaryColor.withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Stel een vraag aan de AI',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Je kunt alles vragen! De AI helpt je met uitleg, voorbeelden en kan je toetsen.',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final isUser = message['isUser'] as bool;
                      return _buildMessageBubble(
                        message['text'] as String,
                        isUser,
                      );
                    },
                  ),
          ),
          
          // Quick Actions Bar
          if (_messages.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuickAction(Icons.summarize, 'Samenvatten'),
                    _buildQuickAction(Icons.quiz, 'Quiz maken'),
                    _buildQuickAction(Icons.save, 'Opslaan'),
                    _buildQuickAction(Icons.help_outline, 'Leg uit'),
                    _buildQuickAction(Icons.lightbulb_outline, 'Voorbeeld'),
                  ],
                ),
              ),
            ),
          
          // Input Area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Stel je vraag...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? AppTheme.primaryColor : AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : AppTheme.textPrimary,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add({
        'text': _messageController.text,
        'isUser': true,
      });
      
      // Simulate AI response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            'text': 'Dit is eenvoorbeeld AI-antwoord. In de echte app zou hier de AI-response komen op niveau "$_selectedLevel".',
            'isUser': false,
          });
        });
      });
    });
    
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
