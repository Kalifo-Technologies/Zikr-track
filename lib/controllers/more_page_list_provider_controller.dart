import 'package:counter_app/models/more_page_listtile_model.dart';
import 'package:counter_app/pages/more%20page/sub%20pages/appearance%20page/appearance_page.dart';
// import 'package:counter_app/pages/more%20page/sub%20pages/info%20page/info_page.dart';
// import 'package:counter_app/pages/more%20page/sub%20pages/language%20page/language_page.dart';
// import 'package:counter_app/pages/more%20page/sub%20pages/notifications%20page/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late BuildContext context;

class MorePageListControllerNotifier
    extends StateNotifier<List<MorePageListTile>> {
  MorePageListControllerNotifier()
      : super([
          MorePageListTile(
            title: "Appearance",
            iconData: Icons.palette_outlined,
            page: const AppearancePage(),
          ),
          // MorePageListTile(
          //   title: "Language",
          //   iconData: Icons.translate_outlined,
          //   page: const LanguagePage(),
          // ),
          // MorePageListTile(
          //   title: "Notifications",
          //   iconData: Icons.circle_notifications_outlined,
          //   page: const NotificationsPage(),
          // ),
          // MorePageListTile(
          //   title: "Info",
          //   iconData: Icons.info_outline,
          //   page: const InfoPage(),
          // ),
          // MorePageListTile(
          //   title: "Rate this App",
          //   iconData: Icons.star_border,
          //   page: const Scaffold(),
          // ),
        ]);
}

final morePageListProviderController = StateNotifierProvider<
    MorePageListControllerNotifier, List<MorePageListTile>>(
  (ref) => MorePageListControllerNotifier(),
);
