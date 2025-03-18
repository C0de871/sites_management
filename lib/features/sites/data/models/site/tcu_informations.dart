import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/tcu_info_entity.dart';

class TcuInformationsModel extends TcuInformationsEntity {
  TcuInformationsModel({
    super.tcu,
    super.tcuTypes,
    super.remarks,
  });

  factory TcuInformationsModel.fromMap(Map<String, dynamic> data) {
    return TcuInformationsModel(
      tcu: data[ApiKey.tcu] as bool?,
      tcuTypes: data[ApiKey.tcuTypes] as int?,
      remarks: data[ApiKey.remarks] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.tcu: tcu,
        ApiKey.tcuTypes: tcuTypes,
        ApiKey.remarks: remarks,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TcuInformationsModel].
  factory TcuInformationsModel.fromJson(String data) {
    return TcuInformationsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TcuInformationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  TcuInformationsModel copyWith({
    bool? tcu,
    int? tcuTypes,
    String? remarks,
  }) {
    return TcuInformationsModel(
      tcu: tcu ?? this.tcu,
      tcuTypes: tcuTypes ?? this.tcuTypes,
      remarks: remarks ?? this.remarks,
    );
  }
}
