import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String? avatarUrl;
  
  @HiveField(3)
  String learningLevel;
  
  @HiveField(4)
  int dailyWordsGoal;
  
  @HiveField(5)
  int dailyCardsGoal;
  
  @HiveField(6)
  int dailyFocusMinutes;
  
  @HiveField(7)
  int totalPoints;
  
  @HiveField(8)
  int currentStreak;
  
  @HiveField(9)
  DateTime? lastActiveDate;
  
  @HiveField(10)
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.learningLevel = 'normaal',
    this.dailyWordsGoal = 20,
    this.dailyCardsGoal = 30,
    this.dailyFocusMinutes = 60,
    this.totalPoints = 0,
    this.currentStreak = 0,
    this.lastActiveDate,
    required this.createdAt,
  });
}
