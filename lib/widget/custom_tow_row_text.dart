import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/Constants/Constants.dart';

class CustomTowRowText extends StatelessWidget {
  CustomTowRowText({this.flex, this.text,this.text2,this.textStyle,this.textValue,this.textValue2,this.textValueStyle,this.textValue2Style,this.backColor, super.key});
  final String? text;
  final String? text2;
  final String? textValue;
  final String? textValue2;
  final TextStyle? textValue2Style;
  final TextStyle? textStyle;
  final TextStyle? textValueStyle;
  final Color? backColor;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          decoration: BoxDecoration(
              color:backColor  ,
              borderRadius: BorderRadius.circular(10.r)
          ),
          padding:  EdgeInsets.only(top:  8.0.r,bottom: 8.r,left: 6.0.r,right: 6.0.r),

          child: Row(
            children: [
              Expanded(
                  flex: flex!=null ? flex!: 3,
                  child: Text(text.toString()+":",  style: textStyle)),

              Expanded(
                  flex: flex!=null ? flex!: 3,child: Text(textValue.toString(),textAlign: TextAlign.start,  style:textValueStyle)),




              Expanded(
                  flex:flex!=null ?flex!: 3,child: Text(text2.toString()+":",  style:textValue2Style!=null?textValue2Style: textStyle)),

              Expanded(
                  flex:flex!=null ?4: 3,child: Text(textValue2.toString(),textAlign: TextAlign.start,  style:textValueStyle)),
            ],
          ),
        ),
        SizedBox(height: 0.003.sh),
      ],
    );
  }
}