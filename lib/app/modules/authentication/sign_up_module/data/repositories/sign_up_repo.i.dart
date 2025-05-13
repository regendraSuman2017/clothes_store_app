import 'package:clothers_store_app/app/data/services/api_response.dart';

abstract class ISignUpRepo{
  Future<ApiResponse>signUpAPI(signPayload);

}