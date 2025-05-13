import 'package:clothers_store_app/app/data/services/api_response.dart';

abstract class IProductDetailRepo{
  Future<ApiResponse>fetchProductById(argument);

}