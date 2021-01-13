import 'package:get/get.dart';
import 'package:naijaratesapp/models/gold_model.dart';
import 'package:naijaratesapp/services/remote_services.dart';

class GoldController extends GetxController {
  var isLoading = true.obs;
  var goldDetail = GoldModel().obs;

  @override
  void onInit() {
    featchGoldDetails();
    super.onInit();
  }

  void featchGoldDetails() async {
    try {
      isLoading(true);
      var gold = await RemoteServices.fetechGold();
      if (gold != null) {
        goldDetail.value = gold;
        print(gold.toJson());
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }
}
