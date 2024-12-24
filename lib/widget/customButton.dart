import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/Constants/Constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key ?key,this.isIconEnd,this.IconEnd,this.isIconStart,this.IconStart, required this.onPress, this.text,
    this.sizeHeight, this.sizeWidth,   this.sizedBoxHeight, this.style, this.disabledColor, this.color,
    this.fontColor, this.borderColor, this.borderRadius,
  }) : super(key: key);
  final Function()? onPress;
  final String? text;
  final bool? isIconEnd;
  final bool? isIconStart;
  final SvgPicture? IconEnd;
  final SvgPicture? IconStart;


  final double ?sizeHeight;
  final double ?sizeWidth;
  final double ?borderRadius;

  final TextStyle? style;
  final Color ?disabledColor;
  final Color ?color;
  final Color ?fontColor;
  final Color ?borderColor;
  final sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        sizedBoxHeight!=null?
        SizedBox(height:sizedBoxHeight,):
        SizedBox(),
        Container(
          width:sizeWidth==null? .75.sw:sizeWidth,
          height:sizeHeight==null? .11.sw:sizeHeight,
          decoration: BoxDecoration(
            // border: Border.all(color:borderColor?? kColorsOrange,),
              borderRadius: BorderRadius.circular(
                  borderRadius?? 10.r),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color?? kColorsPrimaryFont,
                    color?? kColorsPrimaryFont
                  ])),
          child:
          // MaterialButton(
          //   padding: EdgeInsets.zero,
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius??  10.r),side: BorderSide( color:borderColor?? kColorsPrimaryFont,width: 1) ),
          //   disabledColor: disabledColor,
          //   onPressed:onPress,
          //   child: Padding(
          //     padding:  EdgeInsets.only(bottom:4.r),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         isIconStart==true? IconStart!
          //             :SizedBox(width: 0.00.sh,),
          //         isIconStart==true?  SizedBox(
          //           width: 0.03.sw,
          //         )
          //             :SizedBox(width: 0.00.sh,),
          //         Text( text!,
          //
          //           style:style!=null?
          //           //style :Theme.of(context).textTheme.titleMedium!.copyWith(color: fontColor??kColorsWhite,)
          //           style : TextStyle(
          //               fontSize: 16,
          //               color:fontColor?? Colors.white
          //           ),
          //           textAlign: TextAlign.center,maxLines: 1,),
          //         SizedBox(
          //           width: 0.03.sw,
          //         ),
          //         isIconEnd==true? IconEnd!
          //             :SizedBox(width: 0.00.sh,),
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: onPress,
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                border: Border.fromBorderSide(BorderSide(
                  color: borderColor ?? kColorsPrimaryFont,
                  width: 1,
                )),
                color: onPress == null ? disabledColor : null,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isIconStart == true ? IconStart! : SizedBox(width: 0.00.sh),
                    isIconStart == true ? SizedBox(width: 0.03.sw) : SizedBox(width: 0.00.sh),
                    Text(
                      text!,
                      style: style != null ? style : TextStyle(
                        fontSize: 14,
                        color: fontColor ?? Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    SizedBox(width: 0.03.sw),
                    isIconEnd == true ? IconEnd! : SizedBox(width: 0.00.sh),
                  ],
                ),
              ),
            ),
          )
        ),
      ],
    );
  }
}