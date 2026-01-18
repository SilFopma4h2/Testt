class AppConstants {
  // App Info
  static const String appName = 'AI Leerapp';
  static const String appVersion = '1.0.0';
  
  // Focus Session Durations (in minutes)
  static const List<int> focusDurations = [15, 25, 30, 45, 60];
  
  // Spaced Repetition Intervals (in days)
  static const List<int> srsIntervals = [1, 3, 7, 14, 30, 90];
  
  // Learning Levels
  static const List<String> learningLevels = ['basis', 'normaal', 'examen'];
  
  // Daily Goals
  static const int defaultDailyWordsGoal = 20;
  static const int defaultDailyCardsGoal = 30;
  static const int defaultDailyFocusMinutes = 60;
  
  // Rewards Points
  static const int pointsPerWord = 5;
  static const int pointsPerCard = 3;
  static const int pointsPerFocusSession = 10;
  static const int pointsPerStreak = 20;
  
  // Storage Keys
  static const String userBoxKey = 'user_box';
  static const String wordsBoxKey = 'words_box';
  static const String cardsBoxKey = 'cards_box';
  static const String conversationsBoxKey = 'conversations_box';
  static const String focusSessionsBoxKey = 'focus_sessions_box';
  
  // API Configuration (placeholder - replace with actual API)
  static const String aiApiBaseUrl = 'https://api.openai.com/v1';
  static const String aiApiKey = 'YOUR_API_KEY_HERE'; // Should be stored securely
}
