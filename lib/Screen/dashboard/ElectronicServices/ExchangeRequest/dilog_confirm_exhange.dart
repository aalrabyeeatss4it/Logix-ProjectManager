import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import '/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class DialogConfirmExchange extends StatelessWidget {
  DialogConfirmExchange({

    Key ?key, required this.onPress, this.text,this.backColor1,this.backColor2,this.fontColortext2,this.text1,this.text2,this.fontColortext1,this.Colore,this.ColoreCleare,this.heightContainer,this.borderColor2
  }) : super(key: key);
  final Function() onPress;
  final String ?text;
  final String ?text1;
  final String ?text2;
  final Color? backColor1;
  final Color? backColor2 ;
  final Color? fontColortext1 ;
  final Color? fontColortext2 ;
  final Color? borderColor2 ;
  final Color? Colore ;
  final Color? ColoreCleare ;
  final double? heightContainer;





  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colore,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // شكل الزوايا
        ),
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal:  8.0),
          child: Container(
            alignment: Alignment.center,
            height:  0.45.sh,
            width: .9.sw,

            child: Column(
              children: [
                SizedBox(
                  height: 0.02.sh,
                ),
                Text("تأكيد بيانات الطلب",style: const TextStyle( color: Color(0xFF242424),
                  fontSize: 16,
                  fontFamily: 'GraphikArabic',
                  fontWeight: FontWeight.w500,
                  height: 1.02,),),
                SizedBox(
                  height: 0.015.sh,
                ),
                TextFieldWidget(
                  text: 'البند '.tr,
                  hint: 'أدخل البند'.tr,
                  sizeFontText: 12,
                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                  edit: 1,
                  color: Color(0xffC8C9CC).withOpacity(0.3) ,
                  colorborder: Color(0xffC8C9CC).withOpacity(0.3) ,
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                TextFieldWidget(
                  text: 'اسم الصنف '.tr,
                  hint: 'أدخل اسم الصنف'.tr,
                  sizeFontText: 12,
                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                  edit: 1,
                  color: Color(0xffC8C9CC).withOpacity(0.3) ,
                  colorborder: Color(0xffC8C9CC).withOpacity(0.3) ,
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                TextFieldWidget(
                  text: 'الكمية   '.tr,
                  hint: 'أدخل  الكمية'.tr,
                  sizeFontText: 12,
                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                  edit: 1,
                  color: Color(0xffC8C9CC).withOpacity(0.3) ,
                  colorborder: Color(0xffC8C9CC).withOpacity(0.3) ,
                ),

                SizedBox(
                  height: 0.03.sh,
                ),
                Row(

                  children: [

                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))
                                ,backgroundColor: backColor1),
                            onPressed: onPress, child: Text(text1!,style: TextStyle(
                          fontSize: 16,
                          color: fontColortext1,
                          fontWeight: FontWeight.w500,

                        ))),
                      ),
                    ),
                    Expanded(
                        flex: 1,child: SizedBox()),

                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        child: TextButton(

                          style: TextButton.styleFrom(   backgroundColor: backColor2,
                              shape: RoundedRectangleBorder(borderRadius:
                              BorderRadius.circular(5.r,),side: BorderSide(color:borderColor2!=null?borderColor2! : Color(0xFFB6000D),width: 1.w))
                            // ,backgroundColor: kColorsPrimery
                          ),
                          onPressed: (){
                            Get.back();
                          }, child: Text(text2!,style: TextStyle(
                          fontSize: 16,
                          color: fontColortext2,
                          fontWeight: FontWeight.w500,
                        )),),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: SizedBox()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}