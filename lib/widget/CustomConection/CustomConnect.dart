import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Constants/Constants.dart';

class CustomConnection extends StatelessWidget {
  final String? text;
  final String? TypeConnection;
  final Color? colorfont ;
  final double? Sizefont ;
  final String ?iconData;
  final Color? colorIcon ;

  final Color? colorBoxShadow ;
  final bool? BoxShadowtruorfalse ;
  final Color? colorAll ;
  final double? SizeWith ;
  final double? Sizehigh ;
  final Function? onpress ;

  CustomConnection({
    Key ?key,required this.text, this.iconData, this.colorAll,required this.colorIcon,required this.colorfont, this.Sizefont, this.SizeWith,this.Sizehigh, this.onpress,  this.colorBoxShadow, this.TypeConnection,this.BoxShadowtruorfalse
  }) : super(key: key);
// class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizehigh==null? 20.h:Sizehigh,
       width:SizeWith==null? 125.w:SizeWith,
      decoration: BoxDecoration(
        borderRadius:BoxShadowtruorfalse==true? BorderRadius.circular(8.r):BorderRadius.circular(0.r),
        color: colorAll==null? kColorsPrimary:colorAll,
        boxShadow: [
          BoxShadow(color: colorBoxShadow==null? kColorsPrimary:colorBoxShadow!,spreadRadius: 1,),
        ],
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: colorAll==null? kColorbackgroundCard:colorAll,),
        onPressed: () {
          if(TypeConnection=='email'){
            onpress==null?(){}:launch('mailto:' + text!);
          }
          else if(TypeConnection=='connection'){
            onpress==null?(){}:showAlert(context,text!);
          }
          else if(TypeConnection=='ButtonIcon'){
            onpress!();
          }

        },
        icon:  Image.asset(iconData==null?"assets/Icons/phoneColore.png":iconData!, width: 15.r, height: 15.r,color: colorIcon==null? kColorsPrimary:colorIcon,),
        label: Container(
          child: Text(text==null?'':text!,style: TextStyle(
              fontSize: Sizefont==null?9.sp:Sizefont,
              color: colorfont==null?kColorsPrimary:colorfont
          ),),
        ), // <-- Text
      ),
    );
  }

  showAlert(BuildContext context,String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2.0,
          contentPadding: EdgeInsets.only(right: 8.0.r,left: 8.0.r),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
          content: Container(
            width: 0.7.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kColorsWhite,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  height: 40.0.h,
                  alignment: Alignment.center,
                  child: Text('Contact us'.tr,style: TextStyle(
                      fontSize: 12.sp,
                      color: kColorsPrimery,
                      fontWeight: FontWeight.bold),),
                ),
                InkWell(
                  onTap: () => launch('tel:' + phoneNumber),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kColorsPrimary,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    height: 40.0.h,

                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90.w,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  12.0.r,bottom:  12.0.r),
                          child: Image.asset(
                            'assets/Icons/phoneColore.png',
                            height: 20.h,
                            width: 20.w,
                            color: kColorsWhite,
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text('connection'.tr,style: TextStyle(color: kColorsWhite),),
                      ],
                    ),
                  ),
                ),
                Divider(height: 5.h),
                InkWell(
                  onTap: () => launch('sms:' + phoneNumber),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kColorsYallowTow,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    alignment: Alignment.center,
                    height: 40.0.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90.w,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  12.0.r,bottom:  12.0.r),
                          child: Image.asset(
                            'assets/Icons/sms.png',
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text('Message'.tr,style: TextStyle(color: kColorsWhite),),
                      ],
                    ),
                  ),
                ),
                Divider(height: 5.h),
                InkWell(
                  onTap: () => launch('https://wa.me/' + phoneNumber),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kColorsGreen,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    alignment: Alignment.center,
                    height: 40.0.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90.w,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  12.0.r,bottom:  12.0.r),
                          child: Image.asset(
                            'assets/Icons/watsap.png',
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text('WhatsApp'.tr,style: TextStyle(color: kColorsWhite),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("الغاء"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}