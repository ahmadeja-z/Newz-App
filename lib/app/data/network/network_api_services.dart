import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw SocketException('No Internet Connection');
    } on TimeoutException {
      throw TimeoutException('Request Time Out');
    } catch (e) {
      throw AppExceptions('Unexpected Error:$e ');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // Successful response
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        // Bad request
        throw InvalidUrlException(
            'Bad Request: The request could not be understood or was missing required parameters.');

      case 401:
        // Unauthorized
        throw UnauthorizedException(
            'Unauthorized: Access is denied due to invalid credentials.');

      case 403:
        // Forbidden
        throw ForbiddenException(
            'Forbidden: The server understood the request, but it refuses to authorize it.');

      case 404:
        // Not Found
        throw NotFoundException(
            'Not Found: The requested resource could not be found.');

      case 500:
        // Internal Server Error
        throw ServerException(
            'Internal Server Error: An error occurred on the server.');

      case 503:
        // Service Unavailable
        throw ServiceUnavailableException(
            'Service Unavailable: The server is currently unavailable (overloaded or down).');

      default:
        // Other unhandled status codes
        throw AppExceptions('Unexpected Error: ${response.statusCode}');
    }
  }
}
