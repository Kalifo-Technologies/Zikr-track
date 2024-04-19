import 'package:counter_app/providers/add_new_goal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

clearNewGoalFields(WidgetRef ref) {
  ref.read(titleControllerProvider.notifier).state = "Select dhikr";
  ref.read(targetValueControllerProvider.notifier).state.clear();
  ref.read(noteControllerProvider.notifier).state.clear();
}
