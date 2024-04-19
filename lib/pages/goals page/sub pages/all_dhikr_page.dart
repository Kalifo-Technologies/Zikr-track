import 'package:counter_app/controllers/all_tasbih_provider_controller.dart';
import 'package:counter_app/providers/add_new_goal_provider.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AllDhikrPage extends ConsumerWidget {
  const AllDhikrPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDhikrs = ref.watch(allDhikrsProviderController);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(R.sh(88, context)),
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(
              horizontal: R.sw(16, context),
              vertical: R.sh(20, context),
            ),
            child: Text(
              'Select dhikr',
              style: TextStyle(
                fontSize: R.sh(34, context),
                fontWeight: FontWeight.bold,
                color: C.textColor(ref),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: R.sw(16, context),
            right: R.sw(16, context),
            top: R.sh(8, context),
            bottom: R.sh(16, context),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: C.tileColor(ref),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                onTap: () {
                  ref.read(titleControllerProvider.notifier).state =
                      allDhikrs[index].title;
                  Navigator.pop(context);
                  ref.read(targetValueControllerProvider.notifier).state.text =
                      allDhikrs[index].targetValue.toString();
                  ref.read(noteControllerProvider.notifier).state.text =
                      allDhikrs[index].arabic;
                },
                title: Text(
                  allDhikrs[index].arabic,
                  style: TextStyle(
                    fontSize: R.sh(20, context),
                    fontWeight: FontWeight.w600,
                    color: C.textColor(ref),
                  ),
                ),
                subtitle: Text(
                  allDhikrs[index].title,
                  style: TextStyle(
                    fontSize: R.sh(16, context),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Gap(R.sh(0, context)),
        itemCount: allDhikrs.length,
      ),
    );
  }
}
