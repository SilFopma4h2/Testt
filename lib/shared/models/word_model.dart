import 'package:hive/hive.dart';

part 'word_model.g.dart';

@HiveType(typeId: 1)
class Word extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String language;
  
  @HiveField(2)
  String word;
  
  @HiveField(3)
  String meaning;
  
  @HiveField(4)
  String? exampleSentence;
  
  @HiveField(5)
  String? audioUrl;
  
  @HiveField(6)
  int srsScore;
  
  @HiveField(7)
  DateTime? lastReviewed;
  
  @HiveField(8)
  DateTime? nextReview;
  
  @HiveField(9)
  int reviewCount;
  
  @HiveField(10)
  String category;
  
  @HiveField(11)
  DateTime createdAt;

  Word({
    required this.id,
    required this.language,
    required this.word,
    required this.meaning,
    this.exampleSentence,
    this.audioUrl,
    this.srsScore = 0,
    this.lastReviewed,
    this.nextReview,
    this.reviewCount = 0,
    this.category = 'general',
    required this.createdAt,
  });
}
