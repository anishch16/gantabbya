import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../estimated_cost/controllers/estimated_cost_controller.dart';

class HistoryController extends GetxController {
  final box = GetStorage();

  List<HistoryModel> models = [];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() {
    List storedData = box.read('models') ?? [];
    models = storedData
        .map((m) => HistoryModel.fromMap(m))
        .toList()
        .where((m) => m.userName == box.read('user'))
        .toList();
  }
}
