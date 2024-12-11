
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class  ItemHome extends StatelessWidget {
  // var data;
  // ItemHome ({ this.data});
  void select(BuildContext ctx){
  }
  @override
  Widget build(BuildContext context) {
    // String? formattedDatemodifiedOn;
    // if( data.modifiedOn!=null){
    //   String dateString = data.modifiedOn.toString();
    //   DateTime dateTime = DateTime.parse(dateString);
    //   formattedDatemodifiedOn = DateFormat('yyyy-MM-dd').format(dateTime);
    //   print(formattedDatemodifiedOn);
    // }

    return
      InkWell(
        onTap: (){
          // Get.toNamed(RoutingApp.inbox_details_screen);
          // stg.write(TransacID,data.id);
          // print("TransacID= "+ stg.read(TransacID).toString());
        },
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 0.01.sw,right:  0.01.sw),
              child: Container(
                width: 343.w,
                decoration: BoxDecoration(
                  color: kColorsWhite,
                  borderRadius: BorderRadius.circular(7.r),


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
                                    flex:9,
                                    child: Text('تركيب نظام لجهه خاصه'.tr,  style: TextStyle(fontFamily: 'Regular',fontSize: 14, color:kColorsBlack , fontWeight: FontWeight.w500,))),
                                Expanded(
                                  flex:5,
                                  child: CustomButton(
                                    color:Color(0xffFF744A).withOpacity(0.3),
                                    borderRadius: 8.r,
                                    borderColor:  kColorsPrimary,
                                    sizeHeight: 0.04.sh,
                                    sizeWidth: 0.30.sw,
                                    text:'متأخر بشكل بسيط'.tr,
                                    style: TextStyle(fontFamily: 'Regular',
                                        fontSize: 12,
                                        color: Color(0xffFF744A)),
                                    onPress: () {
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex:9,
                            child: Column(
                              children: [
                                CustomRowText(text: 'تاريخ البدايه'.tr,textStyle: TextStyle(fontFamily: 'Regular',fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "2022/2/2",textValueStyle: TextStyle(fontFamily: 'Regular',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,),
                                CustomRowText(text: ' تاريخ النهايه'.tr,textStyle: TextStyle(fontFamily: 'Regular',fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "2026/2/2",textValueStyle: TextStyle(fontFamily: 'Regular',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,),
                                CustomRowText(text: 'مرحلة المشروع'.tr,textStyle: TextStyle(fontFamily: 'Regular',fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "sgsgsg",textValueStyle: TextStyle(fontFamily: 'Regular',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,),
                              ],
                            ),
                          ),
                          Expanded(
                            flex:4,
                            child: Padding(
                              padding:  EdgeInsets.all(3.0.r),
                              child: SvgPicture.asset(
                                "assets/Icons/menu.svg",
                                width: 24.r ,
                                height: 24.r ,
                                color: kColorsWhite,
                              ),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex:14,
                              child: CustomRowText(text: 'مدير المشروع'.tr,textStyle: TextStyle(fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue:"xxbxbxbxb",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,)),
                          Expanded(
                            flex:2,
                            child: InkWell(
                              onTap: () {},
                              child:
                              Padding(
                                padding:  EdgeInsets.all(3.0.r),
                                child: SvgPicture.asset(
                                  "assets/Icon/arrow-square-left.svg",
                                  width: 24 ,
                                  height: 24 ,
                                  color: kColorsBlack,
                                ),
                              ),

                            )
                          ),
                        ],
                      ),
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





class  ItemHomeShimmer extends StatelessWidget {


  void select(BuildContext ctx){
  }
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


