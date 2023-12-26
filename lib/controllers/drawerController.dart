import 'package:get/get.dart';
class DrawerViewModel extends GetxController{
  RxBool isAttendee = true.obs;
  void attendeeRole(){
    isAttendee.value = true;
  }
void organizerRole(){
    isAttendee.value = false;
  }

}