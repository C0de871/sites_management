// Model Class
import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/band_entity.dart';

class BandModel extends BandEntity {
  BandModel({
    super.bandType,
    super.rbs1Type,
    super.rbs2Type,
    super.du1Type,
    super.du2Type,
    super.ru1Type,
    super.ru2Type,
    super.remarks,
  });

  factory BandModel.fromMap(Map<String, dynamic> data) {
    return BandModel(
      bandType: data[ApiKey.bandType] as String?,
      rbs1Type: data[ApiKey.rbs1Type] as String?,
      rbs2Type: data[ApiKey.rbs2Type],
      du1Type: data[ApiKey.du1Type] as String?,
      du2Type: data[ApiKey.du2Type],
      ru1Type: data[ApiKey.ru1Type] as String?,
      ru2Type: data[ApiKey.ru2Type],
      remarks: data[ApiKey.remarks] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.bandType: bandType,
        ApiKey.rbs1Type: rbs1Type,
        ApiKey.rbs2Type: rbs2Type,
        ApiKey.du1Type: du1Type,
        ApiKey.du2Type: du2Type,
        ApiKey.ru1Type: ru1Type,
        ApiKey.ru2Type: ru2Type,
        ApiKey.remarks: remarks,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BandModel].
  factory BandModel.fromJson(String data) {
    return BandModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BandModel] to a JSON string.
  String toJson() => json.encode(toMap());

  BandModel copyWith({
    String? bandType,
    String? rbs1Type,
    dynamic rbs2Type,
    String? du1Type,
    dynamic du2Type,
    String? ru1Type,
    dynamic ru2Type,
    String? remarks,
  }) {
    return BandModel(
      bandType: bandType ?? this.bandType,
      rbs1Type: rbs1Type ?? this.rbs1Type,
      rbs2Type: rbs2Type ?? this.rbs2Type,
      du1Type: du1Type ?? this.du1Type,
      du2Type: du2Type ?? this.du2Type,
      ru1Type: ru1Type ?? this.ru1Type,
      ru2Type: ru2Type ?? this.ru2Type,
      remarks: remarks ?? this.remarks,
    );
  }
}
