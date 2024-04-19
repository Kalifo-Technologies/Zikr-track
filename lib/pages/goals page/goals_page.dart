import 'package:counter_app/constants.dart/goal_constants.dart';
import 'package:counter_app/main.dart';
import 'package:counter_app/models/goal_model.dart';
import 'package:counter_app/pages/new%20goal%20page/new_goal_page.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:counter_app/utilities/hive_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GoalsPage extends ConsumerStatefulWidget {
  const GoalsPage({super.key});

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: R.sw(16, context), vertical: R.sh(50, context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Goals',
                    style: TextStyle(
                        fontSize: R.sh(34, context),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: R.sh(5, context),
                  ),
                  myGoals.isEmpty
                      ? Center(
                          child: Text(
                            "You  don't have any goal yet. Click the button below to set a new goal!",
                            style: TextStyle(
                                fontSize: R.sh(13, context),
                                color: Colors.grey),
                          ),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: R.sh(8, context)),
                              child: Text(
                                'Your daily and weekly goals that help you to stay focused on your goals and improve your iman.',
                                style: TextStyle(
                                    fontSize: R.sh(13, context),
                                    color: Colors.grey),
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {
                            //     GoalFuncions().deleteAllGoals();
                            //   },
                            //   icon: Icon(Icons.delete),
                            // ),
                            SizedBox(
                              height: R.sh(468, context),
                              child: ValueListenableBuilder(
                                valueListenable:
                                    Hive.box<GoalModel>(goalsHiveBox)
                                        .listenable(),
                                builder: (context, value, child) {
                                  return ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: R.sh(20, context),
                                    ),
                                    itemBuilder: (context, index) {
                                      final reversedIndex =
                                          myGoals.length - 1 - index;
                                      final goal = myGoals[reversedIndex];
                                      return Slidable(
                                        direction: Axis.horizontal,
                                        endActionPane: ActionPane(
                                          extentRatio: 0.3,
                                          motion: const ScrollMotion(),
                                          children: [
                                            // SlidableAction(
                                            //   backgroundColor: Colors.blue,
                                            //   foregroundColor: Colors.white,
                                            //   icon: Icons.edit_outlined,
                                            //   spacing: 10,
                                            //   borderRadius:
                                            //       BorderRadius.circular(100),
                                            //   onPressed:
                                            //       (BuildContext context) async {
                                            //     showModalBottomSheet(
                                            //       isScrollControlled: true,
                                            //       useSafeArea: true,
                                            //       context: context,
                                            //       builder: (context) =>
                                            //           EditGoalPage(
                                            //         model: goal,
                                            //         index: index,
                                            //       ),
                                            //     );
                                            //   },
                                            // ),
                                            SlidableAction(
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete_outline,
                                              spacing: 10,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              onPressed:
                                                  (BuildContext context) async {
                                                setState(() {
                                                  GoalFuncions().deleteGoal(
                                                      reversedIndex);
                                                  // myGoals =
                                                  //     GoalFuncions.getAllGoals();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: C.tileColor(ref),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: ListTile(
                                              title: Text(
                                                goal.title,
                                                style: TextStyle(
                                                    fontSize: R.sh(18, context),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              subtitle: Text(
                                                goal.arabic,
                                                style: TextStyle(
                                                    fontSize: R.sh(18, context),
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey[500]),
                                              ),
                                              trailing: Text(
                                                goal.targetValue == 0
                                                    ? ""
                                                    : "${goal.targetValue}",
                                                style: TextStyle(
                                                    fontSize:
                                                        R.sh(26, context)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: myGoals.length,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              Column(
                children: [
                  myGoals.isEmpty
                      ? SizedBox(
                          height: R.sh(490, context),
                        )
                      : SizedBox(
                          height: R.sh(20, context),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: R.sh(75, context),
        width: R.sw(340, context),
        child: FloatingActionButton.extended(
          shape: const StadiumBorder(),
          elevation: 0,
          backgroundColor: C.buttonColor(ref),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => const NewGoalPage(),
            );
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
              ),
              SizedBox(width: R.sw(8, context)),
              Text(
                "New Goal",
                style: TextStyle(
                    fontSize: R.sh(16, context), fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

  // showModalBottomSheet(
  //   context: context,
  //   builder: (context) =>
  //       MyBottomSheet(
  //     ref: ref,
  //     title: "Are You sure?",
  //     subtitle:
  //         "Are you sure you want to delete this goal?",
  //     subtitleHeight: 40,
  //     ontap: () {
  //       ref
  //           .read(
  //               newTasbihProviderController
  //                   .notifier)
  //           .deleteGoal(
  //               reversedIndex);
  //       ref
  //           .read(isDeletedProvider
  //               .notifier)
  //           .state = true;
  //     },
  //   ),
  // );