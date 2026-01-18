import 'package:hive/hive.dart';

part 'focus_session_model.g.dart';

@HiveType(typeId: 4)
class FocusSession extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  DateTime startTime;
  
  @HiveField(2)
  DateTime? endTime;
  
  @HiveField(3)
  int durationMinutes;
  
  @HiveField(4)
  List<String> blockedApps;
  
  @HiveField(5)
  bool completed;
  
  @HiveField(6)
  int rewardPoints;
  
  @HiveField(7)
  String? notes;

  FocusSession({
    required this.id,
    required this.startTime,
    this.endTime,
    required this.durationMinutes,
    this.blockedApps = const [],
    this.completed = false,
    this.rewardPoints = 0,
    this.notes,
  });
  
  Duration get actualDuration {
    if (endTime == null) return Duration.zero;
    return endTime!.difference(startTime);
  }
  
  bool get isActive {
    return endTime == null && DateTime.now().difference(startTime).inMinutes < durationMinutes;
  }
}
