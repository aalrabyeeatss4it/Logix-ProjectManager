
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:projectmanagers/Constants/Constants.dart';

class CustomSubmitOptionDialog extends StatelessWidget {
  CustomSubmitOptionDialog({

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
          borderRadius: BorderRadius.circular(25.0), // شكل الزوايا
        ),
        child: Container(
          alignment: Alignment.center,
           height:heightContainer!=null?heightContainer!.sh! : 0.25.sh,
           width: .9.sw,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                  alignment: Alignment.center,
                  width: .7.sw,
                  child: Text(text!,textAlign: TextAlign.center,style:const TextStyle(
                      fontSize: 16,
                      color: kColorsBlack,
                      fontWeight: FontWeight.w500
                  ),)),
              SizedBox(height: 0.03.sh,),
              Row(

                children: [
                  Expanded(
                      flex: 1,child: SizedBox()),
                  Expanded(
                    flex: 10,
                    child: SizedBox(
                      child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))
                              ,backgroundColor: backColor1),
                          onPressed: onPress, child: Text(text1!,style:  TextStyle(
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
                        }, child: Text(text2!,style:  TextStyle(
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
              )
            ],
          ),
        ),
      ),

    );
  }
}