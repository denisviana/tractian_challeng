import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/domain/entity/asset_entity.dart';
import '../../../core/domain/entity/location_entity.dart';

class AssetNodeWidget extends StatelessWidget {
  final LocationEntity? location;
  final AssetEntity? asset;
  final List<AssetEntity> locationAssets;
  final List<AssetEntity> allAssets;

  const AssetNodeWidget({
    required this.location,
    required this.asset,
    required this.locationAssets,
    required this.allAssets,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (location != null) {
      return _buildLocationNode();
    } else if (asset != null) {
      return _buildAssetNode();
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildLocationNode() {
    final hasChildren = locationAssets.isNotEmpty;

    return ExpansionTile(
      title: _buildNodeTitle(
        icon: Icons.location_on,
        text: location!.name,
        isBold: true,
      ),
      childrenPadding: const EdgeInsets.only(left: 16),
      children: hasChildren
          ? locationAssets
              .map((asset) => AssetNodeWidget(
                    location: null,
                    asset: asset,
                    locationAssets: const [],
                    allAssets: allAssets,
                  ))
              .toList()
          : [_buildEmptyNode('No assets available')],
    );
  }

  Widget _buildAssetNode() {
    final assetComponents =
        allAssets.where((child) => child.parentId == asset!.id).toList();
    final hasChildren = assetComponents.isNotEmpty;

    return ExpansionTile(
      title: _buildNodeTitle(
        icon: Icons.build,
        text: asset!.name,
        sensorType: asset!.sensorType,
        status: asset!.status,
      ),
      childrenPadding: const EdgeInsets.only(left: 16),
      children: hasChildren
          ? assetComponents
              .map((component) => AssetNodeWidget(
                    location: null,
                    asset: component,
                    locationAssets: const [],
                    allAssets: allAssets,
                  ))
              .toList()
          : [_buildEmptyNode('No components available')],
    );
  }

  Widget _buildNodeTitle({
    required IconData icon,
    required String text,
    String? sensorType,
    String? status,
    bool isBold = false,
  }) => Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis, // Ensures the text doesn't overflow
          ),
        ),
        if (sensorType != null)
          Icon(
            sensorType == 'energy' ? Icons.bolt : Icons.circle,
            color: status == 'alert' ? Colors.red : Colors.green,
            size: 16,
          ),
      ],
    );


  Widget _buildEmptyNode(String message) => ListTile(
        title: Text(message),
        leading: const Icon(Icons.info_outline, color: Colors.grey),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(IterableProperty<AssetEntity>('locationAssets', locationAssets));
        properties.add(IterableProperty<AssetEntity>('allAssets', allAssets));
        properties.add(DiagnosticsProperty<LocationEntity?>('location', location));
        properties.add(DiagnosticsProperty<AssetEntity?>('asset', asset));
  }
}
