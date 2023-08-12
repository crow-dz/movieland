
import 'package:get/get.dart';
import 'package:movieland/model/top_rated_tv.dart';

import '../data/fetch_data.dart';


class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList moives = ['s1', 's2', 's3'].obs;
  RxList episode = ['ep1', 'ep2', 'ep3'].obs;
  TopRatedTv? topRatedTv;

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchTopRatedTv();
  }

  change(int index) {
    selectedIndex.value = index;
    update();
  }


}
