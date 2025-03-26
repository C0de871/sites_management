import 'package:equatable/equatable.dart';
import '../../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

import '../../../../../core/databases/api/end_points.dart';

class GetVisitedSitesModel extends GetVisitedSitesEntity with EquatableMixin {
  const GetVisitedSitesModel({
    super.name,
    super.code,
    super.area,
    super.street,
    super.city,
  });

  factory GetVisitedSitesModel.fromMap(Map<String, dynamic> data) {
    return GetVisitedSitesModel(
      name: data[ApiKey.name] as String?,
      code: data[ApiKey.code] as String?,
      area: data[ApiKey.area] as String?,
      street: data[ApiKey.street] as String?,
      city: data[ApiKey.city] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.name: name,
        ApiKey.code: code,
        ApiKey.area: area,
        ApiKey.street: street,
        ApiKey.city: city,
      };

  GetVisitedSitesModel copyWith({
    String? name,
    String? code,
    String? area,
    String? street,
    String? city,
  }) {
    return GetVisitedSitesModel(
      name: name ?? this.name,
      code: code ?? this.code,
      area: area ?? this.area,
      street: street ?? this.street,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props => [name, code, area, street, city];
}
