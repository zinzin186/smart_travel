

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Utils {
  Utils._();

  static bool isNativeSwipeBackEnabled = true;
  static void updateNativeSwipeBackGesture() {
    if (!isNativeSwipeBackEnabled && Get.routing.route?.isFirst == true) {
      isNativeSwipeBackEnabled = true;
      // Deeplink.enableNativeSwipeBackGesture();
    } else if (isNativeSwipeBackEnabled &&
        Get.routing.route?.isFirst == false) {
      isNativeSwipeBackEnabled = false;
      // Deeplink.disableNativeSwipeBackGesture();
    }
  }
}