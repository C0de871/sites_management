import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/fiber_information_entity.dart';

class FiberInformationsModel extends FiberInformationsEntity {
  FiberInformationsModel({
    super.destination,
    super.remark,
  });

  factory FiberInformationsModel.fromMap(Map<String, dynamic> data) {
    return FiberInformationsModel(
      destination: data[ApiKey.destination] as String?,
      remark: data[ApiKey.remark] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.destination: destination,
        ApiKey.remark: remark,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FiberInformationsModel].
  factory FiberInformationsModel.fromJson(String data) {
    return FiberInformationsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FiberInformationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  FiberInformationsModel copyWith({
    String? destination,
    String? remark,
  }) {
    return FiberInformationsModel(
      destination: destination ?? this.destination,
      remark: remark ?? this.remark,
    );
  }
}