import 'package:hive/hive.dart';

part 'flashcard_model.g.dart';

@HiveType(typeId: 2)
class Flashcard extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String front;
  
  @HiveField(2)
  String back;
  
  @HiveField(3)
  String? imageUrl;
  
  @HiveField(4)
  String setId;
  
  @HiveField(5)
  String setName;
  
  @HiveField(6)
  DateTime? lastReviewed;
  
  @HiveField(7)
  DateTime? nextReview;
  
  @HiveField(8)
  int interval;
  
  @HiveField(9)
  int reviewCount;
  
  @HiveField(10)
  bool isStarred;
  
  @HiveField(11)
  DateTime createdAt;

  Flashcard({
    required this.id,
    required this.front,
    required this.back,
    this.imageUrl,
    required this.setId,
    required this.setName,
    this.lastReviewed,
    this.nextReview,
    this.interval = 1,
    this.reviewCount = 0,
    this.isStarred = false,
    required this.createdAt,
  });
}
