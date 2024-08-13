import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final String id;
  final String name;

  const CompanyEntity({
    required this.id,
    required this.name,
  });

  factory CompanyEntity.fromJson(Map<String, dynamic> json) => CompanyEntity(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
