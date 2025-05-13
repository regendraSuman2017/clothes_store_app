import 'package:clothers_store_app/app/data/services/api_end_point.dart';
import 'package:clothers_store_app/app/data/services/api_response.dart';
import 'package:clothers_store_app/app/data/services/api_services/api_services.dart';
import 'package:clothers_store_app/app/modules/product_detail_module/data/repositories/product_detail_repo.i.dart';

 class ProductDetailRepoImpl implements IProductDetailRepo{

   final ApiService? apiService;

   ProductDetailRepoImpl({ApiService? apiService}) : apiService = apiService ?? ApiService(baseUrl: ApiEndPoint.baseUrl);

   @override
  Future<ApiResponse> fetchProductById(argument) async {
      return await apiService!.get(endpoint: '${ApiEndPoint.products+'/'+argument}',);
  }

}