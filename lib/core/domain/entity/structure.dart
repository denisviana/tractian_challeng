import 'asset_entity.dart';
import 'company_entity.dart';
import 'location_entity.dart';

class CompanyStructure {
  final CompanyEntity company;
  final List<LocationStructure> locations;

  CompanyStructure({required this.company, required this.locations});
}

class LocationStructure {
  final LocationEntity location;
  final List<AssetEntity> assets;

  LocationStructure({required this.location, required this.assets});
}