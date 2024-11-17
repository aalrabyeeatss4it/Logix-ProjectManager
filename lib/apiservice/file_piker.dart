
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:projectmanagers/Constants/Constants.dart';

 class FilePickerController extends GetxController{

   var filePath='';
      Uint8List? byte;
   var name='';
   var baseFile='';
   DateTime currentTime = DateTime.now();
   getFilePath({Function? onDone}) async {
     Get.bottomSheet(
         Container(
           height: 0.30.sh,
           width: 0.90.sw,
           child: CupertinoActionSheet(
       actions: <CupertinoActionSheetAction>[
           CupertinoActionSheetAction(
             isDefaultAction: true,
             onPressed: () {
               Get.back();
               chooseFile(type: FileType.image,onDone: onDone);
               update();

             },
             child:  Text( 'Gallery'.tr,style:  TextStyle(
                 fontSize: 14.sp,
                 color: kColorsPrimary
             )),
           ),
           CupertinoActionSheetAction(
             onPressed: () {
               Get.back();
               chooseFile(type: FileType.custom,onDone: onDone);
               update();
             },
             child:  Text('Files'.tr,style:  TextStyle(
                 fontSize: 14.sp,
                 color: kColorsPrimary
             )),
           ),
           CupertinoActionSheetAction(
             isDestructiveAction: true,
             onPressed: () {
               Get.back();
             },
             child:  Text('Cancel'.tr,style:  TextStyle(
                 fontSize: 14.sp,
                 color: kColorsRed
             ),),
           )
       ],
     ),
         ));

   }

   chooseFile({ required FileType type,Function? onDone}) async {
     print('Hotheefa file');
     try {
       var result = await FilePicker.platform.pickFiles(
         type:type,
         allowedExtensions:type==FileType.image?null: ['jpg', 'pdf', 'doc','ppt','mdb','docx','xlsx','jpeg','jpg','png','gif'],);
       if (result == null) {
         print(' file is null');
         return;
       }
       PlatformFile file = result.files.first;

       name =file.name;
       //name=file.name+currentTime.toString();
       // baseFile.value = base64Encode(file.path.codeUnits);
       // print("File name: " + file.name);
       filePath = file.path!;
       byte = file.bytes;
       String m= file.runtimeType.toString();

       print("File Type: " + m);
       print("File path: " + filePath.split( '/' ).last);
       update();
       if(onDone!=null) {
         onDone();
       }//
       return file.path;
     } on PlatformException catch (e) {
       print("Error while picking the file: " + e.toString());
     }
   }



 }