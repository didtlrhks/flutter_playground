class HomePage extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? LoadingWidget()
            : ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(item: controller.items[index]);
                },
              ),
      ),
    );
  }
}
