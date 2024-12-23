import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:intl/intl.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
class  ItemNotifcation extends StatelessWidget {


var data;
ItemNotifcation(this.data);
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    String? formattedDatemodifiedOn;
    if( data.createdOn!=null){
      String dateString = data.createdOn.toString();
      DateTime dateTime = DateTime.parse(dateString);
       formattedDatemodifiedOn = DateFormat('yyyy-MM-dd').format(dateTime);
      print(formattedDatemodifiedOn);
    }
    return
      InkWell(

        onTap: (){
          // Get.toNamed(RoutingApp.notifcation_details_screen);
          stg.write(TransacID,data.transactionId);
          print("TransacID= "+ stg.read(TransacID).toString());
        },
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 0.03.sw,right:  0.03.sw),
              child: Container(

                width: 343.w,
                decoration: BoxDecoration(
                  color: kColorsWhite,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(width: 0.4.r,color:kColorsPrimary.withOpacity(0.6) ),

                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r, left:isRtl!=true? 10.0.r:0.0, right:isRtl==true? 10.0.r:0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    CustomRowText(text:'Registration number'.tr,textStyle: TextStyle(fontSize: 12,   fontFamily: 'GraphikArabic', color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue: data.codeFormat==null?"":data.codeFormat.toString(),textValueStyle: TextStyle(fontSize: 10,    fontFamily: 'GraphikArabic',color: kColorsBlack,),backColor: kColorsWhite,),
                    CustomRowText(text:'The Topic'.tr,textStyle: TextStyle(fontSize: 12, color:kColorsPrimary ,   fontFamily: 'GraphikArabic', fontWeight: FontWeight.w500,),textValue: data.subject==null?"":data.subject.toString(),textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                    CustomRowText(text:"Sender".tr,textStyle: TextStyle(fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue:data.userFullname==null?"":data.userFullname.toString(),textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                    CustomRowText(text:'Transaction history'.tr,textStyle: TextStyle(fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue: data.hDate==null?"":data.hDate.toString(),textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                    CustomRowText(text:"Sending Date".tr,textStyle: TextStyle(fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue: formattedDatemodifiedOn==null?"":formattedDatemodifiedOn.toString(),textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                          ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0.h,
            ),
          ],
        ),
      );
  }

}
class   ItemNotifcationShimmer extends StatelessWidget {
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
                  border: Border.all(width: 0.4.r,color:kColorsPrimary.withOpacity(0.6) ),

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
              height: 12.0.h,
            ),
          ],
        ),
      );
  }
}




  

