import 'package:clothers_store_app/app/data/services/api_end_point.dart';
import 'package:clothers_store_app/app/data/services/api_response.dart';
import 'package:clothers_store_app/app/data/services/api_services/api_services.dart';
import 'package:clothers_store_app/app/modules/admin/product_module/data/repositories/product_repo.i.dart';
import 'package:clothers_store_app/app/utils/helpers.dart';
import 'package:http/http.dart' as http;

 class ProductRepoImpl implements IProductRepo{

   final ApiService? apiService;

   ProductRepoImpl({ApiService? apiService}) : apiService = apiService ?? ApiService(baseUrl: ApiEndPoint.baseUrl);

   @override
   Future<ApiResponse> addProductAPI( signPayload,  filePath, path) async {
     final url = Uri.parse('${ApiEndPoint.baseUrl}/${ApiEndPoint.product}');
     try {
       final request = http.MultipartRequest('POST',  url, );

       final token = await TokenHelper.getToken();
       // ✅ Add Authorization Token
       request.headers['Authorization'] = 'Bearer $token';
       request.headers['Accept'] = 'application/json';

       // ✅ Add image file
       request.files.add(await http.MultipartFile.fromPath("image", path));

       // ✅ Add form fields
       signPayload.forEach((key, value) {
         if (value != null) {
           request.fields[key] = value.toString();
         }
       });

       // ✅ Send request
       final streamedResponse = await request.send();
       final response = await http.Response.fromStream(streamedResponse);

       print('📦 Status Code: ${response.statusCode}');
       print('📦 Response Body: ${response.body}');

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

   @override
  Future<ApiResponse> getProductAPI() async {
      return await apiService!.get(
          endpoint: ApiEndPoint.product,
      );
  }
}