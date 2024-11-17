import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Constants/Constants.dart';
class CustomTransction extends StatelessWidget {
  final String? text;
  final String? routin_screen;
  final Color? colorfont ;
  final double? Sizefont ;
  final String ?iconData;
  final Color? colorIcon ;

  final Color colorBoxShadow ;
  final Color? colorAll ;
  final double? SizeWith ;
  final double? Sizehigh ;
  final Function? onpress ;

  CustomTransction({
    Key ?key,required this.text,required this.iconData,required this.colorAll,required this.colorIcon,required this.colorfont,required this.Sizefont, this.SizeWith,this.Sizehigh,required this.onpress, required this.colorBoxShadow, this.routin_screen
  }) : super(key: key);

// class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.r),
      child: Container(
        height: Sizehigh==null? 40.h:Sizehigh,
        width:SizeWith==null? 110.w:SizeWith,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: colorAll,
          boxShadow: [
            BoxShadow(color: colorBoxShadow, spreadRadius: 1,),
          ],
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: colorAll),
          onPressed: () {
           onpress!();
          },
          icon: Padding(
            padding:  EdgeInsets.only(top: 6.0.r,bottom: 6.0.r),
            child: Image.asset(iconData!,
              width: 25.r, height: 25.r,color: colorIcon,),
          ),
          label: Text(text!,style: TextStyle(
              fontSize: Sizefont,
              color: colorfont
          ),), // <-- Text
        ),
      ),
    );
  }

}