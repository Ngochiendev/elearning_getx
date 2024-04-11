import 'package:elearning/app/data/models/bank_model.dart';
import 'package:get/get.dart';

class BankService extends GetxService {
  var selected = Bank().obs;

  void setCurrentBank(Bank val) {
    selected.value = val;
  }
}
