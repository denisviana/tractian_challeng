import 'package:injectable/injectable.dart';
import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/base/base_use_case.dart';
import 'package:my_app/core/domain/entity/asset_entity.dart';

import '../repositories/asset_repository.dart';

@injectable
class GetAssetsUseCase
    extends BaseFutureResourceUseCase<String, List<AssetEntity>> {
  final AssetRepository _repository;

  GetAssetsUseCase(this._repository);

  Future<Resource<List<AssetEntity>>> call(String params) =>
      _repository.getAssets(params);
}
