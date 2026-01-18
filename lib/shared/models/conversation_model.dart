import 'package:hive/hive.dart';

part 'conversation_model.g.dart';

@HiveType(typeId: 3)
class Conversation extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String question;
  
  @HiveField(2)
  String answer;
  
  @HiveField(3)
  String level;
  
  @HiveField(4)
  List<String> tags;
  
  @HiveField(5)
  bool isSaved;
  
  @HiveField(6)
  DateTime createdAt;

  Conversation({
    required this.id,
    required this.question,
    required this.answer,
    required this.level,
    this.tags = const [],
    this.isSaved = false,
    required this.createdAt,
  });
}
