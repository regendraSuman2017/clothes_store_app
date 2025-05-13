import 'package:clothers_store_app/app/data/services/api_end_point.dart';
import 'package:clothers_store_app/app/data/services/api_response.dart';
import 'package:clothers_store_app/app/data/services/api_services/api_services.dart';
import 'package:clothers_store_app/app/modules/authentication/sign_up_module/data/repositories/sign_up_repo.i.dart';

 class SignUpRepoImpl implements ISignUpRepo{

   final ApiService? apiService;

   SignUpRepoImpl({ApiService? apiService}) : apiService = apiService ?? ApiService(baseUrl: ApiEndPoint.baseUrl);

   @override
  Future<ApiResponse> signUpAPI(signPayload) async {
      return await apiService!.post(
          endpoint: ApiEndPoint.signUp,
          payload: signPayload);
  }
}