import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import '../../services/globals.dart' as globals;
import 'package:http/http.dart' as http;

class VnPayProvider extends BaseProvider {
  static final VnPayProvider instance = VnPayProvider._internal();

  VnPayProvider._internal() {
    initProvider("BASE_VNPAY");
  }

  Future<ApiResult> createVnpay(List<String> orders, String userID,
      String vnp_bank_code, String vnp_ip_addr, String vnp_return_url) async {
    return await POSTWITHHEADER("api/v1/payments/vnpay", <String, dynamic>{
      "balance_type": "vnd",
      "note": "string",
      "order_type": "190004",
      "orders": orders,
      "payment_method": "vnpay",
      "vnp_bank_code": vnp_bank_code,
      "vnp_ip_addr": vnp_ip_addr,
      "vnp_return_url": vnp_return_url
    }, {
      'Authorization': 'Bearer ${globals.accessToken}',
      "X-Merchant-Code": "e-learning",
      "X-User-ID": userID,
    });
  }
}
