import 'package:flutter_svg/flutter_svg.dart';
import '/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class AddSuccsessDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // شكل الزوايا
        ),
        color: kColorsWhite,
        child: Container(
          height: 0.17.sh,
          width: .92.sw,
             child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        SizedBox(
                          width: 0.42.sw,
                        ),
                        const  Padding(
                          padding:const EdgeInsets.all(3.0),
                          child: Text('' ,
                            style: const TextStyle(
                                fontSize: 14,
                                color: kColorsBlack
                            ),),
                        ),
                      ],
                    ),

                     Padding(
                      padding:const EdgeInsets.only(top: 12.0,right: 12.0,left: 12.0),
                       child:
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child:  Container(
                            height: 20 ,
                            width: 20 ,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: kColorsWhite,
                            ),
                            child:  SvgPicture.asset(
                              "assets/Icon/exitread.svg",
                              height: 20 ,
                              width: 20 ,

                            ),

                          )),
                    ),
                  ]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                    SvgPicture.asset(
                    "assets/Icon/addsuccess.svg",
                    width: 29,
                    height: 29,
                    color: kColorsPrimaryFont,

                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  Text('تم إرسال الطلب بنجاح!'.tr ,
                    style: const TextStyle(
                        fontSize: 16,
                        color: kColorsPrimaryFont,
                      fontWeight: FontWeight.w500
                    ),),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}