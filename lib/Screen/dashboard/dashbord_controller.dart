import 'package:projectmanagers/Constants/Constants.dart';
import 'package:get/get.dart';

class DashBordController extends GetxController  {
  late RxString CounsilId="".obs;
  late RxString memberTypeName="".obs;

  late RxInt currentIndex=0.obs;

  void onInit() async {
    memberTypeName.value=stg.read(UserType.toString())??" ";
    super.onInit();

  }
  @override
  void onReady() {
    print("ready");
    super.onReady();
  }

}

