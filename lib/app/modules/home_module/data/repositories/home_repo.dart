import 'package:clothers_store_app/app/data/services/api_end_point.dart';
import 'package:clothers_store_app/app/data/services/api_response.dart';
import 'package:clothers_store_app/app/data/services/api_services/api_services.dart';
import 'package:clothers_store_app/app/modules/home_module/data/repositories/home_repo.i.dart';

class HomeRepoImpl implements IHomeRepo {
  final ApiService? apiService;

  HomeRepoImpl({ApiService? apiService})
      : apiService = apiService ?? ApiService(baseUrl: ApiEndPoint.baseUrl);

  @override
  Future<ApiResponse> getAllProduct() async {
    return await apiService!.get(
      endpoint: ApiEndPoint.products,
    );
  }

  @override
  Future<ApiResponse> getAllCategory() async {
    try {
      final response = await apiService!.get(
        endpoint: ApiEndPoint.categories,
      );
      print('📥 Category API Response - Status: ${response.statusCode}');
      print('📦 Category Data: ${response.data}');
      return response;
    } catch (e) {
      print('❌ Category API Error: $e');
      return ApiResponse.failure('Failed to fetch categories: $e', 500);
    }
  }
}
