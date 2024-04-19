import 'package:counter_app/models/goal_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllDhikrsControllerNotifier extends StateNotifier<List<GoalModel>> {
  AllDhikrsControllerNotifier()
      : super([
          GoalModel(
            title: "Subhan'Allah",
            meaning: "Glory be to Allah",
            targetValue: 33,
            arabic: "سبحان الله",
          ),
          GoalModel(
            title: "Alhamdulillah",
            meaning: "All praise is due to Allah",
            targetValue: 33,
            arabic: "الحمد لله",
          ),
          GoalModel(
            title: "La ilaha illallah",
            meaning: "There is no god but Allah",
            targetValue: 33,
            arabic: "لا إله إلا الله",
          ),
          GoalModel(
            title: "Allahu Akbar",
            meaning: "Allah is the Greatest",
            targetValue: 33,
            arabic: "الله أكبر",
          ),
          GoalModel(
            title: "Astagfirullah",
            meaning: "I seek the forgiveness of Allah",
            targetValue: 33,
            arabic: "استغفرالله",
          ),
          GoalModel(
            title: "Bismillah",
            meaning: "In the name of God",
            targetValue: 33,
            arabic: "بسم الله",
          ),
          GoalModel(
            title: "La hawla wa la quwwata illa billah",
            meaning: "There is no power or strength except with Allah",
            targetValue: 33,
            arabic: "لا حول ولا قوة إلا بالله",
          ),
          GoalModel(
            title: "SubhanAllahi wa bi Hamdihi",
            meaning: "Glory be to Allah and Praise Him",
            targetValue: 33,
            arabic: "سبحان الله وبحمده",
          ),
        ]);
}

final allDhikrsProviderController =
    StateNotifierProvider<AllDhikrsControllerNotifier, List<GoalModel>>(
  (ref) => AllDhikrsControllerNotifier(),
);
