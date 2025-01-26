import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/solar_wind_info_entity.dart';

class SolarWindInformationsModel extends SolarWindInformationsEntity {
  SolarWindInformationsModel({
    super.solarType,
    super.solarCapacity,
    super.numberOfPanels,
    super.numberOfModules,
    super.numberOfFaultyModules,
    super.numberOfBatteries,
    super.batteryType,
    super.batteryStatus,
    super.windRemarks,
    super.remarks,
  });

  factory SolarWindInformationsModel.fromMap(Map<String, dynamic> data) {
    return SolarWindInformationsModel(
      solarType: data[ApiKey.solarType] as String?,
      solarCapacity: data[ApiKey.solarCapacity] as int?,
      numberOfPanels: data[ApiKey.numberOfPanels] as int?,
      numberOfModules: data[ApiKey.numberOfModules] as int?,
      numberOfFaultyModules: data[ApiKey.numberOfFaultyModules] as int?,
      numberOfBatteries: data[ApiKey.numberOfBatteries] as int?,
      batteryType: data[ApiKey.batteryType] as String?,
      batteryStatus: data[ApiKey.batteryStatus] as int?,
      windRemarks: data[ApiKey.windRemarks] as String?,
      remarks: data[ApiKey.remarks] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.solarType: solarType,
        ApiKey.solarCapacity: solarCapacity,
        ApiKey.numberOfPanels: numberOfPanels,
        ApiKey.numberOfModules: numberOfModules,
        ApiKey.numberOfFaultyModules: numberOfFaultyModules,
        ApiKey.numberOfBatteries: numberOfBatteries,
        ApiKey.batteryType: batteryType,
        ApiKey.batteryStatus: batteryStatus,
        ApiKey.windRemarks: windRemarks,
        ApiKey.remarks: remarks,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SolarWindInformationsModel].
  factory SolarWindInformationsModel.fromJson(String data) {
    return SolarWindInformationsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SolarWindInformationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SolarWindInformationsModel copyWith({
    String? solarType,
    int? solarCapacity,
    int? numberOfPanels,
    int? numberOfModules,
    int? numberOfFaultyModules,
    int? numberOfBatteries,
    String? batteryType,
    int? batteryStatus,
    String? windRemarks,
    String? remarks,
  }) {
    return SolarWindInformationsModel(
      solarType: solarType ?? this.solarType,
      solarCapacity: solarCapacity ?? this.solarCapacity,
      numberOfPanels: numberOfPanels ?? this.numberOfPanels,
      numberOfModules: numberOfModules ?? this.numberOfModules,
      numberOfFaultyModules:
          numberOfFaultyModules ?? this.numberOfFaultyModules,
      numberOfBatteries: numberOfBatteries ?? this.numberOfBatteries,
      batteryType: batteryType ?? this.batteryType,
      batteryStatus: batteryStatus ?? this.batteryStatus,
      windRemarks: windRemarks ?? this.windRemarks,
      remarks: remarks ?? this.remarks,
    );
  }
}