import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable{
  final String id;
  final String name;
  final String? locationId;
  final String? parentId;
  final String? sensorType;
  final String? status;

  const AssetEntity({
    required this.id,
    required this.name,
    this.locationId,
    this.parentId,
    this.sensorType,
    this.status,
  });

  factory AssetEntity.fromJson(Map<String, dynamic> json) => AssetEntity(
      id: json['id'],
      name: json['name'],
      locationId: json['locationId'],
      parentId: json['parentId'],
      sensorType: json['sensorType'],
      status: json['status'],
    );

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'locationId': locationId,
      'parentId': parentId,
      'sensorType': sensorType,
      'status': status,
    };

  @override
  List<Object?> get props => [
    id,
    name,
    locationId,
    parentId,
    sensorType,
    status,
  ];
}
