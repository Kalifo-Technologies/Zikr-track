import 'package:counter_app/controllers/all_tasbih_provider_controller.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AllDhikrInfoPage extends ConsumerWidget {
  const AllDhikrInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDhikrs = ref.watch(allDhikrsProviderController);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(R.sh(100, context)),
        child: AppBar(
          flexibleSpace: SizedBox(
            height: R.sh(160, context),
            child: Padding(
              padding: EdgeInsets.only(
                top: R.sh(50, context),
                left: R.sw(16, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "General Dhikr",
                    style: TextStyle(
                      fontSize: R.sh(34, context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          // title: Text("General Dhikr",
          //     style: TextStyle(
          //         fontSize: R.sh(36, context), fontWeight: FontWeight.bold)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: R.sw(16, context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: R.sh(allDhikrs.length * 190, context),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? R.sh(16, context) : 0,
                      bottom:
                          index == allDhikrs.length - 1 ? R.sh(16, context) : 0,
                    ),
                    child: Container(
                      height: R.sh(175, context),
                      decoration: BoxDecoration(
                        color: C.tileColor(ref),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: C.tileBorderColor(ref),
                        ),
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            const Spacer(),
                            Text(
                              allDhikrs[index].arabic,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: R.sw(22, context),
                                color: C.textColor(ref),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: R.sh(20, context)),
                            Text(
                              allDhikrs[index].title,
                              style: TextStyle(
                                fontSize: R.sh(16, context),
                                fontWeight: FontWeight.w600,
                                color: C.textColor(ref),
                              ),
                            ),
                            SizedBox(
                              height: R.sh(5, context),
                            ),
                            Text(
                              allDhikrs[index].meaning,
                              style: TextStyle(
                                fontSize: R.sh(16, context),
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Gap(R.sh(12, context)),
                  itemCount: allDhikrs.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
