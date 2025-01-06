import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GetSnackMsg{

  String msg;
  Color bgClr;
  Color txClr;
 final SnackPosition? snackPosition;
  GetSnackMsg( {required this.msg,this.bgClr=Colors.red,this.txClr=Colors.white,this.snackPosition, });

  showTxt(){
    return Get.showSnackbar(
        GetBar(

      messageText: Text(
        msg,
        textAlign: TextAlign.center,
        style:   TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
      duration: const Duration(milliseconds: 2000),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: bgClr,
      dismissDirection: DismissDirection.horizontal,
      snackPosition:snackPosition?? SnackPosition.BOTTOM,
    ));
  }
}