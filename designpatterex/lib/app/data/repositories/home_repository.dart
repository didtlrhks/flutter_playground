import '../providers/api_provider.dart';
import '../models/item_model.dart';

class HomeRepository {
  final ApiProvider apiProvider;

  HomeRepository({required this.apiProvider});

  Future<List<ItemModel>> getItems() async {
    // 데이터 요청 로직
    return [];
  }
}
