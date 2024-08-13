import 'package:injectable/injectable.dart';
import 'package:my_app/core/api/api_service.dart';
import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/entity/asset_entity.dart';
import 'package:my_app/core/domain/entity/company_entity.dart';
import 'package:my_app/core/domain/entity/location_entity.dart';
import 'package:my_app/core/domain/repositories/asset_repository.dart';

@Injectable(as: AssetRepository)
class AssetRepositoryImpl implements AssetRepository {
  final ApiService api;

  AssetRepositoryImpl(this.api);

  @override
  Future<Resource<List<CompanyEntity>>> getCompanies() async =>
      Resource.asFuture(() async {
        final response = await api.fetchCompanies();
        return (response.data as List)
            .map((json) => CompanyEntity.fromJson(json))
            .toList();
      });

  @override
  Future<Resource<List<LocationEntity>>> getLocations(String companyId) async =>
      Resource.asFuture(() async {
        final response = await api.fetchLocations(companyId);
        return (response.data as List)
            .map((json) => LocationEntity.fromJson(json))
            .toList();
      });

  @override
  Future<Resource<List<AssetEntity>>> getAssets(String companyId) async =>
      Resource.asFuture(() async {
        final response = await api.fetchAssets(companyId);
        return (response.data as List)
            .map((json) => AssetEntity.fromJson(json))
            .toList();
      });
}
