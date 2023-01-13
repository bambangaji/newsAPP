import 'package:get/get.dart';
import 'package:techinical/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    //Cannot using tag because the controller used in GetView
    Get.put<MainController>(MainController(), permanent: true);
  }
}
