import 'package:counter_app/main.dart';
import 'package:counter_app/providers/app_theme_provider.dart';
import 'package:counter_app/providers/counter_page_provider.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/services/shared%20services/shared_services.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArchivePage extends ConsumerStatefulWidget {
  const ArchivePage({super.key});

  @override
  ConsumerState<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends ConsumerState<ArchivePage> {
  @override
  Widget build(BuildContext context) {
    // final archives = ref.watch(newTasbihProviderController);
    // final archives = ref.read(getAllGoalsProvider);

    final themeMode = ref.watch(themeModeProvider);
    var tileColor =
        themeMode == ThemeMode.light ? Colors.white : Colors.grey[900];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: R.sw(16, context),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: themeMode == ThemeMode.light
            ? Colors.grey[100]
            : const Color(0xFF0B0B0B),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Goals",
          style: TextStyle(
            fontSize: R.sh(36, context),
            fontWeight: FontWeight.bold,
            color: C.textColor(ref),
          ),
        ),
      ),
      body:
          // archives.when(
          //   data: (data) {
          //     return data!.goals.isEmpty
          //         ? SizedBox(
          //             height: R.sh(660, context),
          //             child: const Center(
          //               child: Text("You don't have any goals yet."),
          //             ),
          //           )
          //         : SizedBox(
          //             height: data.goals.length * R.sh(120, context),
          //             child: ListView.builder(
          //               itemBuilder: (context, index) {
          //                 final reversedIndex = data.goals.length - 1 - index;
          //                 final archive = data.goals[reversedIndex];
          //                 return Container(
          //                   margin: EdgeInsets.only(
          //                       left: R.sw(16, context),
          //                       right: R.sw(16, context),
          //                       bottom: index == data.goals.length - 1
          //                           ? R.sh(24, context)
          //                           : 0,
          //                       top: R.sh(24, context)),
          //                   padding: const EdgeInsets.all(8),
          //                   decoration: BoxDecoration(
          //                     color: tileColor,
          //                     borderRadius: BorderRadius.circular(20),
          //                   ),
          //                   child: ListTile(
          //                     onTap: () {
          //                       ref.read(tasbihNameProvider.notifier).state =
          //                           archive.selectDhikr;
          //                       ref.read(targetValueProvider.notifier).state =
          //                           archive.setAmount;
          //                       ref.read(noteProvider.notifier).state =
          //                           archive.note;
          //                       ref.read(counterProvider.notifier).state = 0;
          //                       Navigator.pop(context);
          //                     },
          //                     title: Text(
          //                       archive.selectDhikr,
          //                       style: TextStyle(
          //                         fontSize: R.sh(18, context),
          //                         fontWeight: FontWeight.w600,
          //                       ),
          //                     ),
          //                     subtitle: archive.note == ""
          //                         ? const SizedBox()
          //                         : Text(
          //                             archive.note,
          //                             style: TextStyle(
          //                               fontSize: R.sh(18, context),
          //                               fontWeight: FontWeight.w600,
          //                               color: Colors.grey[500],
          //                             ),
          //                           ),
          //                     trailing: Text(
          //                       "${archive.setAmount}",
          //                       style: TextStyle(fontSize: R.sh(26, context)),
          //                     ),
          //                   ),
          //                 );
          //               },
          //               itemCount: data.goals.length,
          //             ),
          //           );
          //   },
          //   error: (error, stackTrace) => const Center(
          //     child: Text("Failed to fetch goals"),
          //   ),
          //   loading: () => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
          myGoals.isEmpty
              ? SizedBox(
                  height: R.sh(660, context),
                  child: const Center(
                    child: Text("You don't have any goals yet."),
                  ),
                )
              : SizedBox(
                  height: myGoals.length * R.sh(120, context),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final reversedIndex = myGoals.length - 1 - index;
                      final archive = myGoals[reversedIndex];
                      return Container(
                        margin: EdgeInsets.only(
                            left: R.sw(16, context),
                            right: R.sw(16, context),
                            bottom: index == myGoals.length - 1
                                ? R.sh(24, context)
                                : 0,
                            top: R.sh(24, context)),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: tileColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              sharedPreferences!.setString(
                                  lastSelectedTasbihName, archive.title);
                              sharedPreferences!.setInt(
                                  lastSelectedTarget, archive.targetValue);
                              sharedPreferences!.setInt(lastSelectedCount, 0);
                              sharedPreferences!
                                  .setString(lastSelectedNote, archive.arabic);

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
                                  sharedPreferences!.getInt(lastSelectedCount)!;
                            });
                            Navigator.pop(context);
                          },
                          title: Text(
                            archive.title,
                            style: TextStyle(
                              fontSize: R.sh(18, context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: archive.arabic == ""
                              ? const SizedBox()
                              : Text(
                                  archive.arabic,
                                  style: TextStyle(
                                    fontSize: R.sh(18, context),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500],
                                  ),
                                ),
                          trailing: Text(
                            archive.targetValue == 0
                                ? ""
                                : "${archive.targetValue}",
                            style: TextStyle(fontSize: R.sh(26, context)),
                          ),
                        ),
                      );
                    },
                    itemCount: myGoals.length,
                  ),
                ),
    );
  }
}
