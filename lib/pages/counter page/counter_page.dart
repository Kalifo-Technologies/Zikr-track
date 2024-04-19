import 'package:counter_app/main.dart';
import 'package:counter_app/pages/counter%20page/sub%20pages/archive_page.dart';
import 'package:counter_app/providers/counter_page_provider.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/services/shared%20services/shared_services.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:counter_app/widgets/my_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerStatefulWidget {
  const CounterPage({
    super.key,
  });

  @override
  ConsumerState<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends ConsumerState<CounterPage> {
  @override
  Widget build(BuildContext context) {
    int? count = ref.watch(counterProvider);
    String? tasbihName = ref.watch(tasbihNameProvider);
    int? targetValue = ref.watch(targetValueProvider);
    String? note = ref.watch(noteProvider);

    sharedPreferences!.setString(lastSelectedTasbihName, tasbihName!);
    sharedPreferences!.setInt(lastSelectedCount, count!);
    sharedPreferences!.setInt(lastSelectedTarget, targetValue!);
    sharedPreferences!.setString(lastSelectedNote, note!);

    tasbihName = sharedPreferences!.getString(lastSelectedTasbihName)!;
    count = sharedPreferences!.getInt(lastSelectedCount)!;
    targetValue = sharedPreferences!.getInt(lastSelectedTarget);
    note = sharedPreferences!.getString(lastSelectedNote);

    return GestureDetector(
      onTap: () {
        if (count! < targetValue! || targetValue == 0) {
          ref.read(counterProvider.notifier).state++;
          sharedPreferences!
              .setInt(lastSelectedCount, ref.watch(counterProvider));
          // count++;
        }
        if (targetValue != 0 && count == targetValue) {
          showModalBottomSheet(
            context: context,
            builder: (context) => MyBottomSheet(
              ref: ref,
              title: "Target Reached",
              subtitle:
                  "The target value has been reached. Would\nyou like to reset the counter?",
              subtitleHeight: R.sh(60, context),
              ontap: () {
                ref.read(counterProvider.notifier).state = 0;
                sharedPreferences!
                    .setInt(lastSelectedCount, ref.watch(counterProvider));
                // count = 0;
              },
            ),
          );
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(R.sh(100, context)),
          child: AppBar(
            flexibleSpace: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 16),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: R.sh(34, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            actions: [
              tasbihName != ""
                  ? IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => MyBottomSheet(
                            ref: ref,
                            title: "Reset All",
                            subtitle:
                                "Are you sure you want to reset all the data?",
                            subtitleHeight: 40,
                            ontap: () {
                              setState(() {
                                sharedPreferences!
                                    .setString(lastSelectedTasbihName, "");
                                sharedPreferences!.setInt(lastSelectedCount, 0);
                                sharedPreferences!
                                    .setInt(lastSelectedTarget, 0);
                                sharedPreferences!
                                    .setString(lastSelectedNote, "");

                                ref.read(tasbihNameProvider.notifier).state =
                                    sharedPreferences!
                                        .getString(lastSelectedTasbihName)!;
                                ref.read(targetValueProvider.notifier).state =
                                    sharedPreferences!
                                        .getInt(lastSelectedTarget)!;
                                ref.read(noteProvider.notifier).state =
                                    sharedPreferences!
                                        .getString(lastSelectedNote)!;
                                ref.read(counterProvider.notifier).state =
                                    sharedPreferences!
                                        .getInt(lastSelectedCount)!;
                              });
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.history,
                      ),
                    )
                  : const SizedBox(),
            ],
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: R.sw(16, context),
            vertical: R.sh(50, context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                note!,
                style: TextStyle(
                  fontSize: R.sw(36, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: R.sh(5, context)),
              Text(
                tasbihName,
                style: TextStyle(
                  fontSize: R.sw(20, context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: R.sh(5, context)),
              targetValue == 0
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Target: $targetValue",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: R.sw(20, context),
                          ),
                        ),
                      ],
                    ),
              targetValue == 0
                  ? const SizedBox()
                  : SizedBox(
                      height: R.sh(50, context),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: C.iconBGColor(ref),
                    child: IconButton(
                      onPressed: () {
                        if (count != 0) {
                          ref.read(counterProvider.notifier).state--;
                          sharedPreferences!.setInt(
                              lastSelectedCount, ref.watch(counterProvider));
                          // count--;
                        }
                      },
                      icon: Icon(
                        Icons.undo,
                        color: C.textColor(ref),
                      ),
                    ),
                  ),
                  Text(
                    "$count",
                    style: TextStyle(
                      fontSize: R.sw(100, context),
                      fontFamily: "aAhlanWasahlan",
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: C.iconBGColor(ref),
                    child: IconButton(
                      onPressed: () {
                        count == 0
                            ? null
                            : showModalBottomSheet(
                                context: context,
                                builder: (context) => MyBottomSheet(
                                  ref: ref,
                                  title: "Reset Counter",
                                  subtitle:
                                      "Are you sure you want to reset the counter?",
                                  subtitleHeight: 40,
                                  ontap: () {
                                    ref.read(counterProvider.notifier).state =
                                        0;
                                    sharedPreferences!.setInt(lastSelectedCount,
                                        ref.watch(counterProvider));
                                    // count = 0;
                                  },
                                ),
                              );
                      },
                      icon: Icon(
                        Icons.restart_alt,
                        color: C.textColor(ref),
                      ),
                    ),
                  )
                ],
              ),
            ],
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
                builder: (context) => const ArchivePage(),
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
                  "Select a dhikr from your Goals",
                  style: TextStyle(
                      fontSize: R.sh(16, context), fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
