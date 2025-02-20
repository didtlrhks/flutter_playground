import 'package:get/get.dart';
import '../../../data/repositories/home_repository.dart';
import '../../../data/models/item_model.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  HomeController({required this.repository});

  final RxList<ItemModel> items = <ItemModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  Future<void> fetchItems() async {
    isLoading.value = true;
    try {
      items.value = await repository.getItems();
    } finally {
      isLoading.value = false;
    }
  }
}
