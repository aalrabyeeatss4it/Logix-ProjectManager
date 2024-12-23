import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
class  ItemNotifcationNotRead extends StatelessWidget {


var data;
ItemNotifcationNotRead(this.data);
  @override
  Widget build(BuildContext context) {
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
              padding:  EdgeInsets.only(left: 0.05.sw,right:  0.03.sw),
              child: Container(

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
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color:kColorsWhite  ,
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            padding:  EdgeInsets.only(top:  2.0.r,right: 2.r,bottom: 2.r),
                            width: 0.99.sw,
                            child: Row(

                              children: [
                                Expanded(
                                    flex:5,


                                    child: Text('Registration number'.tr+":",  style: TextStyle(fontFamily: 'GraphikArabic',fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,))),

                                Expanded(
                                    flex:9,
                                    child: Text(data.codeFormat.toString(),  style:TextStyle(fontFamily: 'GraphikArabic',fontSize: 10, color: kColorsBlack,))),
                                Expanded(
                                  flex:3,
                                  child: CustomButton(
                                    color:data.statusName.toString()==null?kColorsWhite: kColorsPrimary,
                                    borderRadius: 8.r,
                                    borderColor: data.statusName.toString()==null?kColorsWhite: kColorsPrimary,
                                    sizeHeight: 0.04.sh,
                                    sizeWidth: 0.15.sw,
                                    text:data.statusName.toString(),
                                    style: TextStyle(fontFamily: 'GraphikArabic',
                                        fontSize: 12,
                                        color: kColorsWhite),
                                    onPress: () {
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    CustomRowText(text:'The Topic'.tr,textStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue: data.subject==null?"":data.subject.toString(),textValueStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                    CustomRowText(text:"Sender".tr,textStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue:data.userFullname==null?"":data.userFullname.toString(),textValueStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                    CustomRowText(text:'Transaction history'.tr,textStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue: data.hDate==null?"":data.hDate.toString(),textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                    CustomRowText(text:"Sending Date".tr,textStyle: TextStyle(fontSize: 12, color:kColorsPrimary , fontWeight: FontWeight.w500,),textValue: data.createdOn==null?"":data.createdOn.toString(),textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
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
class   ItemNotifcationNotReadShimmer extends StatelessWidget {
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




  

