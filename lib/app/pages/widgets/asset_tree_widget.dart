import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/domain/entity/asset_entity.dart';
import '../../../core/domain/entity/location_entity.dart';
import 'asset_node_widget.dart';

class AssetTreeWidget extends StatelessWidget {
  final List<LocationEntity> locations;
  final List<AssetEntity> assets;

  const AssetTreeWidget({
    required this.locations,
    required this.assets,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: locations.map((LocationEntity location) {
          // Find the assets that belong to this location
          final locationAssets =
              assets.where((asset) => asset.locationId == location.id).toList();

          return AssetNodeWidget(
            location: location,
            locationAssets: locationAssets,
            allAssets: assets,
            asset: null,
          );
        }).toList(),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<LocationEntity>('locations', locations));
    properties.add(IterableProperty<AssetEntity>('assets', assets));
  }
}
