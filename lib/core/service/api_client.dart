import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:trading/helper/shared_prefe/shared_prefe.dart';
import 'package:trading/utils/app_const/app_const.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_url.dart';



class ApiClient extends GetxService {
  static var client = http.Client();
  static final Logger logger = Logger();

  static const String somethingWentWrong = "Something Went Wrong";
  static const int timeoutInSeconds = 30;

  static String bearerToken = "";


  //============================= CHECK INTERNET =============================
  static Future<bool> _checkConnection() async {
    return await Connectivity().checkConnectivity() != ConnectivityResult.none;
  }


  //============================= GET REQUEST ================================
  static Future<Response> getData(
      String uri, {
        Map<String, String>? headers,
      }) async {
    if (!await _checkConnection()) {
      return const Response(statusCode: 0, statusText: 'No Internet Connection');
    }

    bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Accept': 'application/json',
      'Authorization': "Bearer $bearerToken",
    };

    try {
      logger.i("➡️ GET REQUEST=====================================\nURL:===================================== $uri\nHeaders:=========================================== ${headers ?? mainHeaders}");

      http.Response response = await client
          .get(Uri.parse(ApiUrl.baseUrl + uri), headers: headers ?? mainHeaders)
          .timeout(const Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      logger.e("❌ GET Error:==================================== $e");
      return const Response(statusCode: 1, statusText: somethingWentWrong);
    }
  }

  //============================= POST REQUEST ================================
  static Future<Response> postData(
      String uri,
      dynamic body, {
        Map<String, String>? headers,
        bool isJson = true,
      }) async {
    if (!await _checkConnection()) {
      return const Response(statusCode: 0, statusText: 'No Internet Connection');
    }

    bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = isJson
        ? {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $bearerToken",
    }
        : {
      'Accept': 'application/json',
      'Authorization': "Bearer $bearerToken",
    };

    try {
      logger.i("User Create POST REQUEST==========================================\nURL:======================================= $uri\nHeaders:=================================== ${headers ?? mainHeaders}\nBody:================================================== $body");

      http.Response response = await client
          .post(
        Uri.parse(ApiUrl.baseUrl + uri),
        body: isJson ? jsonEncode(body) : body,
        headers: headers ?? mainHeaders,
      )
          .timeout(const Duration(seconds: timeoutInSeconds));
///server response here===================================================================
      return handleResponse(response, uri);
    } catch (e) {
      logger.e("❌ POST Error server:================================================ $e");
      return const Response(statusCode: 1, statusText: somethingWentWrong);
    }
  }













  //============================= PATCH REQUEST ================================
  static Future<Response> patchData(
      String uri,
      dynamic body, {
        Map<String, String>? headers,
        bool isJson = true,
      }) async {
    if (!await _checkConnection()) {
      return const Response(statusCode: 0, statusText: 'No Internet Connection');
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bearerToken = ( sharedPreferences.getString(AppConstants.bearerToken))!;

    var mainHeaders = isJson
        ? {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $bearerToken",
    }
        : {
      'Accept': 'application/json',
      'Authorization': "Bearer $bearerToken",
    };

    try {
      logger.i("➡️ PATCH REQUEST===============================================\nURL:=============================================== $uri\nHeaders:========================================== ${headers ?? mainHeaders}\nBody:================================== $body");

      http.Response response = await client
          .patch(
        Uri.parse(ApiUrl.baseUrl + uri),
        body: isJson ? jsonEncode(body) : body,
        headers: headers ?? mainHeaders,
      )
          .timeout(const Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      logger.e("❌ PATCH Error:============================================================== $e");
      return const Response(statusCode: 1, statusText: somethingWentWrong);
    }
  }


  ///=========================multipart patch===================================================================



  static Future<Response> patchMultipartData(
      String uri,
      Map<String, String> body, {
        List<MultipartBody>? multipartBody,
        Map<String, String>? headers,
      }) async {
    try {
      bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);

      var mainHeaders = {
        'Accept': 'application/json',
        'Authorization': "Bearer $bearerToken",
      };

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse(ApiUrl.baseUrl + uri),
      );

      request.fields.addAll(body);

      if (multipartBody != null && multipartBody.isNotEmpty) {
        for (var element in multipartBody) {
          var mimeType = lookupMimeType(element.file.path) ?? 'application/octet-stream';
          var multipartImg = await http.MultipartFile.fromPath(
            element.key,
            element.file.path,
            contentType: MediaType.parse(mimeType),
          );
          request.files.add(multipartImg);
        }
      }

      request.headers.addAll(mainHeaders);

      var streamedResponse = await request.send();
      final responseString = await streamedResponse.stream.bytesToString();

      debugPrint('====> API Response [${streamedResponse.statusCode}]: $uri\n$responseString');

      return Response(
        statusCode: streamedResponse.statusCode,
        body: jsonDecode(responseString),
      );
    } catch (e) {
      debugPrint('Multipart PATCH Error: $e');
      return Response(
        statusCode: 500,
        body: {"message": "Something went wrong"},
      );
    }
  }
  //============================= MULTIPART POST ================================
  static Future<Response> postMultipartData(
      String uri,
      Map<String, String> body, {
        List<MultipartBody>? multipartBody,
      }) async {
    try {
      bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);

      var headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer $bearerToken",
      };

      var request = http.MultipartRequest("POST", Uri.parse(ApiUrl.baseUrl + uri));

      request.fields.addAll(body);
      request.headers.addAll(headers);

      logger.i("➡️ MULTIPART POST==============================================================================\nURL:======================================================================== $uri\nBody Fields:============================================================= $body");

      // Attach Files
      if (multipartBody != null) {
        for (var element in multipartBody) {
          var mimeType = lookupMimeType(element.file.path) ?? "image/jpeg";

          logger.i("📎 File Attached:=========================== ${element.file.path} → ${element.key}");

          request.files.add(
            await http.MultipartFile.fromPath(
              element.key,
              element.file.path,
              contentType: MediaType.parse(mimeType),
            ),
          );
        }
      }

      http.StreamedResponse response = await request.send();
      final content = await response.stream.bytesToString();

      logger.i("⬅️ MULTIPART RESPONSE [$uri]:============================================ $content");

      return Response(
        statusCode: response.statusCode,
        body: jsonDecode(content),
        statusText: somethingWentWrong,
      );
    } catch (e) {
      logger.e("❌ MULTIPART POST Error:====================================================== $e");
      return const Response(statusCode: 1, statusText: somethingWentWrong);
    }
  }

  //============================= PUT REQUEST ================================
  static Future<Response> putData(
      String uri,
      dynamic body, {
        Map<String, String>? headers,
      }) async {
    if (!await _checkConnection()) {
      return const Response(statusCode: 0, statusText: 'No Internet Connection');
    }

    bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $bearerToken",
    };

    try {
      logger.i("➡️ PUT REQUEST========================================================\nURL:===================================================== $uri\nBody:===================================================== $body");

      http.Response response = await client
          .put(
        Uri.parse(ApiUrl.baseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? mainHeaders,
      )
          .timeout(const Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      logger.e("❌ PUT Error:===================================================================== $e");
      return const Response(statusCode: 1, statusText: somethingWentWrong);
    }
  }

  //============================= DELETE REQUEST ================================
  static Future<Response> deleteData(
      String uri, {
        dynamic body,
        Map<String, String>? headers,
      }) async {
    bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $bearerToken",
    };

    try {
      logger.i("🗑️ DELETE REQUEST====================================================\nURL:======================================= $uri\nBody:==================================================== $body");

      http.Response response = await client
          .delete(
        Uri.parse(ApiUrl.baseUrl + uri),
        headers: headers ?? mainHeaders,
        body: body,
      )
          .timeout(const Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      logger.e("❌ DELETE Error:================================================ $e");
      return const Response(statusCode: 1, statusText: somethingWentWrong);
    }
  }

  //============================= HANDLE RESPONSE ================================
  static Response handleResponse(http.Response response, String uri) {
    dynamic data;

    try {
      data = jsonDecode(response.body);
    } catch (_) {
      data = response.body;
    }

    logger.i(
      "⬅️ RESPONSE FOR Server=============================== [$uri]\nStatus:============================================= ${response.statusCode}\nBody:===================================== ${response.body}",
    );

    return Response(
      statusCode: response.statusCode,
      body: data,
      statusText: response.reasonPhrase,
      headers: response.headers,
    );
  }
}

class MultipartBody {
  String key;
  File file;
  MultipartBody(this.key, this.file);
}

