import 'package:counter_app/constants.dart/goal_constants.dart';
import 'package:counter_app/main.dart';
import 'package:counter_app/models/goal_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class GoalFuncions extends ChangeNotifier {
  static final goalBox = Hive.box<GoalModel>(goalsHiveBox);

  addGoal(GoalModel goal) {
    goalBox.add(goal);
    notifyListeners();
  }

  updateGoal(int index, GoalModel goal) {
    goalBox.put(index, goal);
  }

  deleteGoal(int index) {
    goalBox.deleteAt(index);
    myGoals = getAllGoals();
  }

  deleteAllGoals() {
    goalBox.clear();
  }

  GoalModel? getGoal(int index) {
    return goalBox.get(index);
  }

  List<GoalModel> getAllGoals() {
    final goals = goalBox.keys.map((key) {
      final value = goalBox.get(key);
      return GoalModel(
        title: value!.title,
        meaning: value.meaning,
        targetValue: value.targetValue,
        arabic: value.arabic,
      );
    }).toList();

    return goals;
  }
}
