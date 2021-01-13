import 'package:get/get.dart';
import 'package:naijaratesapp/models/currency_model.dart';
import 'package:naijaratesapp/models/usdtongn_model.dart';
import 'package:naijaratesapp/services/remote_services.dart';

class CurrencyController extends GetxController {
  var isLoading = true.obs;
  var usdtongnDetail = UsdtongnModel().obs;
  var currencyDetail = CurrencyModel().obs;
  var allCurrencies = <String>[].obs;
  var fromCurrency = "USD".obs;
  var toCurrency = "GBP".obs;

  @override
  void onInit() {
    loadCurrencies();
    getUsdtoNgn();
    // TODO: implement onInit
    super.onInit();
  }

  void loadCurrencies() async {
    try {
      isLoading(true);
      var currencies = await RemoteServices.loadCurrencies();
      if (currencies != null) {
        allCurrencies.assignAll(currencies);
        print(currencies.toString());
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }

  void getUsdtoNgn() async {
    try {
      isLoading(true);
      var usdtongn = await RemoteServices.getUsdToNgn();
      if (usdtongn != null) {
        usdtongnDetail.value = usdtongn;
        // print(usdtongnDetail.value.usdNgn);
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }

  void fetchCurrencyDetails() async {
    try {
      isLoading(true);
      var currency =
          await RemoteServices.fetchCurrencyDetails(fromCurrency.value, "USD");
      if (currency != null) {
        currencyDetail.value = currency;
        print("hiii ${currency.toJson()}");
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }
}
