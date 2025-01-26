// Model Class
import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/amperes_entity.dart';

class AmperesModel extends AmperesEntity {
  AmperesModel({
    super.capacity,
    super.time,
    super.cableLength,
    super.details,
  });

  factory AmperesModel.fromMap(Map<String, dynamic> data) {
    return AmperesModel(
      capacity: data[ApiKey.capacity] as String?,
      time: data[ApiKey.time] as String?,
      cableLength: data[ApiKey.cableLength] as String?,
      details: data[ApiKey.details] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.capacity: capacity,
        ApiKey.time: time,
        ApiKey.cableLength: cableLength,
        ApiKey.details: details,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AmperesModel].
  factory AmperesModel.fromJson(String data) {
    return AmperesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AmperesModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AmperesModel copyWith({
    String? capacity,
    String? time,
    String? cableLength,
    String? details,
  }) {
    return AmperesModel(
      capacity: capacity ?? this.capacity,
      time: time ?? this.time,
      cableLength: cableLength ?? this.cableLength,
      details: details ?? this.details,
    );
  }
}
