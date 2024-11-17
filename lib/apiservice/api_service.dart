import 'dart:async';
import '/apiservice/url.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  dio.Dio _dio = dio.Dio();
  Future getData(String url, Map<String,dynamic>header  ) async {
    dio.Response   response;
    try{
      print("بداية  الريسبونس ");
      response= await _dio.get(urlBaseMy+url,options:
      dio.Options(headers: header ));
      // dio.Options(headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVU0VSX0lEIjoiMzYiLCJVU0VSX0ZVTExOQU1FIjoi2LnYqNiv2KfZhNmE2Ycg2KjZhiDYudio2K_Yp9mE2LnYstmK2LIg2KfZhNit2LPZitmG2YoiLCJVU0VSX0VNQUlMIjoibWVtYmVyQHNzNGl0LmNvbS5zYSIsIkdyb3Vwc19JRCI6IjQiLCJEZXBhcnRtZW50X0lEIjoiMCIsIlVzZXJUeXBlSWQiOiIxIiwiRXJwVXJsIjoiaHR0cDovL2xpamFudGVjaC5jb20iLCJEQlVybCI6Ijg1LjE5NS44OC4yNDJcXE1TU1FMU0VSVkVSMjAxOSIsIkRCTmFtZSI6ImxpamFudGVjaF9hcGkiLCJEQlVzZXJuYW1lIjoibGlqYW50ZWNoYXBpdXNlciIsIkRCUGFzc3dvcmQiOiIzNWowa1kmMGQiLCJuYmYiOjE2ODQwNzEyNzAsImV4cCI6MjYzMDg0MjQ3MCwiaWF0IjoxNjg0MDcxMjcwfQ.6raXgtTkIcoZAOIARCNDZiVW3VXkAM-61UaKA9qXFIg'} ));

      print(urlBaseMy+url);
      return response;
    }
    on dio.DioError catch(error){
      if(error.response!=null){
        print("خروج من الريسبونس ");
        response =error.response!;
        return response;
      }
    }
  }

  Future postData({required String url, required Map<String,dynamic>header ,required Map<String,dynamic> body}) async {
    dio.Response   response;
    print(urlBaseMy+url);
    try{
      print('ff');
      response= await _dio.post(urlBaseMy+url,options: dio.Options(headers: header),data:dio.FormData.fromMap( body),);
      return response;
    }
    on dio.DioError catch(error){
      print(error);
      if(error.response!=null){
        response =error.response!;
        return response;
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
    on dio.DioError catch(error){
      print(error);
      if(error.response!=null){
        response =error.response!;
        return response;
      }
    }
  }
}

