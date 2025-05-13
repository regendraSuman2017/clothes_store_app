import 'package:clothers_store_app/app/data/services/api_response.dart';

abstract class ILoginRepo{
  Future<ApiResponse>loginAPI(signPayload);
}