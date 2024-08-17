import 'package:get/get.dart';

class DashboardController extends GetxController{
  var tapIndex = 0;

  void updateIndex(int index){
    tapIndex = index;
    update();
  }
}

