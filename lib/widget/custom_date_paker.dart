import 'package:projectmanagers/widget/customHijriDatePicker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '/Constants/Constants.dart';
class CustomDatePaker extends StatelessWidget {
  const CustomDatePaker(
      {Key? key,
      this.hint,
      this.reqeurment,
      this.controller,
      this.iconEnd,
      this.onchange,
      this.text,
        this.read,
        this.TypeData,
        this.colorborder,
      this.edit})
      : super(key: key);
  final Color? colorborder ;
  final String? hint;
  final String? TypeData;
  final String? text;
  final int? edit;
  final bool? read;
  final bool? reqeurment;
  final String? iconEnd;
  final TextEditingController? controller;
  final Function(DateTime? value)? onchange;

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

      padding: EdgeInsets.only(left: 15.r, bottom: 6.r),
        child: Text(
          text!.tr ,
          style: TextStyle(   fontFamily: 'GraphikArabic',
              color: kColorsBlack,
              fontSize: 12,
              fontWeight: FontWeight.bold),
                  ))
              : SizedBox(),
          Material(
            borderRadius: BorderRadius.circular(5.r),
            elevation: 1,
            shadowColor: kColorsWhite,
            child: Container(
              child: DateTimeField(
                onChanged: onchange,
                controller: controller,
                style:TextStyle(   fontFamily: 'GraphikArabic',color: kColorsLightBlack,fontSize: 12.sp),
                validator: (value) {
                  if (value == null) {
                    return _errorMessage(reqeurment!);
                  }
                },
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(10.0.r),
                    child:  iconEnd != null
                        ? SvgPicture.asset(
                      iconEnd!,
                      width: 20.r,
                      height: 20.r,
                      color: kColorsLightBlack,
                    )
                        : SvgPicture.asset(
                      "assets/Icons/Exclude.svg",
                      width: 20.r,
                      height: 20.r,
                      color: kColorsLightBlack,
                    ),
                  ),
                  hintText: hint,
                  fillColor: kColorsWhite,
                  errorMaxLines: 1,
                  hintStyle: TextStyle(   fontFamily: 'GraphikArabic',color: Colors.black,fontSize: 9.sp),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(width: 0.1,
                          color: colorborder ?? kColorsLightBlack.withOpacity(0.2))),
                  errorBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: kColorsRed)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(width: 1, color: colorborder ?? kColorsLightBlack.withOpacity(0.2))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(width: 0.1, color: colorborder ?? kColorsLightBlack.withOpacity(0.2))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: kColorsRed)),
                ),
                  onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate  :DateTime(2000),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
                format: DateFormat("yyyy/MM/dd"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomDateHijryPaker extends StatefulWidget {
   CustomDateHijryPaker(
      {Key? key,
        this.hint,
        this.reqeurment,
        this.controller,
        this.iconEnd,
        this.onchange,
        this.text,
        this.TypeData,
        this.colorborder,
        this.edit})
      : super(key: key);
  final Color? colorborder ;
  final String? hint;
  final String? TypeData;
  final String? text;
  final int? edit;
  final bool? reqeurment;
  final String? iconEnd;
  final TextEditingController? controller;
  final Function(DateTime? value)? onchange;

  @override
  State<CustomDateHijryPaker> createState() => _CustomDateHijryPakerState();
}

class _CustomDateHijryPakerState extends State<CustomDateHijryPaker> {
  String? _errorMessage(bool str) {
    switch (str) {
      case true:
        return 'هذا الحقل مطلوب'.tr;
        break;
    }
  }

  var selectedDate = HijriCalendar.now();

   Future<Null> _selectDate(BuildContext context) async {
     final HijriCalendar? picked = await showHijriDatePicker(
       context: context,
       initialDate: selectedDate,
       lastDate: new HijriCalendar()
         ..hYear = 1500
         ..hMonth = 9
         ..hDay = 25,
       firstDate: new HijriCalendar()
         ..hYear = 1440
         ..hMonth = 12
         ..hDay = 25,
       initialDatePickerMode: DatePickerMode.day,
     );
     if (picked != null)
       setState(() {
         selectedDate = picked;
         widget.controller!.text=selectedDate.toString();
       });
   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0.r, right: 10.0.r, top: 4.0.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.edit != null
              ? Container(
              padding:
              EdgeInsets.only(left: 15.r, right: 2.r, bottom: 6.r),
              child: Text(
                widget.text!.tr+":",
                style: TextStyle(   fontFamily: 'GraphikArabic',
                    color: kColorsLightBlack,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold),
              ))
              : SizedBox(),
          Material(
            borderRadius: BorderRadius.circular(5.r),
            elevation: 1,
            shadowColor: kColorsWhite,
            child: Container(

              child: DateTimeField(
                onChanged: widget.onchange,
                controller:widget.controller,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.grey),
                validator: (value) {
                  if (value == null) {
                    return _errorMessage(widget.reqeurment!);
                  }
                },
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(6.0.r),
                    child: widget.iconEnd != null
                        ? Image.asset(widget.iconEnd!, width: 20.r, height: 20.r)
                        : Image.asset(
                      "assets/Icons/Data.png",
                      width: 20.r,
                      height: 20.r,
                      color: kColorsPrimaryFont,
                    ),
                  ),
                  hintText: widget.hint,
                  fillColor: kColorsWhite,
                  errorMaxLines: 1,
                  hintStyle: TextStyle(   fontFamily: 'GraphikArabic',color: Colors.black,fontSize: 11.sp),
                  contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: widget.colorborder?? kColorsLightBlackLow)),
                  errorBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: kColorsRed)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: kColorsLightBlack)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: kColorsLightBlack)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: kColorsRed)),
                ),
                onShowPicker: (context, currentValue) {
                  return   _selectDate(context);
                },
                format: DateFormat("yyyy/MM/dd"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
