import 'dart:developer';

import 'package:counter_app/main.dart';
import 'package:counter_app/models/goal_model.dart';
import 'package:counter_app/pages/goals%20page/sub%20pages/all_dhikr_page.dart';
import 'package:counter_app/pages/new%20goal%20page/add_new_dhikr_page.dart';
import 'package:counter_app/providers/add_new_goal_provider.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:counter_app/utilities/clear_form_fields.dart';
import 'package:counter_app/utilities/hive_functions.dart';
import 'package:counter_app/widgets/add_new_textfield_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewGoalPage extends ConsumerStatefulWidget {
  const NewGoalPage({super.key});

  @override
  ConsumerState<NewGoalPage> createState() => _NewGoalPageState();
}

class _NewGoalPageState extends ConsumerState<NewGoalPage> {
  @override
  Widget build(BuildContext context) {
    String titleController = ref.watch(titleControllerProvider);
    TextEditingController targetValueController =
        ref.watch(targetValueControllerProvider);
    TextEditingController noteController = ref.watch(noteControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: R.sw(16, context)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: R.sh(30, context)),
                child: Text(
                  'Add new Goal',
                  style: TextStyle(
                    fontSize: R.sh(18, context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: R.sw(270, context),
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) => const AllDhikrPage(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                width: 1.5,
                                color: C.tileBorderColor(ref),
                              ),
                            ),
                            backgroundColor: C.tileColor(ref),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: R.sw(170, context),
                                child: Text(
                                  titleController,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: C.textColor(ref),
                                      fontWeight: FontWeight.w600,
                                      fontSize: R.sh(16, context)),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: C.textColor(ref),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) => const AddNewDhikrPage(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              width: 1.5,
                              color: C.tileBorderColor(ref),
                            ),
                          ),
                          backgroundColor: C.tileColor(ref),
                          elevation: 0,
                        ),
                        child: Icon(
                          Icons.edit_square,
                          color: C.textColor(ref),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: R.sh(10, context),
                  ),
                  Text(
                    "Select a dhikr from the list, or you can write your dhikr that you want if it isn't on our library by clicking on the button on right side.",
                    style: TextStyle(
                        color: Colors.grey, fontSize: R.sh(14, context)),
                  ),
                  SizedBox(
                    height: R.sh(25, context),
                  ),
                  AddNewTextFieldStyleWidget(
                      context: context,
                      text: "Set amount *",
                      controller: targetValueController,
                      height: 60,
                      maxLines: 1,
                      iconData: null,
                      type: TextInputType.number),
                  SizedBox(
                    height: R.sh(10, context),
                  ),
                  Text(
                    "You can set your dhikr goal by set based on your wish or can use the default number.",
                    style: TextStyle(
                        color: Colors.grey, fontSize: R.sh(14, context)),
                  ),
                  SizedBox(
                    height: R.sh(25, context),
                  ),
                  AddNewTextFieldStyleWidget(
                      context: context,
                      text: "Note",
                      controller: noteController,
                      height: 120,
                      maxLines: 10,
                      iconData: null,
                      type: null),
                  SizedBox(
                    height: R.sh(25, context),
                  ),
                  Text(
                    "* fields are mandatory to add your goal",
                    style: TextStyle(
                        color: Colors.grey, fontSize: R.sh(14, context)),
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
            if (ref.read(titleControllerProvider.notifier).state ==
                "Select dhikr") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Add a goal to continue"),
                ),
              );
            } else {
              final newGoal = GoalModel(
                title: titleController,
                meaning: noteController.text,
                targetValue: targetValueController.text == ""
                    ? 0
                    : int.parse(targetValueController.text),
                arabic: noteController.text,
              );
              setState(() {
                GoalFuncions().addGoal(newGoal);
                myGoals = GoalFuncions().getAllGoals();
              });
              log(myGoals.length.toString());
              Navigator.pop(context);
              clearNewGoalFields(ref);
            }
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
              ),
              SizedBox(width: R.sw(8, context)),
              Text(
                "Add to your Goals",
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
