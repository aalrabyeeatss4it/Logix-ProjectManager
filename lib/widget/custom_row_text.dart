import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/Constants/Constants.dart';

class CustomRowText extends StatelessWidget {
  CustomRowText({ this.text,this.flex,this.textStyle,this.textValue,this.textValueStyle,this.backColor, super.key});
  final String? text;
  final int? flex;
  final String? textValue;
  final TextStyle? textStyle;
  final TextStyle? textValueStyle;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color:kColorsWhite  ,
              borderRadius: BorderRadius.circular(10.r)
          ),
          padding:  EdgeInsets.only(top:  8.0.r,bottom: 8.r,left: 1.0.r,right: 1.0.r),

          child: Row(
            children: [
              Expanded(
                  flex:flex!=null?flex! :2,
                  child: Text(text.toString()+":",  style: textStyle)),

              Expanded(
                  flex: 8,
                  child: Text(textValue.toString(),  style:textValueStyle)),
            ],
          ),
        ),
        SizedBox(height: 0.003.sh),
      ],
    );
  }
}