
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';

class NoInternet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: kColorsWhite,
      child: Center(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off_rounded,size: 150.r,)
           , Text('No internet connection'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kColorsPrimary),),
          ],
        ),
      ));
  }

}