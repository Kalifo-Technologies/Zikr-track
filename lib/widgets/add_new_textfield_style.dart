import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewTextFieldStyleWidget extends ConsumerWidget {
  const AddNewTextFieldStyleWidget({
    super.key,
    required this.context,
    required this.text,
    required this.controller,
    required this.height,
    required this.maxLines,
    required this.iconData,
    required this.type,
  });

  final BuildContext context;
  final String text;
  final TextEditingController controller;
  final double height;
  final int maxLines;
  final IconData? iconData;
  final TextInputType? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: R.sw(18, context),
            fontWeight: FontWeight.w600,
            color: C.textColor(ref),
          ),
        ),
        SizedBox(height: R.sh(10, context)),
        // Gap(R.sh(8, context)),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: C.tileColor(ref),
            border: Border.all(
              width: 1.5,
              color: C.tileBorderColor(ref),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: TextFormField(
            maxLines: maxLines,
            controller: controller,
            style: TextStyle(color: C.textColor(ref)),
            keyboardType: type,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: R.sw(24, context),
                vertical: R.sh(12, context),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) => const Scaffold(),
                  );
                },
                child: Icon(
                  iconData,
                ),
              ),
            ),
          ),
        ),
        // Gap(R.sh(20, context)),
      ],
    );
  }
}
