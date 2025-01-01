import 'dart:convert';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/DropDownLIst/user_name_model.dart';
import 'package:projectmanagers/Screen/Examploe/examole_controller.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/apiservice/file_piker.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:projectmanagers/widget/fileupload_widget.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:dio/dio.dart' as dio;

class ExamoleScreen extends StatefulWidget {
  @override
  State<ExamoleScreen> createState() => _ExamoleScreenState();
}

class _ExamoleScreenState extends State<ExamoleScreen> {
  final controller = Get.put(ExamoleController());

  final _formKeyDataAdd1 = GlobalKey<FormState>();


  @override
  initState() {
    super.initState();
    controller.fetchData();

    print("initState Called");
  }
  @override
  void dispose() {
    controller.dispose(); // إزالة المتحكم (Controller) عند التخلص من الصفحة
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //         Container(
            //         width: 400,
            //  height: 1185,
            //  clipBehavior: Clip.antiAlias,
            //  decoration: ShapeDecoration(
            //    color: Colors.white,
            //    shape: RoundedRectangleBorder(
            //      borderRadius: BorderRadius.circular(30),
            //    ),
            //  ),
            //  child: Stack(
            //    children: [
            //
            //      Positioned(
            //        left: 124,
            //        top: 68,
            //        child: Text(
            //          'حافظة عهدة جديدة',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF242424),
            //            fontSize: 16,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w500,
            //            height: 1.02,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 0,
            //        top: 1108,
            //        child: Container(
            //          width: 375,
            //          height: 77,
            //          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            //          decoration: ShapeDecoration(
            //            color: Colors.white,
            //            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            //            shadows: [
            //              BoxShadow(
            //                color: Color(0x0A000000),
            //                blurRadius: 25,
            //                offset: Offset(0, -7),
            //                spreadRadius: 0,
            //              )
            //            ],
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.center,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Container(
            //                width: 44,
            //                child: Column(
            //                  mainAxisSize: MainAxisSize.min,
            //                  mainAxisAlignment: MainAxisAlignment.start,
            //                  crossAxisAlignment: CrossAxisAlignment.center,
            //                  children: [
            //                    Container(
            //                      width: 24,
            //                      height: 24,
            //                      child: Row(
            //                        mainAxisSize: MainAxisSize.min,
            //                        mainAxisAlignment: MainAxisAlignment.center,
            //                        crossAxisAlignment: CrossAxisAlignment.center,
            //                        children: [
            //                          Container(width: 24, height: 24, child: Stack()),
            //                        ],
            //                      ),
            //                    ),
            //                    const SizedBox(height: 6),
            //                    SizedBox(
            //                      width: 32,
            //                      child: Text(
            //                        'التقاير',
            //                        textAlign: TextAlign.right,
            //                        style: TextStyle(
            //                          color: Color(0xFF292D32),
            //                          fontSize: 14,
            //                          fontFamily: 'GraphikArabic',
            //                          fontWeight: FontWeight.w400,
            //                        ),
            //                      ),
            //                    ),
            //                  ],
            //                ),
            //              ),
            //              const SizedBox(width: 30),
            //              Container(
            //                width: 74,
            //                child: Column(
            //                  mainAxisSize: MainAxisSize.min,
            //                  mainAxisAlignment: MainAxisAlignment.start,
            //                  crossAxisAlignment: CrossAxisAlignment.center,
            //                  children: [
            //                    Container(
            //                      width: 24,
            //                      height: 24,
            //                      child: Row(
            //                        mainAxisSize: MainAxisSize.min,
            //                        mainAxisAlignment: MainAxisAlignment.center,
            //                        crossAxisAlignment: CrossAxisAlignment.center,
            //                        children: [
            //                          Container(width: 24, height: 24, child: Stack()),
            //                        ],
            //                      ),
            //                    ),
            //                    const SizedBox(height: 6),
            //                    Text(
            //                      'حافظة العهدة',
            //                      textAlign: TextAlign.right,
            //                      style: TextStyle(
            //                        color: Color(0xFF0792AD),
            //                        fontSize: 14,
            //                        fontFamily: 'GraphikArabic',
            //                        fontWeight: FontWeight.w400,
            //                      ),
            //                    ),
            //                  ],
            //                ),
            //              ),
            //              const SizedBox(width: 30),
            //              Container(
            //                width: 97,
            //                child: Column(
            //                  mainAxisSize: MainAxisSize.min,
            //                  mainAxisAlignment: MainAxisAlignment.start,
            //                  crossAxisAlignment: CrossAxisAlignment.center,
            //                  children: [
            //                    Container(
            //                      width: 24,
            //                      height: 24,
            //                      child: Row(
            //                        mainAxisSize: MainAxisSize.min,
            //                        mainAxisAlignment: MainAxisAlignment.center,
            //                        crossAxisAlignment: CrossAxisAlignment.center,
            //                        children: [
            //                          Container(width: 24, height: 24, child: Stack()),
            //                        ],
            //                      ),
            //                    ),
            //                    const SizedBox(height: 6),
            //                    SizedBox(
            //                      width: 99,
            //                      child: Text(
            //                        'الخدمات الإلكترونية',
            //                        textAlign: TextAlign.right,
            //                        style: TextStyle(
            //                          color: Color(0xFF242424),
            //                          fontSize: 14,
            //                          fontFamily: 'GraphikArabic',
            //                          fontWeight: FontWeight.w400,
            //                        ),
            //                      ),
            //                    ),
            //                  ],
            //                ),
            //              ),
            //              const SizedBox(width: 30),
            //              Container(
            //                width: 44,
            //                child: Column(
            //                  mainAxisSize: MainAxisSize.min,
            //                  mainAxisAlignment: MainAxisAlignment.start,
            //                  crossAxisAlignment: CrossAxisAlignment.center,
            //                  children: [
            //                    Container(
            //                      width: 24,
            //                      height: 24,
            //                      child: Row(
            //                        mainAxisSize: MainAxisSize.min,
            //                        mainAxisAlignment: MainAxisAlignment.center,
            //                        crossAxisAlignment: CrossAxisAlignment.center,
            //                        children: [
            //                          Container(width: 24, height: 24, child: Stack()),
            //                        ],
            //                      ),
            //                    ),
            //                    const SizedBox(height: 6),
            //                    SizedBox(
            //                      width: 49,
            //                      child: Text(
            //                        'مشاريعي',
            //                        textAlign: TextAlign.right,
            //                        style: TextStyle(
            //                          color: Color(0xFF292D32),
            //                          fontSize: 14,
            //                          fontFamily: 'GraphikArabic',
            //                          fontWeight: FontWeight.w400,
            //                        ),
            //                      ),
            //                    ),
            //                  ],
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 332,
            //        top: 65,
            //        child: Container(
            //          width: 24,
            //          height: 24,
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.center,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Container(width: 24, height: 24, child: Stack()),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 272,
            //        top: 112,
            //        child: Text(
            //          'رقم مركز التكلفة',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 251,
            //        top: 136,
            //        child: Container(
            //          width: 108,
            //          height: 40,
            //          padding: const EdgeInsets.only(top: 8, left: 23, right: 10, bottom: 8),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'رقم مركز التكلفة',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 136,
            //        child: Container(
            //          width: 229,
            //          height: 40,
            //          padding: const EdgeInsets.only(
            //            top: 8,
            //            left: 142,
            //            right: 10,
            //            bottom: 8,
            //          ),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'اسم مركز التكلفة',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 326,
            //        top: 193,
            //        child: Text(
            //          'التاريخ',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 217,
            //        child: Container(
            //          width: 344,
            //          height: 40,
            //          child: Stack(
            //            children: [
            //              Positioned(
            //                left: 0,
            //                top: 0,
            //                child: Container(
            //                  width: 344,
            //                  height: 40,
            //                  padding: const EdgeInsets.only(
            //                    top: 8,
            //                    left: 276,
            //                    right: 10,
            //                    bottom: 8,
            //                  ),
            //                  clipBehavior: Clip.antiAlias,
            //                  decoration: ShapeDecoration(
            //                    shape: RoundedRectangleBorder(
            //                      side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //                      borderRadius: BorderRadius.circular(8),
            //                    ),
            //                  ),
            //                  child: Row(
            //                    mainAxisSize: MainAxisSize.min,
            //                    mainAxisAlignment: MainAxisAlignment.end,
            //                    crossAxisAlignment: CrossAxisAlignment.center,
            //                    children: [
            //                      Text(
            //                        '202/02/02',
            //                        textAlign: TextAlign.right,
            //                        style: TextStyle(
            //                          color: Color(0x66010B38),
            //                          fontSize: 12,
            //                          fontFamily: 'GraphikArabic',
            //                          fontWeight: FontWeight.w400,
            //                          height: 2,
            //                        ),
            //                      ),
            //                    ],
            //                  ),
            //                ),
            //              ),
            //              Positioned(
            //                left: 10,
            //                top: 10,
            //                child: Container(
            //                  width: 20,
            //                  height: 20,
            //                  padding: const EdgeInsets.symmetric(horizontal: 2.50, vertical: 1.67),
            //                  clipBehavior: Clip.antiAlias,
            //                  decoration: BoxDecoration(),
            //                  child: Row(
            //                    mainAxisSize: MainAxisSize.min,
            //                    mainAxisAlignment: MainAxisAlignment.center,
            //                    crossAxisAlignment: CrossAxisAlignment.center,
            //                    children: [
            //                      Container(
            //                        width: 15,
            //                        height: 16.67,
            //                        decoration: BoxDecoration(
            //                          image: DecorationImage(
            //                            image: NetworkImage("https://via.placeholder.com/15x17"),
            //                            fit: BoxFit.fill,
            //                          ),
            //                        ),
            //                      ),
            //                    ],
            //                  ),
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 285,
            //        top: 274,
            //        child: Text(
            //          'نوع المصروف',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 298,
            //        child: Container(
            //          width: 344,
            //          height: 40,
            //          child: Stack(
            //            children: [
            //              Positioned(
            //                left: 0,
            //                top: 0,
            //                child: Container(
            //                  width: 344,
            //                  height: 40,
            //                  padding: const EdgeInsets.only(
            //                    top: 8,
            //                    left: 316,
            //                    right: 10,
            //                    bottom: 8,
            //                  ),
            //                  clipBehavior: Clip.antiAlias,
            //                  decoration: ShapeDecoration(
            //                    shape: RoundedRectangleBorder(
            //                      side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //                      borderRadius: BorderRadius.circular(8),
            //                    ),
            //                  ),
            //                  child: Row(
            //                    mainAxisSize: MainAxisSize.min,
            //                    mainAxisAlignment: MainAxisAlignment.end,
            //                    crossAxisAlignment: CrossAxisAlignment.center,
            //                    children: [
            //                      Text(
            //                        'اختر',
            //                        textAlign: TextAlign.right,
            //                        style: TextStyle(
            //                          color: Color(0x66010B38),
            //                          fontSize: 12,
            //                          fontFamily: 'GraphikArabic',
            //                          fontWeight: FontWeight.w400,
            //                          height: 2,
            //                        ),
            //                      ),
            //                    ],
            //                  ),
            //                ),
            //              ),
            //              Positioned(
            //                left: 7,
            //                top: 12,
            //                child: Container(
            //                  width: 16,
            //                  height: 16,
            //                  padding: const EdgeInsets.only(
            //                    top: 6,
            //                    left: 3.33,
            //                    right: 3.32,
            //                    bottom: 5.33,
            //                  ),
            //                  clipBehavior: Clip.antiAlias,
            //                  decoration: BoxDecoration(),
            //                  child: Row(
            //                    mainAxisSize: MainAxisSize.min,
            //                    mainAxisAlignment: MainAxisAlignment.center,
            //                    crossAxisAlignment: CrossAxisAlignment.center,
            //                    children: [
            //
            //                    ],
            //                  ),
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 325,
            //        top: 353,
            //        child: Text(
            //          'المبلغ',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 315,
            //        top: 432,
            //        child: Text(
            //          'الإجمالي',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 325,
            //        top: 590,
            //        child: Text(
            //          'المورد',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 286,
            //        top: 511,
            //        child: Text(
            //          'الرقم الضريبي',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 140,
            //        top: 353,
            //        child: Text(
            //          'الضريبة',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 118,
            //        top: 511,
            //        child: Text(
            //          'رقم الفاتورة',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 194,
            //        top: 377,
            //        child: Container(
            //          width: 165,
            //          height: 40,
            //          padding: const EdgeInsets.only(top: 8, left: 99, right: 10, bottom: 8),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'أدخل المبلغ',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 456,
            //        child: Container(
            //          width: 344,
            //          height: 40,
            //          padding: const EdgeInsets.only(
            //            top: 8,
            //            left: 269,
            //            right: 10,
            //            bottom: 8,
            //          ),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'أدخل الإجمالي',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 614,
            //        child: Container(
            //          width: 344,
            //          height: 40,
            //          padding: const EdgeInsets.only(
            //            top: 8,
            //            left: 278,
            //            right: 10,
            //            bottom: 8,
            //          ),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'أدخل المورد',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 194,
            //        top: 535,
            //        child: Container(
            //          width: 165,
            //          height: 40,
            //          padding: const EdgeInsets.only(top: 8, left: 66, right: 10, bottom: 8),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'أدخل الرقم الضريبي',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 377,
            //        child: Container(
            //          width: 165,
            //          height: 40,
            //          padding: const EdgeInsets.only(top: 8, left: 94, right: 10, bottom: 8),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'أدخل الضريبة',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 535,
            //        child: Container(
            //          width: 165,
            //          height: 40,
            //          padding: const EdgeInsets.only(top: 8, left: 73, right: 10, bottom: 8),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'أدخل رقم الفاتورة',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 330,
            //        top: 669,
            //        child: Text(
            //          'البيان',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 693,
            //        child: Container(
            //          width: 344,
            //          height: 98,
            //          padding: const EdgeInsets.only(
            //            top: 8,
            //            left: 302,
            //            right: 10,
            //            bottom: 66,
            //          ),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'البيان..',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 306,
            //        top: 818,
            //        child: Text(
            //          'المرفقات',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF178CAF),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w600,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 288,
            //        top: 853,
            //        child: Text(
            //          'اسم المستند',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 15,
            //        top: 877,
            //        child: Container(
            //          width: 344,
            //          height: 40,
            //          padding: const EdgeInsets.only(
            //            top: 8,
            //            left: 236,
            //            right: 10,
            //            bottom: 8,
            //          ),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            shape: RoundedRectangleBorder(
            //              side: BorderSide(width: 1, color: Color(0xFFC8C8CC)),
            //              borderRadius: BorderRadius.circular(8),
            //            ),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.end,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Text(
            //                'أدخل اسم المستند ..',
            //                textAlign: TextAlign.right,
            //                style: TextStyle(
            //                  color: Color(0x66010B38),
            //                  fontSize: 12,
            //                  fontFamily: 'GraphikArabic',
            //                  fontWeight: FontWeight.w400,
            //                  height: 2,
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 294,
            //        top: 941,
            //        child: Text(
            //          'مسار الملف',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0xFF010B38),
            //            fontSize: 14,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 1.14,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 230,
            //        top: 969,
            //        child: Container(
            //          width: 129.38,
            //          height: 40,
            //          clipBehavior: Clip.antiAlias,
            //          decoration: BoxDecoration(),
            //          child: Column(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.start,
            //            crossAxisAlignment: CrossAxisAlignment.start,
            //            children: [
            //              Container(
            //                width: 129.38,
            //                height: 40,
            //                child: Stack(),
            //              ),
            //              Container(
            //                height: 14,
            //                child: Stack(
            //                  children: [
            //                    Positioned(
            //                      left: 0,
            //                      top: 0,
            //                      child: Text(
            //                        'تحميل',
            //                        style: TextStyle(
            //                          color: Color(0xFF3A5260),
            //                          fontSize: 12,
            //                          fontFamily: 'GraphikArabic',
            //                          fontWeight: FontWeight.w500,
            //                        ),
            //                      ),
            //                    ),
            //                  ],
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 147,
            //        top: 977,
            //        child: Text(
            //          'لا يوجد أرشيف',
            //          textAlign: TextAlign.right,
            //          style: TextStyle(
            //            color: Color(0x99242424),
            //            fontSize: 12,
            //            fontFamily: 'GraphikArabic',
            //            fontWeight: FontWeight.w400,
            //            height: 2,
            //          ),
            //        ),
            //      ),
            //      Positioned(
            //        left: 19,
            //        top: 1036,
            //        child: Container(
            //          width: 340,
            //          height: 48,
            //          padding: const EdgeInsets.symmetric(vertical: 12),
            //          clipBehavior: Clip.antiAlias,
            //          decoration: ShapeDecoration(
            //            color: Color(0xFF178CAF),
            //            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            //          ),
            //          child: Row(
            //            mainAxisSize: MainAxisSize.min,
            //            mainAxisAlignment: MainAxisAlignment.center,
            //            crossAxisAlignment: CrossAxisAlignment.center,
            //            children: [
            //              Expanded(
            //                child: Container(
            //                  height: double.infinity,
            //                  child: Stack(
            //                    children: [
            //                      Positioned(
            //                        left: 0,
            //                        top: 2,
            //                        child: Container(
            //                          width: 20,
            //                          height: 20,
            //                          padding: const EdgeInsets.symmetric(horizontal: 3.33, vertical: 4.17),
            //                          clipBehavior: Clip.antiAlias,
            //                          decoration: BoxDecoration(),
            //                          child: Row(
            //                            mainAxisSize: MainAxisSize.min,
            //                            mainAxisAlignment: MainAxisAlignment.center,
            //                            crossAxisAlignment: CrossAxisAlignment.center,
            //                            children: [
            //
            //                            ],
            //                          ),
            //                        ),
            //                      ),
            //                      Positioned(
            //                        left: 28,
            //                        top: 0,
            //                        child: Text(
            //                          'إضافة',
            //                          textAlign: TextAlign.center,
            //                          style: TextStyle(
            //                            color: Colors.white,
            //                            fontSize: 14,
            //                            fontFamily: 'GraphikArabic',
            //                            fontWeight: FontWeight.w500,
            //                            height: 1.71,
            //                          ),
            //                        ),
            //                      ),
            //                    ],
            //                  ),
            //                ),
            //              ),
            //            ],
            //          ),
            //        ),
            //      ),
            //    ],
            //  ),
            //         ),
            //         ],
            //       ),
          ],
        ),
      )
    );
  }
}



