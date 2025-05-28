import 'dart:convert';
import 'dart:developer';
import 'package:clothers_store_app/app/data/services/api_response.dart';
import 'package:clothers_store_app/app/data/services/api_services/api_services.i.dart';
import 'package:clothers_store_app/app/utils/helpers.dart';
import 'package:http/http.dart' as http;

class ApiService implements IApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});


  @override
  Future<ApiResponse<dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {
    final Uri url = Uri.parse('$baseUrl$endpoint');

    log("POST $url");
    log("Payload: ${json.encode(payload)}");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(payload),
      );

      log("Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response.body, response.statusCode);
      } else {
        try {
          final data = jsonDecode(response.body);
          return ApiResponse.failure(data['message'], response.statusCode);
        } catch (e) {
          return ApiResponse.failure(response.body, response.statusCode);
        }
      }
    } catch (e) {
      return ApiResponse.failure('Error during POST request: $e', 500);
    }
  }

  Future<ApiResponse<dynamic>> get({
    required String endpoint,
  }) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      log("Status Code: ${url}");

      // Get token from SharedPreferences
      final token = await TokenHelper.getToken();
      log("Status Code: ${token}");
      final response = await http.get(url,headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Optional but good practice
      },);
      log("Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Every thuink is find ${response.body}");
        return ApiResponse.success(response.body, response.statusCode);
      } else {
        return ApiResponse.failure(
            'Failed to GET data. Status code: ${response.statusCode}',
            response.statusCode);
      }
    } catch (e) {
      return ApiResponse.failure('Error during GET request: $e', 500);
    }
  }

  // New POST request with form data
  @override
  Future<ApiResponse<dynamic>> postFormData({
    required String endpoint,
    required Map<String, dynamic> formData,
    List<http.MultipartFile>? files, // Optional file uploads
  }) async {
    final url = Uri.parse('$baseUrl/$endpoint');

    try {

      // Create a multipart request
      final request = http.MultipartRequest('POST', url);

      // Add regular form fields
      formData.forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      // Add files if provided
      if (files != null && files.isNotEmpty) {
        request.files.addAll(files);
      }

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response.body, response.statusCode);
      } else {
        return ApiResponse.failure(
          'Failed to POST form data. Status code: ${response.statusCode}',
          response.statusCode,
        );
      }
    } catch (e) {
      return ApiResponse.failure('Error during FormData POST: $e', 500);
    }
  }
}
