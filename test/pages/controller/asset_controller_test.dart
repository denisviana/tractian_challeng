import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/app/pages/controller/asset_controller.dart';
import 'package:my_app/core/domain/entity/asset_entity.dart';
import 'package:my_app/core/domain/use_case/get_assets_usecase.dart';
import 'package:my_app/core/domain/use_case/get_locations_use_case.dart';

class MockGetLocationsUseCase extends Mock implements GetLocationsUseCase {}

class MockGetAssetsUseCase extends Mock implements GetAssetsUseCase {}

void main() {
  group('AssetController - Search Functionality', () {
    late AssetController controller;
    late MockGetLocationsUseCase mockGetLocationsUseCase;
    late MockGetAssetsUseCase mockGetAssetsUseCase;

    setUp(() {
      mockGetLocationsUseCase = MockGetLocationsUseCase();
      mockGetAssetsUseCase = MockGetAssetsUseCase();
      controller =
          AssetController(mockGetAssetsUseCase, mockGetLocationsUseCase);
    });

    test('Search filters the assets correctly', () async {
      // Arrange
      final assets = [
        const AssetEntity(id: '1', name: 'Motor', locationId: 'loc1'),
        const AssetEntity(id: '2', name: 'Conveyor Belt', locationId: 'loc2'),
      ];
      controller.assets.assignAll(assets);

      // Act
      controller.onSearchQueryChanged('Motor');
      await Future.delayed(const Duration(milliseconds: 400));
      controller.applyFilters();

      // Assert
      expect(controller.filteredAssets.length, 1);
      expect(controller.filteredAssets.first.name, 'Motor');
    });
  });

  group('AssetController - Critical Status Filtering', () {
    late AssetController controller;
    late MockGetLocationsUseCase mockGetLocationsUseCase;
    late MockGetAssetsUseCase mockGetAssetsUseCase;

    setUp(() {
      mockGetLocationsUseCase = MockGetLocationsUseCase();
      mockGetAssetsUseCase = MockGetAssetsUseCase();
      controller =
          AssetController(mockGetAssetsUseCase, mockGetLocationsUseCase);
    });

    test('Critical status filter works correctly', () {
      // Arrange
      final assets = [
        const AssetEntity(id: '1', name: 'Motor', status: 'operating'),
        const AssetEntity(id: '2', name: 'Conveyor Belt', status: 'alert'),
      ];
      controller.assets.assignAll(assets);
      controller.filterCritical.value = true;

      // Act
      controller.applyFilters();

      // Assert
      expect(controller.filteredAssets.length, 1);
      expect(controller.filteredAssets.first.name, 'Conveyor Belt');
    });
  });
}
