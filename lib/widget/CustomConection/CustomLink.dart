import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Constants/Constants.dart';

class CustomLinkWebsit extends StatelessWidget {
  final String? text;
  final Color? colorfont ;
  final double? Sizefont ;
  final String ?iconData;
  final Color? colorIcon ;

  final Color? colorBoxShadow ;
  final Color? colorAll ;
  final double? SizeWith ;
  final double? Sizehigh ;
  final Function? onpress ;

  CustomLinkWebsit({
    Key ?key,required this.text, this.iconData, this.colorAll,required this.colorIcon,required this.colorfont, this.Sizefont, this.SizeWith,this.Sizehigh, this.onpress,  this.colorBoxShadow
  }) : super(key: key);
// class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 15.0.r, bottom: 6.0.r, top: 5.0.r),
      child: Container(
        height: Sizehigh==null? 35.h:Sizehigh,
        width:SizeWith==null? 150.w:SizeWith,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: colorAll==null? kColorsPrimaryFont:colorAll,
          boxShadow: [
            BoxShadow(color: colorBoxShadow==null? kColorsPrimaryFont:colorBoxShadow!, spreadRadius: 1,),
          ],
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorAll==null? kColorsPrimaryFont:colorAll),
          onPressed: () {
            onpress==null?(){}:onpress;
          },
          icon: Padding(
            padding: EdgeInsets.all(2.0.r),
            child: Image.asset(
              iconData==null?"assets/Icons/link.png":iconData!,
              width: 25.r,
              height: 25.r,
              color: colorIcon==null? kColorsWhite:colorIcon,
            ),
          ),
          label: Text(text==null?'':text! + '         ',
              style: TextStyle(
                  fontSize: Sizefont==null?15.sp:Sizefont,
                  color: colorfont==null?kColorsPrimaryFont:colorfont,
                  fontWeight: FontWeight.bold)), // <-- Text
        ),
      ),
    );
  }
}