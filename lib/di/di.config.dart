// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_service.dart' as _i589;
import '../core/api/api_service_impl.dart' as _i504;
import '../core/data/repository/asset_repository_impl.dart' as _i481;
import '../core/domain/repositories/asset_repository.dart' as _i42;
import '../core/domain/use_case/get_assets_usecase.dart' as _i87;
import '../core/domain/use_case/get_companies_use_case.dart' as _i137;
import '../core/domain/use_case/get_locations_use_case.dart' as _i90;
import 'modules/remote_module.dart' as _i616;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final remoteModule = _$RemoteModule();
    gh.singleton<_i361.Dio>(() => remoteModule.provideDio());
    gh.factory<_i589.ApiService>(() => _i504.ApiServiceImpl(gh<_i361.Dio>()));
    gh.factory<_i42.AssetRepository>(
        () => _i481.AssetRepositoryImpl(gh<_i589.ApiService>()));
    gh.factory<_i137.GetCompaniesUseCase>(
        () => _i137.GetCompaniesUseCase(gh<_i42.AssetRepository>()));
    gh.factory<_i87.GetAssetsUseCase>(
        () => _i87.GetAssetsUseCase(gh<_i42.AssetRepository>()));
    gh.factory<_i90.GetLocationsUseCase>(() =>
        _i90.GetLocationsUseCase(assetRepository: gh<_i42.AssetRepository>()));
    return this;
  }
}

class _$RemoteModule extends _i616.RemoteModule {}
