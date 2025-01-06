import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Constants/Constants.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {Key? key,
        this.textEditingController,
        this.labelText = "",
        this.hintstyle,
        this.exText = "",
        this.maxLgh,
        this.maxLin = 1,
        this.minLin = 1,
        this.obscureTxt = false,
        this.onChangeText,
        this.icon1,
        this.iconEnd,
        this.isRequired = false,
        this.withMaxLgh = false,
        this.textInputAction = TextInputAction.next,
        this.keyboardType = TextInputType.text,
        this.validatorError,
        this.inetValue,
        this.filled = true,
        this.isEnabled = true,
        this.paddingHorizontal = 5,
        this.paddingVertical = 8,
        this.withBolder = true,
        this.stringLgh,
        this.wedgetIcon1,
        this.text,
        this.styleText,
        this.fillColor,
        this.border,
        this.BorderSideColor,
        this.textAlign,
        this.readOnly = false})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String labelText;
  final TextStyle? hintstyle;
  final String exText;
  final int maxLin;
  final int minLin;
  final double paddingHorizontal;
  final String? inetValue;
  final String? text;
  final int? maxLgh;
  final TextStyle? styleText;
  final int? stringLgh;
  final double paddingVertical;
  final bool obscureTxt,
      readOnly,
      isRequired,
      isEnabled,
      withMaxLgh,
      filled,
      withBolder;
  final IconData? icon1;
  final Widget? iconEnd;
  final Color? fillColor;
  final Color? BorderSideColor;
  final Widget? wedgetIcon1;
  final double? border;
  final TextAlign? textAlign;
  final ValueChanged<String>? onChangeText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validatorError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.0.r,right: 6.0.r,top: 5.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text == null ? SizedBox() : Padding(
            padding: EdgeInsets.only(
                left:20.r, right:4.r,
                bottom:5.r),
            child: Text(text.toString() , style:  const TextStyle(fontSize: 14, color: Color(0xff010B38),  ),
            ),
          ),
          SizedBox(height:  0.01.sh),
          Container(
            height: 0.06.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: TextFormField(
              textAlign: textAlign ?? (icon1 != null ? TextAlign.center : TextAlign.start),
              cursorColor: context.theme.primaryColor,
              initialValue: inetValue,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontSize: 12,
                  color: kColorsBlack,
                ),
                fillColor: fillColor ?? kColorsWhite,
                filled: filled,
                isCollapsed: false,
                hintText: withBolder
                    ? exText.isNotEmpty
                    ? "${""}\t$exText"
                    : ""
                    : labelText.tr,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: kColorsLightBlack,

                ),
                suffixText: '',
                contentPadding:
                EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                prefixIconColor: Get.theme.primaryColor,
                suffixIconColor: Get.theme.indicatorColor,
                prefixIcon: wedgetIcon1 != null
                    ?
                wedgetIcon1
                    : icon1 != null ? Padding(
                  padding:  EdgeInsets.all(6.0.r),
                  child: Icon(
                    icon1,
                    color: kColorsBlack,
                    size: 25.r,
                  ),
                ) : null,
                suffixIcon: iconEnd,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: BorderSideColor?? kColorsLightBlack.withOpacity(0.3)),
                ),
                // errorBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(border ?? 1.r),
                //   borderSide: BorderSide(color: kColorsRed),
                // ),
                // focusedErrorBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(border ?? 1.r),
                //   borderSide: BorderSide(color: kColorsRed),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(border ?? 8.r),
                  borderSide: BorderSide(
                      color: BorderSideColor ?? kColorsLightBlackLow, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(border ?? 8.r),
                  borderSide: BorderSide(
                      color: BorderSideColor ?? kColorsLightBlackLow, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(border ?? 8.r),
                  borderSide: BorderSide(
                      color: BorderSideColor ?? kColorsLightBlackLow,
                      width: 1),
                ),

              ),
              onChanged: onChangeText,
              style: const TextStyle(
                fontSize: 12,
                color: kColorsLightBlack,
              ),

              textInputAction: textInputAction,
              keyboardType: keyboardType,
              obscureText: obscureTxt,
              enabled: isEnabled,
              readOnly: readOnly,
              controller: textEditingController,
              maxLines: maxLin,
              minLines: minLin,
              maxLength: maxLgh,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (x) {
                if (isRequired && x!.trim().isEmpty) {
                  return '${labelText.tr} ${"required".tr}';
                } else if (withMaxLgh && x!.length > stringLgh!) {
                  return   'You have exceeded, the input dome is more than specified'.tr;
                } else if (validatorError != null) {
                  return validatorError!(x);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker(
      {Key? key,
      this.textEditingController,
      this.labelText = "",
      this.exText = "",
      this.maxLgh,
      this.maxLin = 1,
      this.minLin = 1,
      this.obscureTxt = false,
      this.onChangeText,
      this.icon1,
      this.icon2,
      this.isRequired = false,
      this.withMaxLgh = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.validatorError,
      this.inetValue,
      this.filled = true,
      this.isEnabled = true,
      this.paddingHorizontal = 5,
      this.paddingVertical = 8,
      this.withBolder = true,
      this.stringLgh,
      this.wedgetIcon1,
      this.text,
      this.styleText,
      this.fillColor,
      this.border,
      this.BorderSideColor,
      this.textAlign})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String labelText;
  final String exText;
  final int maxLin;
  final int minLin;
  final double paddingHorizontal;
  final String? inetValue;
  final String? text;
  final int? maxLgh;
  final TextStyle? styleText;
  final int? stringLgh;
  final double paddingVertical;
  final bool obscureTxt, isRequired, isEnabled, withMaxLgh, filled, withBolder;
  final IconData? icon1;
  final Widget? icon2;
  final Color? fillColor;
  final Color? BorderSideColor;
  final String? wedgetIcon1;
  final double? border;
  final TextAlign? textAlign;
  final ValueChanged<DateTime?>? onChangeText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validatorError;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.paddingVertical,
          horizontal: widget.paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.text == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    widget.text.toString(),
                    style: widget.styleText ??
                        Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: kColorsBlack),
                  ),
                ),
          DateTimeField(
            textAlign: widget.textAlign ??
                (widget.icon1 != null ? TextAlign.center : TextAlign.start),
            cursorColor: context.theme.primaryColor,
            //initialValue: widget.inetValue,
            onShowPicker: (context, currentValue) async {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.convert(time);
            },
            format: DateFormat("HH:mm"),
            decoration: InputDecoration(
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey.withOpacity(.5)),
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey.withOpacity(.5)),
              fillColor: !widget.isEnabled
                  ? kColorsWhite
                  : widget.fillColor ?? kColorsWhite,
              filled: widget.filled,
              isCollapsed: false,
              hintText: widget.withBolder
                  ? widget.exText.isNotEmpty
                      ? "${""}\t${widget.exText}"
                      : ""
                  : widget.labelText.tr,
              suffixText: '   ',
              contentPadding:
                  widget.isEnabled ? EdgeInsets.all(8.r) : EdgeInsets.all(8.r),
              prefixIconColor: Get.theme.primaryColor,
              suffixIconColor: Get.theme.indicatorColor,
              prefixIcon: widget.wedgetIcon1 != null
                  ? Card(
                      margin: EdgeInsets.all(0),
                      elevation: 0,
                      color: kColorsPrimaryFont.withOpacity(.2),
                      child: Padding(
                        padding: EdgeInsets.all(15.0.r),
                        child: Image.asset(
                          widget.wedgetIcon1.toString(),
                          color: context.theme.iconTheme.color,
                          width: 30.r,
                          height: 30.r,
                        ),
                      ),
                    )
                  : widget.icon1 != null
                      ? Icon(
                          widget.icon1,
                          color: context.theme.iconTheme.color,
                        )
                      : null,
              suffixIcon: widget.icon2,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4.r),
                borderSide: BorderSide(color: kColorsRed, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4.r),
                borderSide: BorderSide(color: kColorsRed, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4.r),
                borderSide: BorderSide(
                    width: 1.5,
                    color: widget.BorderSideColor ?? kColorsLightBlack),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4.r),
                borderSide: BorderSide(
                    color: widget.BorderSideColor ?? kColorsLightBlack,
                    width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: kColorsLightBlack, width: 1),
              ),
            ),
            onChanged: widget.onChangeText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureTxt,
            enabled: widget.isEnabled,
            controller: widget.textEditingController,
            maxLines: widget.maxLin,
            minLines: widget.minLin,
            maxLength: widget.maxLgh,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (x) {
              if (widget.isRequired && x == null) {
                return '${widget.labelText.tr} ${"مطلوب"}';
              } else if (widget.validatorError != null) {
                return widget.validatorError!(x.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}

class CustomDatePickerInput extends StatefulWidget {
  const CustomDatePickerInput(
      {Key? key,
      this.textEditingController,
      this.labelText = "",
      this.exText = "",
      this.maxLgh,
      this.maxLin = 1,
      this.minLin = 1,
      this.obscureTxt = false,
      this.onChangeText,
      this.icon1,
      this.icon2,
      this.isRequired = false,
      this.withMaxLgh = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.validatorError,
      this.inetValue,
      this.filled = true,
      this.isEnabled = true,
      this.paddingHorizontal = 5,
      this.paddingVertical = 8,
      this.withBolder = true,
      this.stringLgh,
      this.wedgetIcon1,
      this.text,
      this.styleText,
      this.fillColor,
      this.border,
      this.BorderSideColor,
      this.textAlign})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String labelText;
  final String exText;
  final int maxLin;
  final int minLin;
  final double paddingHorizontal;
  final String? inetValue;
  final String? text;
  final int? maxLgh;
  final TextStyle? styleText;
  final int? stringLgh;
  final double paddingVertical;
  final bool obscureTxt, isRequired, isEnabled, withMaxLgh, filled, withBolder;
  final IconData? icon1;
  final Widget? icon2;
  final Color? fillColor;
  final Color? BorderSideColor;
  final String? wedgetIcon1;
  final double? border;
  final TextAlign? textAlign;
  final ValueChanged<DateTime?>? onChangeText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validatorError;

  @override
  State<CustomDatePickerInput> createState() => _CustomDatePickerInputState();
}

class _CustomDatePickerInputState extends State<CustomDatePickerInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.paddingVertical,
          horizontal: widget.paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.text == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    widget.text.toString(),
                    style: widget.styleText ??
                        Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: kColorsBlack),
                  ),
                ),
          DateTimeField(
            textAlign: widget.textAlign ??
                (widget.icon1 != null ? TextAlign.center : TextAlign.start),
            cursorColor: context.theme.primaryColor,
            decoration: InputDecoration(
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey.withOpacity(.5)),
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey.withOpacity(.5)),
              fillColor: !widget.isEnabled
                  ? kColorsWhite
                  : widget.fillColor ?? kColorsWhite,
              filled: widget.filled,
              isCollapsed: false,
              hintText: widget.withBolder
                  ? widget.exText.isNotEmpty
                      ? "${""}\t${widget.exText}"
                      : ""
                  : widget.labelText.tr,
              suffixText: '   ',
              contentPadding:
                  widget.isEnabled ? EdgeInsets.all(8) : EdgeInsets.all(8),
              prefixIconColor: Get.theme.primaryColor,
              suffixIconColor: Get.theme.indicatorColor,
              prefixIcon: widget.wedgetIcon1 != null
                  ? Card(
                      margin: EdgeInsets.all(0),
                      elevation: 0,
                      color: kColorsPrimaryFont.withOpacity(.2),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          widget.wedgetIcon1.toString(),
                          color: context.theme.iconTheme.color,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    )
                  : widget.icon1 != null
                      ? Icon(
                          widget.icon1,
                          color: context.theme.iconTheme.color,
                        )
                      : null,
              suffixIcon: Icon(
                Icons.date_range,
                color: kColorsLightBlack,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4),
                borderSide: BorderSide(color: kColorsRed, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4),
                borderSide: BorderSide(color: kColorsRed, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4),
                borderSide: BorderSide(
                    width: 1.5,
                    color: widget.BorderSideColor ?? kColorsLightBlack),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 4),
                borderSide: BorderSide(
                    color: widget.BorderSideColor ?? kColorsLightBlack,
                    width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kColorsLightBlack, width: 1),
              ),
            ),
            onChanged: widget.onChangeText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureTxt,
            enabled: widget.isEnabled,
            controller: widget.textEditingController,
            maxLines: widget.maxLin,
            minLines: widget.minLin,
            maxLength: widget.maxLgh,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (x) {
              if (widget.isRequired && x == null) {
                return '${widget.labelText.tr} ${"مطلوب"}';
              } else if (widget.validatorError != null) {
                return widget.validatorError!(x.toString());
              }
            },
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
            format: DateFormat("yyyy/MM/dd"),
          ),
        ],
      ),
    );
  }
}
