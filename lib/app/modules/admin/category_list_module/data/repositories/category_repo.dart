import 'package:clothers_store_app/app/data/services/api_end_point.dart';
import 'package:clothers_store_app/app/data/services/api_response.dart';
import 'package:clothers_store_app/app/data/services/api_services/api_services.dart';
import 'package:clothers_store_app/app/modules/admin/category_list_module/data/repositories/category_repo.i.dart';

 class CategoryRepoImpl implements ICategoryRepo{

   final ApiService? apiService;

   CategoryRepoImpl({ApiService? apiService}) : apiService = apiService ?? ApiService(baseUrl: ApiEndPoint.baseUrl);

   @override
  Future<ApiResponse> addCategoryAPI(signPayload) async {
      return await apiService!.post(
          endpoint: ApiEndPoint.categories,
          payload: signPayload);
  }
  @override
  Future<ApiResponse> getCategoryAPI() async {
      return await apiService!.get(
          endpoint: ApiEndPoint.categories,
      );
  }
}