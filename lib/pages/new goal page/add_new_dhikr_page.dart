import 'package:counter_app/providers/add_new_goal_provider.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewDhikrPage extends ConsumerWidget {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  const AddNewDhikrPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController titleController =
        ref.watch(customTitleControllerProvider);
    TextEditingController translationController =
        ref.watch(customTranslationControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Add new dhikr",
          style: TextStyle(
              fontSize: R.sh(18, context), fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: R.sw(24, context), vertical: R.sh(12, context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CustomDhikrTextFormField(
              //   controller: titleController,
              //   title: "Title",
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title *",
                    style: TextStyle(
                      fontSize: R.sw(18, context),
                      fontWeight: FontWeight.w600,
                      color: C.textColor(ref),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: R.sh(10, context)),
                    child: Container(
                      height: R.sh(60, context),
                      decoration: BoxDecoration(
                        color: C.tileColor(ref),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: C.tileBorderColor(ref),
                        ),
                      ),
                      child: Form(
                        key: globalKey,
                        child: TextFormField(
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : "This field is required",
                          controller: titleController,
                          style: TextStyle(color: C.textColor(ref)),
                          decoration: InputDecoration(
                            hintText: null,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: R.sw(24, context),
                              vertical: R.sh(12, context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Text(
                "You can write the required dhikr here to add to your goals.",
                style:
                    TextStyle(color: Colors.grey, fontSize: R.sh(14, context)),
              ),
              SizedBox(
                height: R.sh(25, context),
              ),
              // CustomDhikrTextFormField(
              //   controller: translationController,
              //   title: "Translation",
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Translation / Notes",
                    style: TextStyle(
                        fontSize: R.sw(18, context),
                        fontWeight: FontWeight.w600,
                        color: C.textColor(ref)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: R.sh(10, context)),
                    child: Container(
                      height: R.sh(60, context),
                      decoration: BoxDecoration(
                        color: C.tileColor(ref),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: C.tileBorderColor(ref),
                        ),
                      ),
                      child: TextFormField(
                        controller: translationController,
                        style: TextStyle(color: C.textColor(ref)),
                        decoration: InputDecoration(
                          hintText: null,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: R.sw(24, context),
                            vertical: R.sh(12, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Add special notes or the translation to understand the right meaning of the dhikr.",
                    style: TextStyle(
                        color: Colors.grey, fontSize: R.sh(14, context)),
                  ),
                  SizedBox(
                    height: R.sh(40, context),
                  ),
                  Center(
                    child: Text(
                      "* fields are mandatory to continue",
                      style: TextStyle(
                          color: Colors.grey, fontSize: R.sh(14, context)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: R.sh(60, context),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      width: 1.5,
                      color: C.tileBorderColor(ref),
                    ),
                  ),
                  backgroundColor: C.tileColor(ref),
                  elevation: 0,
                ),
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    ref.read(titleControllerProvider.notifier).state =
                        titleController.text;
                    ref.read(noteControllerProvider.notifier).state.text =
                        translationController.text;
                    Navigator.pop(context);
                    titleController.clear();
                    translationController.clear();
                  }
                },
                label: Text(
                  "Add",
                  style: TextStyle(
                    color: C.textColor(ref),
                    fontSize: R.sh(16, context),
                  ),
                ),
                icon: Icon(
                  Icons.add,
                  color: C.textColor(ref),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     if (globalKey.currentState!.validate()) {
      //       ref.read(titleControllerProvider.notifier).state =
      //           titleController.text;
      //       ref.read(noteControllerProvider.notifier).state.text =
      //           translationController.text;
      //       Navigator.pop(context);
      //       titleController.clear();
      //       translationController.clear();
      //     }
      //   },
      //   label: SizedBox(
      //     width: R.sw(260, context),
      //     child: const Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.add),
      //         Text("Add"),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CustomDhikrTextFormField extends StatelessWidget {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final TextEditingController controller;
  final String title;
  const CustomDhikrTextFormField({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Padding(
          padding: EdgeInsets.symmetric(vertical: R.sh(12, context)),
          child: Container(
            height: R.sh(50, context),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Form(
              key: globalKey,
              child: TextFormField(
                validator: (value) =>
                    value!.isNotEmpty ? "This field is required" : null,
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Write here",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: R.sw(24, context),
                    vertical: R.sh(12, context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
