import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';

class ProfileProvider extends BaseProvider {
  static final ProfileProvider instance = ProfileProvider._internal();

  ProfileProvider._internal() {
    initProvider("BASE_API_QUESTION");
  }

  Future<ApiResult> getHistoryEPoint() async =>
      await GET('u/wallets/history?balanceType=EPOINT');
}
