import 'package:clothers_store_app/app/data/services/api_response.dart';

abstract class IHomeRepo{
  Future<ApiResponse>getAllProduct();
  Future<ApiResponse>getAllCategory();

}