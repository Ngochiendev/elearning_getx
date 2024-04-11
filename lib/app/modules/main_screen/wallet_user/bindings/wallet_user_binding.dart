import 'package:get/get.dart';

import '../controllers/wallet_user_controller.dart';

class WalletUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletUserController>(
      () => WalletUserController(),
    );
  }
}
