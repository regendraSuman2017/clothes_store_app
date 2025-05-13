abstract class IApiService {

  Future<dynamic> post({
    required String endpoint,
    required Map<String, dynamic> payload,
  });

  Future<dynamic> postFormData({
    required String endpoint,
    required Map<String, String> formData,
  });


}
