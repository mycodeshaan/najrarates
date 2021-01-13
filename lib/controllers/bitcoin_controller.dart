import 'package:get/get.dart';
import 'package:naijaratesapp/models/bitcoin_model.dart';
import 'package:naijaratesapp/services/remote_services.dart';

class BitcoinController extends GetxController {
  var isLoading = true.obs;
  var bitcoinDetail = BitcoinModel().obs;
  var currency = "USD".obs;

  @override
  void onInit() {
    featchBitcoinDetails();
    super.onInit();
  }

  void featchBitcoinDetails() async {
    try {
      isLoading(true);
      var bitcoin = await RemoteServices.fetchBitcoin(currency.value);
      if (bitcoin != null) {
        bitcoinDetail.value = bitcoin;
        print(bitcoin.toJson());
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }
}
