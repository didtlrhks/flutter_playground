import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/providers/api_provider.dart';
import '../../../data/repositories/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider());
    Get.put(HomeRepository(apiProvider: Get.find()));
    Get.put(HomeController(repository: Get.find()));
  }
}
