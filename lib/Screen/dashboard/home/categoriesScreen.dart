

import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_controller.dart';
import 'package:projectmanagers/Screen/dashboard/home/item_task_new.dart';
import 'package:projectmanagers/Screen/dashboard/home/item_task_old.dart';

import '/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


// تأكد من استيراد الحزم الضرورية

class Categories extends StatefulWidget {
  Categories({Key? key, this.width, this.fun}) : super(key: key);
  final double? width;
  final Function()? fun;

  List<String> Tab_Bar = [
    'مهام الشهر الحالي'.tr,
    'المهام المستقبليه'.tr,
  ];

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final controller = Get.put(HomeController());
  int selectedIndex = 0; // متغير لتتبع العنصر النشط

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.07.sh,
          color: kColorsWhiteTow,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    width: 0.65.sw,
                    decoration: BoxDecoration(
                      color: Color(0xffEBEBEB),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.Tab_Bar.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index; // تحديث العنصر النشط
                            });
                            controller.onSelectCategory(ind: index, id: stg.read(AppMapKey.value));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
                              decoration: controller.selectedCategoryIndex == index
                                  ? BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xff0692AC), Color(0xff0692AC)]),
                                borderRadius: BorderRadius.circular(7.r),
                              )
                                  : BoxDecoration(
                                color: Color(0xffEBEBEB),
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.0.w),
                                    child: Text(
                                      widget.Tab_Bar[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: controller.selectedCategoryIndex == index ? kColorsWhite : Color(0xff5A86C1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // عرض العنصر المناسب بناءً على selectedIndex
        if (selectedIndex == 0)
        Expanded(
        child: ListView.builder(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(vertical: 10.r),
    itemCount: 3,
    itemBuilder: (context, index) =>
    ItemTaskOld()),
    )
        else
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 10.r),
                itemCount: 3,
                itemBuilder: (context, index) =>
                    ItemTaskNew()),
          ),
      ],
    );
  }
}

