import 'package:dio/dio.dart';
import '../utils/session.dart';
import 'api_const.dart';

class ApiRepository {
  static Dio client = Dio();

  // static Future<dynamic> getAPI(String apiName, {required Map<String, String> headers})
  static Future<dynamic> getAPI(String apiName) async {
    try {
      String callingUrl;
      apiName == "health"
          ? callingUrl = ApiConst.mainUrl + apiName
          : callingUrl = ApiConst.mainUrl + apiName;
      String token = await Session().getToken();
      if (token.isNotEmpty) {
        client.options.headers["authorization"] = "Bearer " + token;
      }
      print("url: ${callingUrl}");

      var response = await client.get(callingUrl);
      // todo: response come when status is 200 only
      print("$response");
      return response;
    } on DioException catch (e) {
      print("error     " + e.response.toString() + e.error.toString());
      if (e.response != null) {
        return e.response;
      } else {
        var err = {'"status"': 'false', '"message"': '"${e.message}"'};
        return err;
      }
    }
  }

  static Future<dynamic> putAPI(String apiName, var formData) async {
    try {
      String callUrl = ApiConst.mainUrl + apiName;
      String token = await Session().getToken();
      print("url:----- ${callUrl}");
      print("token:--- ${token}");
      print("data :--- ${formData.toString()}");

      if (token.isNotEmpty) {
        client.options.headers["authorization"] = "Bearer " + token;
      } // todo:token get if present or required!
      var response = await client.put(callUrl, data: formData);
      // todo: response come when status is 200 only
      return response;
    } on DioException catch (e) {
      print(e.response);
      return e.response;
    }
  }

  static Future<dynamic> deleteAPI(String apiName, {Object? data}) async {
    try {
      String callUrl = ApiConst.mainUrl + apiName;
      String token = await Session().getToken();

      client.options.headers["authorization"] = "Bearer " + token;
      print("url: ${callUrl}");
      // print("data : ${data.toString()}");
      print("Tag Delete call---------------------${data}");
      var response = data != null
          ? await client.delete(callUrl, data: data)
          : await client.delete(callUrl);
      print("Tag Deleted---------------------");
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  static Future<dynamic> postAPI(String apiName, var formData) async {
    try {
      String callUrl = ApiConst.mainUrl + apiName;

      String token = await Session().getToken();
      print("<<<<<<<<<<<<<<<<<   $callUrl ");

      if (token.isNotEmpty) {
        client.options.headers["authorization"] = "Bearer $token";
      } // todo:token get if present or required!

      var response = await client.post(callUrl, data: formData);
      // todo: response come when status is 200 only

      return response;
    } on DioException catch (e) {
      //todo: other Exception code come here or message return
      if (e.response != null) {
        return e.response;
      } else {
        var err = {'"status"': 'false', '"message"': '"${e.message}"'};
        return err;
      }
    }
  }
}
