import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/entity/company_entity.dart';
import 'package:my_app/core/domain/entity/location_entity.dart';

import '../entity/asset_entity.dart';

abstract class AssetRepository {
  Future<Resource<List<CompanyEntity>>> getCompanies();

  Future<Resource<List<LocationEntity>>> getLocations(String companyId);

  Future<Resource<List<AssetEntity>>> getAssets(String companyId);
}
