import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:fgitapp/helpers.dart/toast.dart';
import 'package:fgitapp/utils/string_constants.dart';

import '../../helpers.dart/applog.dart';
import '../../utils/api_constants.dart';

class CallApi {
  final String baseUrl;

  CallApi(this.baseUrl);

  Future<dio.Response> getData(String apiUrl,
      {Map<String, dynamic>? headers}) async {
    Map<String, dynamic>? apiHeader = {};

    String baseUrl = ApiUrls.appBaseUrl;

    try {
      var response = await dio.Dio().get(baseUrl + apiUrl,
          options: dio.Options(
              sendTimeout: const Duration(minutes: 1),
              receiveTimeout: const Duration(minutes: 1),
              headers: apiHeader));
      applog(
          ":::::::::::::::REQUEST BODY ${baseUrl + apiUrl.toString()}:::::::::::");
      applog(
          ":::::::::::::::REQUEST BODY ${response.headers.toString()}:::::::::::");

      applog(
          ":::::::::::::::API SUCCESS ${response.data.toString()}::::::::::");

      return response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401 || e.response!.statusCode == 404) {
          applog(ResString.error);
        }
        if (e.response!.statusCode == 503) {
          showErrorToast(ResString.serverError);
        }
        applog(":::::::::::::API SUCCESS ${e.response!.statusCode}: ");
        try {
          return dio.Response(
              statusCode: e.response!.statusCode ?? 0,
              statusMessage: e.response!.data['message'] ?? "",
              requestOptions: dio.RequestOptions(
                  sendTimeout: const Duration(minutes: 1),
                  receiveTimeout: const Duration(minutes: 1),
                  path: baseUrl + apiUrl));
        } catch (ea) {
          return dio.Response(
              requestOptions: dio.RequestOptions(
                  sendTimeout: const Duration(minutes: 1),
                  receiveTimeout: const Duration(minutes: 1),
                  path: baseUrl + apiUrl),
              statusMessage: " Something went wrong... Try again");
        }
      } else {
        applog(":::::::::::::API FAILURE::::::::::::::");
        applog(
            ":::::::::::::::REQUEST URL ${baseUrl + apiUrl.toString()}:::::::::::");
        if (e.error is SocketException) {
          applog(ResString.noInternetMsg);
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          applog(ResString.connectionTimeOutMsg);
        }

        return dio.Response(
            requestOptions: dio.RequestOptions(
                sendTimeout: const Duration(minutes: 1),
                receiveTimeout: const Duration(minutes: 1),
                path: baseUrl + apiUrl),
            statusMessage: ResString.error,
            statusCode: 000);
      }
    }
  }
}
