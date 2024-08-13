import 'package:injectable/injectable.dart';
import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/repositories/asset_repository.dart';

import '../base/base_use_case.dart';
import '../entity/company_entity.dart';

@injectable
class GetCompaniesUseCase
    extends BaseFutureResourceUseCase<void, List<CompanyEntity>> {
  final AssetRepository _assetRepository;

  GetCompaniesUseCase(this._assetRepository);

  @override
  Future<Resource<List<CompanyEntity>>> call([void params]) =>
      _assetRepository.getCompanies();
}
