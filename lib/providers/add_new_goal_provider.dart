import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleControllerProvider = StateProvider((ref) => "Select dhikr *");
final targetValueControllerProvider =
    StateProvider((ref) => TextEditingController());
final noteControllerProvider = StateProvider((ref) => TextEditingController());

final customTitleControllerProvider =
    StateProvider((ref) => TextEditingController());
final customTranslationControllerProvider =
    StateProvider((ref) => TextEditingController());
