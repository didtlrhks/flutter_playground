class HomeViewModel extends GetxController {
  final HomeRepository _repository;

  final RxBool isLoading = false.obs;
  final RxList<ItemModel> items = <ItemModel>[].obs;

  HomeViewModel(this._repository);

  Future<void> fetchItems() async {
    isLoading.value = true;
    try {
      items.value = await _repository.getItems();
    } catch (e) {
      // 에러 처리
    } finally {
      isLoading.value = false;
    }
  }
}
