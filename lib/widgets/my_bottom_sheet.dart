// ignore_for_file: must_be_immutable

import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MyBottomSheet extends StatelessWidget {
  final WidgetRef ref;
  final String title;
  final String subtitle;
  final double subtitleHeight;
  Function ontap;
  MyBottomSheet({
    super.key,
    required this.ref,
    required this.title,
    required this.subtitle,
    required this.subtitleHeight,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: C.bottomSheetColor(ref),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      height: R.sh(260, context),
      padding: EdgeInsets.all(R.sh(20, context)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: R.sw(20, context),
                      fontWeight: FontWeight.bold,
                      color: C.textColor(ref),
                    ),
                  ),
                  SizedBox(
                    height: R.sh(subtitleHeight, context),
                    width: R.sw(300, context),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: R.sw(13, context),
                        color: C.textColor(ref),
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              // CircleAvatar(
              //   backgroundColor: C.iconBGColor(ref),
              //   radius: R.sw(14, context),
              //   child: IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: Icon(
              //       Icons.close,
              //       color: C.textColor(ref),
              //       size: R.sw(14, context),
              //     ),
              //   ),
              // ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: C.tileColor(ref),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(
                Icons.done,
                color: C.textColor(ref),
              ),
              title: const Text("Yes"),
              onTap: () {
                ontap();

                Navigator.pop(context);
              },
              // tileColor: Colors.black12,
            ),
          ),
          Gap(R.sh(8, context)),
          Container(
            decoration: BoxDecoration(
              color: C.tileColor(ref),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(
                Icons.close,
                color: C.textColor(ref),
              ),
              title: const Text("No"),
              onTap: () {
                Navigator.pop(context);
              },
              tileColor: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
