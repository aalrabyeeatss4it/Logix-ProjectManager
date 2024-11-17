
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContinerWithTowIcon extends StatelessWidget {
  CustomContinerWithTowIcon({
    Key ?key,this.isIconEnd, this.onPress, this.text,this.IconBerore,this.IconColore}) : super(key: key);
  final Function()? onPress;
  final String? text;
  final String? IconBerore;
  final Color? IconColore;
  final bool? isIconEnd;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap:onPress,
        borderRadius:BorderRadius.circular(15.r) ,
        child:Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 0.05.sw,right:  0.05.sw),
              child: Container(
                height: 0.08.sh,
                decoration: BoxDecoration(
                  color: Color(0xffEBF1F8),
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: kColorsLightBlackLow.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 5.r,
                      offset:Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r,left: 5.0.r,right: 10.0.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal:  7.0.r,vertical: 8.0.r),
                          child: SvgPicture.asset(
                            IconBerore!,
                            width: 24.r ,
                            height: 24.r ,
                            color: kColorsPrimary,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 7.0.r,right: 7.0.r),
                          child: Text(
                              text.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff242424),
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child:   SvgPicture.asset(
                            "assets/Icons/arrow-left.svg",
                            width: 24.r,
                            height: 24.r,
                            color: kColorsIcon,
                          )
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0.h,
            ),
          ],
        )
    );
  }
}