import 'dart:async';

import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/router/route_constants.dart';
class LogOutController extends GetxController {

  LogOut(){
    stg.remove(OpenScreenlogen);
    stg.remove(OpenAppOne);
    stg.remove(token);
    stg.remove(UserType);
    stg.remove(UserIdd);
    stg.remove(MemberIdUser);
    stg.remove(photoUser);
    stg.remove(userPassword);
    Get.offAllNamed(RoutingApp.login_route);

  }
  LogOutChangestablishment(){
    stg.remove(OpenScreenlogen);
    stg.remove(OpenScreenMember);
    stg.remove(OpenAppOne);
    stg.remove(token);
    stg.remove(UserType);
    stg.remove(UserIdd);
    stg.remove(MemberIdUser);
    stg.remove(photoUser);
    stg.remove(userPassword);
    stg.remove(url);
    stg.remove(logo);
    stg.remove(photo);
    stg.remove(photoUser);
    Get.offAllNamed(RoutingApp.member_screen);

  }
}

