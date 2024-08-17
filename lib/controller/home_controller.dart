import 'package:get/get.dart';
import 'package:my_app_ecommerce/model/ad_banner.dart';
import 'package:my_app_ecommerce/service/remote_service/remote_banner_service.dart';

class HomeController extends GetxController{
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;

  @override
  void onInit() {
    getAdBanner();
    super.onInit();
  }

  void getAdBanner() async{
   try{
      isBannerLoading(true);
      var result = await RemoteBannerService().get();
      if (result != null){
        bannerList.assignAll(adBannerListFromJson(result.body));
      }
   }finally{
    print(bannerList.first.image);
     isBannerLoading(false);
   }
  }
}