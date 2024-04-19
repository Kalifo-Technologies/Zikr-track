import 'package:counter_app/services/shared%20services/shared_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  if (lastCount != null) {
    return lastCount!;
  } else {
    return 0;
  }
});
final tasbihNameProvider = StateProvider<String?>((ref) {
  if (lastTasbihName != null) {
    return lastTasbihName!;
  } else {
    return "";
  }
});
final targetValueProvider = StateProvider<int?>((ref) {
  if (lastTarget != null) {
    return lastTarget!;
  } else {
    return 0;
  }
});
final noteProvider = StateProvider<String?>((ref) {
  if (lastNote != null) {
    return lastNote!;
  } else {
    return "";
  }
});
