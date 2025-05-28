import 'package:clothers_store_app/app/data/services/api_response.dart';

abstract class IProductRepo{

  Future<ApiResponse>getProductAPI();
  Future<ApiResponse>addProductAPI(productPayload,name,path);
}