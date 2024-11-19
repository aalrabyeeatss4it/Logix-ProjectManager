import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/Constants/Constants.dart';



class AppBarEsyDox extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? colorAll;
  final Color? colorfont;
  final bool? EndIcon;
  final ZoomDrawerController? zoomDrawerController ;
  @override
  final Size preferredSize;
  AppBarEsyDox({Key? key, this.title, this.zoomDrawerController, this.colorAll, this.EndIcon, this.colorfont})
      : preferredSize = Size.fromHeight(0.16.sh),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:0.0.r),
      child:  Container(
        width: double.infinity,
        height: 0.155.sh,
        child: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.only(right:   4.r,left: 4.r),
              child: Container(
                width: double.infinity,
                height:0.08.sh,
                decoration: ShapeDecoration(
                  color: Color(0xFF9BB7DA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),),),
              ),
            ),
            Container(
              width: double.infinity,
              height:0.07.sh,
              decoration: ShapeDecoration(
                color: Color(0xFF3570B7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
              ),
              child:  Column(
                children: [
                  SizedBox(height: 0.02.sh,),
                  Row(
                    children: [

                      SizedBox(width: 0.03.sw,),
                      InkWell(
                        onTap: () {
                          zoomDrawerController!.toggle!();
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            color: kColorsWhite.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(7.0.r),
                          ),
                          height: 33,
                          width: 33,
                          child: SvgPicture.asset(
                            "assets/Icons/menu.svg",
                            width: 24,
                            height: 24,
                            color: kColorsWhite,
                          ),
                        ),
                      ),
                      SizedBox(width: 0.22.sw,),


                    ],
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}