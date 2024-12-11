

import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_controller.dart';

import '/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
   Categories(   {
    Key? key,this.width,this.fun,
  }) : super(key: key);
  final double ?width;

  final Function() ?fun;
    List<String> Tab_Bar = [
   // "المحاضر المرسله", "اللوائح والأنظمه ذات العلاقه","الأعضاء ","الجلسات ","إعدادات المجلس ",
    'Members'.tr,
    'Rules & Regulations'.tr,
  ];
    List<String> Tab_Bar2 = [
    // "المحاضر المرسله", "اللوائح والأنظمه ذات العلاقه","الأعضاء ","الجلسات ","إعدادات المجلس ",
    'Members'.tr,
    'Rules & Regulations'.tr
  ];
   final  controller =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
    return Padding(
      padding: EdgeInsets.only(
        top: 10.w,
      ),
      child:stg.read(UserType.toString())!='member'? Container(
        height: 25.w,
        width:double.infinity,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: Tab_Bar.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await controller.onSelectCategory(ind:index,id:stg.read(AppMapKey.value));
              },
              //});
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: controller.selectedCategoryIndex == index
                      ? BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kColorsPrimary, kColorsPrimary]),
                    borderRadius: BorderRadius.circular(7.r),
                  )
                      : BoxDecoration(
                    color: kColorbackgroundCard,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.0.w),
                          child: Text(
                            Tab_Bar[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                color:
                                controller.selectedCategoryIndex == index
                                    ? kColorsWhite
                                    : Color(0xff5A86C1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
          :Container(
        height: 25.w,
        width:double.infinity,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: Tab_Bar2.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await controller.onSelectCategory(ind:index,id:stg.read(AppMapKey.value));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: controller.selectedCategoryIndex == index
                      ? BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kColorsPrimary, kColorsPrimary]),
                    borderRadius: BorderRadius.circular(7.r),
                  )
                      : BoxDecoration(
                    color: kColorbackgroundCard,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.0.w),
                          child: Text(
                            Tab_Bar2[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                                color:
                                controller.selectedCategoryIndex == index
                                    ? kColorsWhite
                                    : Color(0xff5A86C1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

