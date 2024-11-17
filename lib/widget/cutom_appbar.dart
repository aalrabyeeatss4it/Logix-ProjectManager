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
      : preferredSize = Size.fromHeight(0.11.sh),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Column(
      children: [
        SizedBox(
          height: 0.01.sh,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:4.0.r),
          child:  Container(
            width: double.infinity,
            height: 0.10.sh,
            child: Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right:   4.r,left: 4.r),
                  child: Container(
                    width: 0.98.sw,
                    height:0.08.sh,
                    decoration: ShapeDecoration(
                      color: Color(0xFF9BB7DA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),),),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height:0.07.sh,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3570B7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () => zoomDrawerController!.toggle!(),
                          child:
                          Padding(
                            padding:  EdgeInsets.all(3.0.r),
                            child: SvgPicture.asset(
                              "assets/Icons/menu.svg",
                              width: 24.r ,
                              height: 24.r ,
                              color: kColorsWhite,
                            ),
                          ),

                        )
                      ),
                      Expanded(
                        flex: 8,
                        child: Center(
                          child: Text(title!, style: Theme.of(context).textTheme.titleLarge!.copyWith(color:kColorsWhite,fontWeight: FontWeight.w600,fontSize: 16, )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:IsHome==true? Padding(
                          padding:  EdgeInsets.all(4.0.r),
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(RoutingApp.notifcation_screen);
                            },
                            child: SvgPicture.asset(
                              "assets/Icons/notification.svg",
                              width: 24.r ,
                              height: 24.r ,
                              color: kColorsWhite,
                            ),
                          ),
                        ):InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Padding(
                            padding:  EdgeInsets.all(10.0.r),
                            child:      isRtl?
                            SvgPicture.asset(
                              "assets/Icons/arrow-left.svg",
                              width: 24.r ,
                              height: 24.r ,
                              color: kColorsWhite,
                            )

                                :
                            SvgPicture.asset(
                              "assets/Icons/arrow-leftt.svg",
                              width: 24.r ,
                              height: 24.r ,
                              color: kColorsWhite,
                            )
                          ),
                        ),
                      ),
                    ],
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