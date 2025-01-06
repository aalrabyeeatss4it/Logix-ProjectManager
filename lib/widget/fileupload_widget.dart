
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/apiservice/file_piker.dart';
import 'package:projectmanagers/widget/CustomText.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/apiservice/file_piker.dart';
class FileUploadCustom extends StatelessWidget {
  const FileUploadCustom({Key? key, required this.controller, required this.name, this.onDone}) : super(key: key);
final FilePickerController controller;
final String name;
final Function? onDone;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
          if(onDone!=null){
            onDone!();
          }else{
            print("filePath="+controller.filePath);
            print("name="+controller.name);
          await controller.getFilePath( );
        }},
          child: Padding(
            padding:  EdgeInsets.all(6.0.r),
            child:DottedBorder(
              borderType: BorderType.Rect,
              radius: Radius.circular(70.r),
              dashPattern: [9, 9],
              color: kColorsBlackTow.withOpacity(0.7),
              strokeWidth: 1,
              child: Container(
                height:0.045.sh ,
                width: 0.35.sw,
                decoration: BoxDecoration(
                  color: Color(0xff178CAF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssestData.uplode,
                      width: 21,
                      height: 13,
                      color:  kColorsBlackTow.withOpacity(0.7),
                    ),
                    SizedBox(width: 0.015.sw,),
                    Text('download'.tr,style:
                      TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color:  kColorsBlackTow.withOpacity(0.7),
                    ),)
                  ],),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(child: CustomText(text:name == '' ? 'There is no archive'.tr:name,textStyle: const TextStyle(
          fontSize: 12,
          fontFamily: 'GraphikArabic',
          fontWeight: FontWeight.w400,
          height: 2,
          color: Color(0xFFA4A4A4),
        ),))
      ],
    );
  }
}

class FileUploadImageCustom extends StatelessWidget {
  const FileUploadImageCustom({Key? key, required this.controller, required this.name, this.onDone}) : super(key: key);
  final FilePickerController controller;
  final String name;
  final Function? onDone;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            if(onDone!=null){
              onDone!();
            }else{
              await controller.getFilePath( );
            }},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: .3*Get.width,
              decoration:DottedDecoration(
                color: kColorsPrimaryFont,
                shape: Shape.box,
                borderRadius: BorderRadius.circular(10), //remove this to get plane rectange
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/Icons/upload.png",width: 20.w,height: 20.w,color:kColorsPrimaryFont,),
                    SizedBox(width: 10.w,),
                    Text("download".tr,style: Theme.of(context).textTheme.titleSmall,)
                  ],),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),

        CustomText(text:name == '' ? 'There is no archive'.tr:name)
      ],
    );
  }
}
