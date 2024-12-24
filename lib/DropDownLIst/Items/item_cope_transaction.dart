import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class  ItemCopeTransactions extends StatelessWidget {
  var data;
  ItemCopeTransactions( this.data );
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: kColorGrayCard,
                borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.only(top: 6.0.r, right: 2.r, bottom:6.r),
            width: 0.99.sw,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(

                        ' - ',
                        style: TextStyle(fontSize: 12, color: kColorsPrimaryFont, fontWeight: FontWeight.w500,)),
                  )
                ),
                Expanded(
                    flex: 12,
                    child: Text(
                      // "30/04/ 2024",
                      // controller.inboxReferralsModel!.dataReferrals!.first.hDate.toString(),
                      'Copy to'.tr+  data.name.toString(),
                        style: TextStyle(fontSize:12, color: kColorsPrimaryFont, fontWeight: FontWeight.w500,))),
                Expanded(
                  flex: 1,

                  child:   Image.asset(
                    "assets/Icon/clear.png",
                    width: 20.r,
                    height: 20.r,
                    color: kColorsWhite,),),

              ],
            ),
          ),
          SizedBox(
            height: 0.01.sh,
          ),
        ],
      );
  }

}

class   ItemCopeTransactionsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Shimmer(
        child:  Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 0.05.sw,right:  0.03.sw),
              child: Container(
                height:0.30.sh,
                width: 343.w,
                decoration: BoxDecoration(
                  color: kColorsWhite,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(width: 0.4.r,color:kColorsPrimaryFont.withOpacity(0.6) ),

                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r,left: 5.0.r,right: 10.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRowText(text: " ",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: "",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: "",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: " ",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: " ",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: " ",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: " ",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: "",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "  ",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: Color(0xffEBF1F8),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.01.sh,
            ),
          ],
        ),
      );
  }
}

  

