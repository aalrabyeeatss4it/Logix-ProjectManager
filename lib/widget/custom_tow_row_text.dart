import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/Constants/Constants.dart';

class CustomTowRowText extends StatelessWidget {
  CustomTowRowText({ this.text,this.text2,this.textStyle,this.textValue,this.textValue2,this.textValueStyle,this.backColor, super.key});
  final String? text;
  final String? text2;
  final String? textValue;
  final String? textValue2;
  final TextStyle? textStyle;
  final TextStyle? textValueStyle;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          decoration: BoxDecoration(
              color:backColor  ,
              borderRadius: BorderRadius.circular(10.r)
          ),
          padding:  EdgeInsets.only(top:  5.0.r,right: 6.r,bottom: 4.r),
          width: 0.82.sw,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Expanded(
                  flex: 3,
                  child: Text(text.toString()+":",  style: textStyle)),

              Expanded(
                  flex: 3,child: Text(textValue.toString(),  style:textValueStyle)),




              Expanded(
                  flex: 3,child: Text(text2.toString()+":",  style: textStyle)),

              Expanded(
                  flex: 3,child: Text(textValue2.toString(),  style:textValueStyle)),
            ],
          ),
        ),
        SizedBox(height: 0.003.sh),
      ],
    );
  }
}