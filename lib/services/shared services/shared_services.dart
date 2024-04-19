import 'package:counter_app/main.dart';

const String keyUID = 'uid';
var uid = sharedPreferences!.getString(keyUID);

const String keyMode = 'mode';
var mode = sharedPreferences!.getBool(keyMode);

const String lastSelectedTasbihName = 'last tasbih name';
var lastTasbihName = sharedPreferences!.getString(lastSelectedTasbihName);

const String lastSelectedCount = 'last Count';
var lastCount = sharedPreferences!.getInt(lastSelectedCount);

const String lastSelectedTarget = 'last Target';
var lastTarget = sharedPreferences!.getInt(lastSelectedTarget);

const String lastSelectedNote = 'last Note';
var lastNote = sharedPreferences!.getString(lastSelectedNote);
