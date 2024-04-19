import 'package:counter_app/controllers/more_page_list_provider_controller.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:counter_app/utilities/more_page_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(morePageListProviderController);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: R.sw(2, context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: R.sw(14, context),
                ),
                child: Text(
                  'More',
                  style: TextStyle(
                    fontSize: R.sh(34, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: R.sh(5, context),
              ),
              SizedBox(
                height: R.sh(list.length * 60, context),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        listTileOntap(
                          context,
                          list[index].page,
                        );
                      },
                      title: Text(
                        list[index].title,
                        style: TextStyle(
                          fontSize: R.sw(16, context),
                        ),
                      ),
                      leading: Icon(
                        list[index].iconData,
                        color: C.textColor(ref),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: C.textColor(ref),
                        size: R.sw(12, context),
                      ),
                    );
                  },
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
