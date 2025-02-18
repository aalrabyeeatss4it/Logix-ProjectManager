import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';

import '/Constants/Constants.dart';

class CustomTimePaker extends StatelessWidget {
  const CustomTimePaker(
      {this.text,
      required this.hint,
       this.reqeurment,
      this.controller,
      this.colorborder,
      this.edit,
      this.color,
      this.iconEnd,
        this.read
      });

  final String? text;
  final String? hint;
  final bool? read;
  final bool? reqeurment;
  final Color? colorborder;

  final Color? color;

  final int? edit;
  final String? iconEnd;


  final TextEditingController? controller;

  String? _errorMessage(bool str) {
    switch (str) {
      case true:
        return 'هذا الحقل مطلوب'.tr;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0.r, right: 10.0.r, top: 4.0.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          edit != null
              ? Container(
                  padding: EdgeInsets.only(left: 15.r, right: 7.r, bottom: 6.r),
                  child: Text(
                    text!.tr ,
                    style: const TextStyle(
                        color: kColorsBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ))
              : SizedBox(),
          SizedBox(height:  0.01.sh),
          Container(
            height: 0.06.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
               // border: Border.all(color: kColorsPrimaryFont, width: 0.7,)
            ),

            child: DateTimeField(
              //onChanged: onChange,
              controller: controller,
              style: const TextStyle(color: Colors.black, fontSize: 11),
              validator: (value) {
                if (value == null) {
                  return _errorMessage(reqeurment!);
                }
              },
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.all(6.0.r),
                  child: iconEnd != null
                      ? SvgPicture.asset(
                          iconEnd!,
                          width: 20.r,
                          height: 20.r,
                          color: kColorsLightBlack,
                        )
                      : SvgPicture.asset(
                         AssestData.time,
                          width: 20.r,
                          height: 20.r,
                          color: kColorsLightBlack,
                        ),
                ),
                filled: true,
                fillColor: color ?? kColorsWhite,
                hintStyle: const TextStyle(
                  color: kColorsLightBlack,
                  fontSize: 12,
                ),
                hintText: hint,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 0.1,
                        color: colorborder ?? kColorsLightBlackLow)),
                errorBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: kColorsRed)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 1, color: colorborder ?? kColorsLightBlackLow)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 0.1, color: colorborder ?? kColorsLightBlackLow)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: kColorsRed)
                ),
              ),
              onShowPicker: read!=true? (context, currentValue) async{

                final time = await showTimePicker(
                  context: context,
                  initialTime:TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
              }:(context, currentValue) async{
              },
              format: DateFormat("HH:mm"),
            ),
          ),
        ],
      ),
    );
  }
}
