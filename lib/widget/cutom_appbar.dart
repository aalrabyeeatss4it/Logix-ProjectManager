import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/Constants/Constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? colorAll;
  final Color? colorfont;
  final bool? IsHome;
  final bool? IconeEnd;
  @override
  final Size preferredSize;
  MyAppBar({Key? key, this.title,this.IsHome,  this.colorAll, this.colorfont, this.IconeEnd})
      : preferredSize = Size.fromHeight(0.07.sh),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
     return Column(
      children: [
        SizedBox(
          height: 0.04.sh,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:4.0.r),
          child:  Container(
            width: double.infinity,
            height:0.06.sh,
            decoration: ShapeDecoration(
              color: kColorsWhite.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child:  Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                      child:
                    Padding(
                      padding:  EdgeInsets.only(right:  10.0.r),
                      child:
                      SvgPicture.asset(
                        AssestData.menu,
                        width: 24.r ,
                        height: 24.r ,
                        color: kColorsBlackTow,
                      ),
                    ),

                  ) ,
                ),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Padding(
                      padding:   EdgeInsets.only(right:isRtl==true?  18.0:0,left:isRtl!=true?  18.0:0 ),
                      child: Text(title!,textAlign: TextAlign.center,  style: const TextStyle(     color: Color(0xFF242424),
                        fontSize: 16,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w500,
                        height: 1.02,),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child:
                  IconeEnd!=null? SizedBox():
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding:   EdgeInsets. only(right: isRtl==true? 18.0 : 0.0, left: isRtl!=true?18.0 : 0.0),
                      child: SvgPicture.asset(
                        AssestData.arrow_left,
                        width: 24  ,
                        height: 24 ,
                        color: kColorsBlackTow,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}