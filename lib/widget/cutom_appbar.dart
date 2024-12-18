import 'package:projectmanagers/router/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/Constants/Constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? colorAll;
  final Color? colorfont;
  final bool? IsHome;
  final ZoomDrawerController? zoomDrawerController ;
  @override
  final Size preferredSize;
  MyAppBar({Key? key, this.title,this.IsHome, this.zoomDrawerController, this.colorAll, this.colorfont})
      : preferredSize = Size.fromHeight(0.06.sh),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
     return Column(
      children: [

        Padding(
          padding:  EdgeInsets.symmetric(horizontal:4.0.r),
          child:  Container(
            width: double.infinity,
            height: 0.06.sh,
            child: Container(
              width: double.infinity,
              height:0.07.sh,
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
                    child: IsHome!=true?InkWell(
                        onTap: () {
                          Get.back();
                          // zoomDrawerController!.toggle!();
                        },
                        child:
                      Padding(
                        padding:  EdgeInsets.only(right:  10.0.r),
                        child:
                        SvgPicture.asset(
                          "assets/Icon/Line arrow-rightttt.svg",
                          width: 24.r ,
                          height: 24.r ,
                          color: kColorsPrimaryFont,
                        ),
                        // SvgPicture.asset(
                        //   "assets/Icons/menu.svg",
                        //   width: 24.r ,
                        //   height: 24.r ,
                        //   color: kColorsWhite,
                        // ),
                      ),

                    ):Container()
                  ),
                  Expanded(
                    flex: 8,
                    child: Center(
                      child: Padding(
                        padding:   EdgeInsets.only(right:isRtl==true?  18.0:0,left:isRtl!=true?  18.0:0 ),
                        child: Text(title!,textAlign: TextAlign.center, style:    Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontFamily: 'Regular',color:kColorsBlack,fontWeight: FontWeight.w500,fontSize: 16, )
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                    IsHome==true? Container(
                      // margin: EdgeInsets.only(top: 6.0.r, bottom: 4.0.r, left: 8.0.r, right:  8.0.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color:  Color(0xffF0F8FA),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(4.0.r),
                        child: InkWell(
                          onTap: (){

                          },
                          child: Row(
                            children: [
                              Text("العربيه ", style:
                              // TextStyle(color:kColorsPrimaryFont,fontWeight: FontWeight.bold,fontSize: 12, )
                              Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: kColorsPrimaryFont,fontWeight: FontWeight.bold,fontSize: 12)
                              ),
                              SvgPicture.asset(
                                "assets/Icon/GlobeSimple.svg",
                                width: 24.r ,
                                height: 24.r ,
                                color: kColorsPrimaryFont,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ):  Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}