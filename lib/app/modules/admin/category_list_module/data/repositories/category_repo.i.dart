import 'package:clothers_store_app/app/data/services/api_response.dart';

abstract class ICategoryRepo{
  Future<ApiResponse>getCategoryAPI();
  Future<ApiResponse>addCategoryAPI(signPayload,name,path);
}