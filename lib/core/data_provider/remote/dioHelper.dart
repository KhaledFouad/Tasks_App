import 'package:dio/dio.dart';
import 'package:tasks_app/core/constants/EndPoints.dart';
import 'package:tasks_app/core/constants/const.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseURL,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        // headers:{
        //   'Content-Type' : 'application/json',
        //   'lang' : 'en',
        // },
      ),
    );
  }

  // static Future<Response> getData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   String lang = 'en',
  //   String? token, required endPoint,
  // }) async {
  //   return await dio.get(url);
  // }
  static Future<Response> getData(String baseURL,
      {required String endPoint,
      String? token,
      Map<String, dynamic>? header}) async {
    dio!.options.headers = header ??
        {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${Const.userToken}",
        };
    return await dio!.get(endPoint);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'bearer $token',
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'bearer $token',
    };
    return dio.put(url, queryParameters: query, data: data);
  }

  Future<List<dynamic>> getDapartments() async {
    try {
      final response = await DioHelper.getData(Endpoints.baseURL,
          endPoint: Endpoints.getAllDepartment, token: Const.userToken);
      // print(response.data['data']);
      return response.data['data'];
    } catch (e) {
      print("555555555555555555555");
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getUsers() async {
    try {
      final response = await DioHelper.getData(Endpoints.baseURL,
          endPoint: Endpoints.getAllUser, token: Const.userToken);
      // print(response.data['data']);
      return response.data['data'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getEmployees() async {
    try {
      final response = await DioHelper.getData(Endpoints.baseURL,
          endPoint: Endpoints.getAllEmployees, token: Const.userToken);
      // print(response.data['data']);
      return response.data['data'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getTasks() async {
    try {
      final response = await DioHelper.getData(Endpoints.baseURL,
          endPoint: Endpoints.getAllTasks, token: Const.userToken);
      // print(response.data['data']);
      return response.data['data'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
