import 'package:hive/hive.dart';
part 'goal_model.g.dart';

@HiveType(typeId: 0)
class GoalModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String meaning;
  @HiveField(2)
  int targetValue;
  @HiveField(3)
  final String arabic;

  GoalModel({
    required this.title,
    required this.meaning,
    required this.targetValue,
    required this.arabic,
  });
}
