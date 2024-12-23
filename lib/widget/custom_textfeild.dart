import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/Constants/Constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final Widget? iconStart;
  final TextStyle? hintStyle;
  final String ?text;
  final String ?initialValue;
  final bool? requirement;
  final bool ?Noheight;
  final ValueChanged<String> ?onChanged;
  final int ?maxLine;
  final int ?minLine;
  final double? sizheight;
  final int ?edit;
  final Widget? EndIcon;
  final Widget? EndIconPassowrd;
  final TextInputType? keyboardType;
  final BoxConstraints? NewConstraints;
  final Widget ?inkell;
  final bool isHidden ;
  final bool read ;
  final double? sizeFontText ;

  final Color? color ;
  final Color? colorborder ;
  final Color? colorfont ;
  final Color? colorhint ;
  final Color? shadowColor;
  String? _errorMessage(bool str) {
    switch (str) {
      case true:
        return 'هذا الحقل مطلوب'.tr;
        break;
      case false:
      // TODO: Handle this case.
    }
  }

  TextFieldWidget({
    Key ?key, this.hint,this.hintStyle, this.controller, this.iconStart, this.text,  this.sizeFontText,this.inkell,this.Noheight, this.isHidden=false, this.initialValue, this.requirement, this.maxLine=1, this.minLine=1, this.keyboardType,  this.read=false, this.EndIcon, this.NewConstraints, this.onChanged, this.edit,this.color,this.sizheight,this.colorfont, this.shadowColor, this.EndIconPassowrd,this.colorborder,this.colorhint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 11.0.r,right: 6.0.r,top: 5.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          edit!=null?  Container(
              padding: EdgeInsets.only(
                  left:20.r, right:4.r,
                  bottom:5.r),
              child: Text(
                text!.tr,

                style: TextStyle(
                  fontFamily: 'GraphikArabic',
                  fontSize: 12,
                  color: kColorsBlack,
                ),)
          ):SizedBox(),
          TextFormField(
            readOnly: read==null?false:read,
            initialValue: initialValue,
            onChanged: onChanged,
            controller: controller,
            style: TextStyle(fontFamily: 'GraphikArabic',color: colorfont!=null ? colorfont : kColorsLightBlack,fontSize: 12.sp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return _errorMessage(requirement ?? false); // استخدم قيمة افتراضية لـ requirement
              }
              return null; // إذا كانت القيمة صحيحة، ارجع null
            },
            cursorColor: kColorsPrimary,
            obscureText: isHidden,
            keyboardType:keyboardType?? TextInputType.text,
            autocorrect: false,
            maxLines: maxLine,
            minLines: minLine,
            decoration: InputDecoration(
                hintText: hint==null?'':hint ,
                filled: true,
                fillColor:  kColorsWhite,
                errorMaxLines: 1,
                hintStyle:hintStyle?? TextStyle(fontFamily: 'GraphikArabic',
                    fontSize: 12,
                    color: kColorsIcon.withOpacity(0.5),
                    fontWeight: FontWeight.w500) ,
                contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),


                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: colorborder??  kColorsLightBlack.withOpacity(0.5))),

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(width: 1,color:colorborder?? kColorsLightBlackLow.withOpacity(0.5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: kColorsLightBlackLow.withOpacity(0.5))),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: kColorsRed)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: kColorsRed)
                ),
                //                 suffixIcon: text=='Password'.tr?Icon(Icons.remove_red_eye_outlined,color:kColorsBackground,size: .03.sh,):SizedBox(),
                suffixIcon: EndIcon,
                constraints: NewConstraints,
                prefixIcon:iconStart==null?null: iconStart
            ),
          ),

        ],
      ),
    );
  }
}