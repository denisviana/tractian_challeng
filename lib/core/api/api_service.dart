import 'package:dio/dio.dart';


abstract class ApiService {
  Future<Response<dynamic>> fetchCompanies();

  Future<Response<dynamic>> fetchLocations(String companyId);

  Future<Response<dynamic>> fetchAssets(String companyId);
}
