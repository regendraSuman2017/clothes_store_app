import 'package:clothers_store_app/app/data/services/api_end_point.dart';
import 'package:clothers_store_app/app/data/services/api_response.dart';
import 'package:clothers_store_app/app/data/services/api_services/api_services.dart';
import 'package:clothers_store_app/app/modules/authentication/login_module/data/repositories/login_repo.i.dart';

 class LoginRepoImpl implements ILoginRepo{

   final ApiService? apiService;

   LoginRepoImpl({ApiService? apiService}) : apiService = apiService ?? ApiService(baseUrl: ApiEndPoint.baseUrl);

   @override
  Future<ApiResponse> loginAPI(signPayload) async {
      return await apiService!.post(
          endpoint: ApiEndPoint.login,
          payload: signPayload);
  }
}