class ComponentEntity {
  final String id;
  final String name;
  final String? parentId;
  final String? sensorId;
  final String sensorType;
  final String status;
  final String? gatewayId;

  ComponentEntity({
    required this.id,
    required this.name,
    required this.sensorType,
    required this.status,
    this.parentId,
    this.sensorId,
    this.gatewayId,
  });

  factory ComponentEntity.fromJson(Map<String, dynamic> json) => ComponentEntity(
      id: json['id'],
      name: json['name'],
      sensorType: json['sensorType'],
      status: json['status'],
      parentId: json['parentId'],
      sensorId: json['sensorId'],
      gatewayId: json['gatewayId'],
    );

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'sensorType': sensorType,
      'status': status,
      'parentId': parentId,
      'sensorId': sensorId,
      'gatewayId': gatewayId,
    };
}
