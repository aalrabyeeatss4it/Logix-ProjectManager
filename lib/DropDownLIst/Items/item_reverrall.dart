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

class  ItemReverrall extends StatelessWidget {


  var data;
  ItemReverrall( this.data );
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Padding(
            padding:
            EdgeInsets.only(
                left: 0.02.sw,
                right:
                0.02.sw),
            child: Container(
              width: 343.w,
              decoration:
              BoxDecoration(
                color: kColorsWhite,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    width: 0.4.r,
                    color: kColorsPrimary
                        .withOpacity(
                        0.6)),
              ),
              child: Padding(
                padding: EdgeInsets
                    .only(
                    top:
                    5.0.r,
                    bottom:
                    5.r,
                    left:
                    5.0.r,
                    right: 10.0
                        .r),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: kColorsWhite,
                              borderRadius: BorderRadius
                                  .circular(
                                  10
                                      .r)),
                          padding: EdgeInsets
                              .only(
                              top: 2.0
                                  .r,
                              right: 2
                                  .r,
                              bottom: 2
                                  .r),
                          width: 0.99
                              .sw,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 5.0.r),
                                    child: Text('Its history'.tr + ":",
                                        style: TextStyle(fontSize: 12, color: kColorsPrimary, fontWeight: FontWeight.w500,)),
                                  )),
                              Expanded(
                                  flex: 12,
                                  child: Text(
                                    // "30/04/ 2024",
                                    // controller.inboxReferralsModel!.dataReferrals!.first.hDate.toString(),
                                      data.hDate.toString(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: kColorsBlack,
                                      ))),

                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomRowText(
                      text: 'Time'
                          .tr,
                      textStyle:
                      TextStyle(
                        fontSize:
                        12,
                        color:
                        kColorsPrimary,
                        fontWeight:
                        FontWeight
                            .w500,
                      ),
                      textValue:
                      "13:58 ",
                      textValueStyle:
                      TextStyle(
                        fontSize:
                        10,
                        color:
                        kColorsBlack,
                      ),
                      backColor:
                      kColorsWhite,
                    ),
                    CustomRowText(
                      text: 'From the employee'.tr,
                      textStyle:
                      TextStyle(
                        fontSize:
                        12,
                        color:
                        kColorsPrimary,
                        fontWeight:
                        FontWeight
                            .w500,
                      ),
                      textValue:
                      // "مدير النظام",
                      // controller.inboxReferralsModel!.dataReferrals!.first.userFullnameCreateBy.toString(),
                      data.userFullnameCreateBy.toString(),
                      textValueStyle:
                      TextStyle(
                        fontSize:
                        10,
                        color:
                        kColorsBlack,
                      ),
                      backColor:
                      kColorsWhite,
                    ),
                    CustomRowText(
                      text:
                      'The Status'
                          .tr,
                      textStyle:
                      TextStyle(
                        fontSize:
                        12,
                        color:
                        kColorsPrimary,
                        fontWeight:
                        FontWeight
                            .w500,
                      ),
                      textValue:
                      // "محوله",
                      // controller.inboxReferralsModel!.dataReferrals!.first.statusName.toString(),
                     data.statusName.toString(),
                      textValueStyle:
                      TextStyle(
                        fontSize:
                        10,
                        color:
                        kColorsBlack,
                      ),
                      backColor:
                      kColorsWhite,
                    ),
                    CustomRowText(
                      text:
                      'To the employee'
                          .tr,
                      textStyle:
                      TextStyle(
                        fontSize:
                        12,
                        color:
                        kColorsPrimary,
                        fontWeight:
                        FontWeight
                            .w500,
                      ),
                      textValue:
                      // "الإداره الماليه",
                      // controller.inboxReferralsModel!.dataReferrals!.first.toName.toString(),
                     data.toName.toString(),
                      textValueStyle:
                      TextStyle(
                        fontSize:
                        10,
                        color:
                        kColorsBlack,
                      ),
                      backColor:
                      kColorsWhite,
                    ),
                    CustomRowText(
                      text: 'note'
                          .tr,
                      textStyle:
                      TextStyle(
                        fontSize:
                        12,
                        color:
                        kColorsPrimary,
                        fontWeight:
                        FontWeight
                            .w500,
                      ),
                      textValue:
                      // "شرح ديمو نظام الاتصالات الإدارية 3",
                      // controller.inboxReferralsModel!.dataReferrals!.first.note.toString(),
                      data.note.toString(),
                      textValueStyle:
                      TextStyle(
                        fontSize:
                        10,
                        color:
                        kColorsBlack,
                      ),
                      backColor:
                      kColorsWhite,
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
      );
  }

}

class   ItemReverrallShimmer extends StatelessWidget {
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
              height: 0.01.sh,
            ),
          ],
        ),
      );
  }
}

  

