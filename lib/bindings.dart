import 'package:fast_app/Screens/Admin/controller/temp.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempController>(() => TempController());
  }
}
