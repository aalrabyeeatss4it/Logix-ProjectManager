import 'dart:async';
import '/apiservice/url.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  dio.Dio _dio = dio.Dio();
  Future getData(String url, Map<String,dynamic>header  ) async {
    print(urlBaseMy+url);
    try{
      print("بداية  الريسبونس ");
      final response  = await _dio.get(urlBaseMy+url,options: dio.Options(headers: header ));
      print("\nresponse.statusCode: ${response.statusCode}");
      print("\nresponse.body: ${response.data}\n");
      return response; // تأكد من إعادة الاستجابة بشكل متسق
    }
    on dio.DioError catch (error) {
      print("DioError: ${error.message}");
      if (error.response != null) {
        print("Error Response: ${error.response!.data}");
        return error.response!;
      } else {
        print("Error: ${error.message}");
      }
    }
  }

  Future postData({required String url, required Map<String,dynamic>header ,required Map<String,dynamic> body}) async {
    print(urlBaseMy+url);
    try{
      final response = await _dio.post(urlBaseMy + url, options: dio.Options(headers: header), data: dio.FormData.fromMap(body),);
      return response; // تأكد من إعادة الاستجابة بشكل متسق
    }
    on dio.DioError catch (error) {
      print("DioError: ${error.message}");
      if (error.response != null) {
        print("Error Response: ${error.response!.data}");
        return error.response; // إعادة الاستجابة للأخطاء
      } else {
        print("Error: ${error.message}");
        return null; // إعادة قيمة null في حالة عدم وجود استجابة
      }
    }
  }

  Future postDataLogin({required String url, required Map<String,dynamic>header ,required Map<String,dynamic> body}) async {
    dio.Response   response;
    print("تم الوصول".tr);
    print(urlBaseMy+url);
    try{
      response= await _dio.post(urlBaseMy+url,options: dio.Options(headers:header),
        data:body,
        onSendProgress: (count, total) => Center(child: CircularProgressIndicator()),);
      return response;
    }
    on dio.DioError catch (error) {
      print("DioError: ${error.message}");
      if (error.response != null) {
        print("Error Response: ${error.response!.data}");
        return error.response; // إعادة الاستجابة للأخطاء
      } else {
        print("Error: ${error.message}");
        return null; // إعادة قيمة null في حالة عدم وجود استجابة
      }
    }
  }
}

