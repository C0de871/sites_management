import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/lvdp_information_entity.dart';

class LvdpInformationsModel extends LvdpInformationsEntity {
  LvdpInformationsModel({
    bool? exiting,
    bool? working,
    String? status,
    String? remarks,
  }) : super(
          exiting: exiting,
          working: working,
          status: status,
          remarks: remarks,
        );

  factory LvdpInformationsModel.fromMap(Map<String, dynamic> data) {
    return LvdpInformationsModel(
      exiting: data[ApiKey.exiting] as bool?,
      working: data[ApiKey.working] as bool?,
      status: data[ApiKey.status] as String?,
      remarks: data[ApiKey.remarks] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.exiting: exiting,
        ApiKey.working: working,
        ApiKey.status: status,
        ApiKey.remarks: remarks,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LvdpInformationsModel].
  factory LvdpInformationsModel.fromJson(String data) {
    return LvdpInformationsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LvdpInformationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  LvdpInformationsModel copyWith({
    bool? exiting,
    bool? working,
    String? status,
    String? remarks,
  }) {
    return LvdpInformationsModel(
      exiting: exiting ?? this.exiting,
      working: working ?? this.working,
      status: status ?? this.status,
      remarks: remarks ?? this.remarks,
    );
  }
}