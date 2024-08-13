import 'package:injectable/injectable.dart';
import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/base/base_use_case.dart';
import 'package:my_app/core/domain/entity/location_entity.dart';
import 'package:my_app/core/domain/repositories/asset_repository.dart';

@injectable
class GetLocationsUseCase
    extends BaseFutureResourceUseCase<String, List<LocationEntity>> {
  final AssetRepository assetRepository;

  GetLocationsUseCase({required this.assetRepository});

  @override
  Future<Resource<List<LocationEntity>>> call(String params) =>
      assetRepository.getLocations(params);
}
