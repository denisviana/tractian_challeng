import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/core/api/api_service.dart';

@Injectable(as: ApiService)
class ApiServiceImpl extends ApiService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<Response<dynamic>> fetchCompanies() => _dio.get('/companies');

  @override
  Future<Response<dynamic>> fetchLocations(String companyId) =>
      _dio.get('/companies/$companyId/locations');

  @override
  Future<Response<dynamic>> fetchAssets(String companyId) =>
      _dio.get('/companies/$companyId/assets');
}
