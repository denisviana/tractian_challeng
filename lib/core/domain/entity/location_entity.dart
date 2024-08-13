class LocationEntity {
  final String id;
  final String name;
  final String? parentId;

  LocationEntity({
    required this.id,
    required this.name,
    this.parentId,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) => LocationEntity(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
    );

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'parentId': parentId,
    };
}
