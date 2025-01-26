import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/rectifier_information_entity.dart';

class RectifierInformationsModel extends RectifierInformationsEntity {
  RectifierInformationsModel({
    super.rectifier1TypeAndVoltage,
    super.rectifier2TypeAndVoltage,
    super.module1Quantity,
    super.module2Quantity,
    super.faultyModule1Quantity,
    super.faultyModule2Quantity,
    super.numberOfBatteries,
    super.batteryType,
    super.batteriesCabinetType,
    super.cabinetCage,
    super.batteriesStatus,
    super.remarks,
  });

  factory RectifierInformationsModel.fromMap(Map<String, dynamic> data) {
    return RectifierInformationsModel(
      rectifier1TypeAndVoltage: data[ApiKey.rectifier1TypeAndVoltage] as String?,
      rectifier2TypeAndVoltage: data[ApiKey.rectifier2TypeAndVoltage] as String?,
      module1Quantity: data[ApiKey.module1Quantity] as String?,
      module2Quantity: data[ApiKey.module2Quantity] as String?,
      faultyModule1Quantity: data[ApiKey.faultyModule1Quantity] as String?,
      faultyModule2Quantity: data[ApiKey.faultyModule2Quantity] as String?,
      numberOfBatteries: data[ApiKey.numberOfBatteries] as String?,
      batteryType: data[ApiKey.batteryType] as String?,
      batteriesCabinetType: data[ApiKey.batteriesCabinetType] as String?,
      cabinetCage: data[ApiKey.cabinetCage] as bool?,
      batteriesStatus: data[ApiKey.batteriesStatus] as String?,
      remarks: data[ApiKey.remarks] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.rectifier1TypeAndVoltage: rectifier1TypeAndVoltage,
        ApiKey.rectifier2TypeAndVoltage: rectifier2TypeAndVoltage,
        ApiKey.module1Quantity: module1Quantity,
        ApiKey.module2Quantity: module2Quantity,
        ApiKey.faultyModule1Quantity: faultyModule1Quantity,
        ApiKey.faultyModule2Quantity: faultyModule2Quantity,
        ApiKey.numberOfBatteries: numberOfBatteries,
        ApiKey.batteryType: batteryType,
        ApiKey.batteriesCabinetType: batteriesCabinetType,
        ApiKey.cabinetCage: cabinetCage,
        ApiKey.batteriesStatus: batteriesStatus,
        ApiKey.remarks: remarks,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RectifierInformationsModel].
  factory RectifierInformationsModel.fromJson(String data) {
    return RectifierInformationsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RectifierInformationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  RectifierInformationsModel copyWith({
    String? rectifier1TypeAndVoltage,
    String? rectifier2TypeAndVoltage,
    String? module1Quantity,
    String? module2Quantity,
    String? faultyModule1Quantity,
    String? faultyModule2Quantity,
    String? numberOfBatteries,
    String? batteryType,
    String? batteriesCabinetType,
    bool? cabinetCage,
    String? batteriesStatus,
    String? remarks,
  }) {
    return RectifierInformationsModel(
      rectifier1TypeAndVoltage: rectifier1TypeAndVoltage ?? this.rectifier1TypeAndVoltage,
      rectifier2TypeAndVoltage: rectifier2TypeAndVoltage ?? this.rectifier2TypeAndVoltage,
      module1Quantity: module1Quantity ?? this.module1Quantity,
      module2Quantity: module2Quantity ?? this.module2Quantity,
      faultyModule1Quantity: faultyModule1Quantity ?? this.faultyModule1Quantity,
      faultyModule2Quantity: faultyModule2Quantity ?? this.faultyModule2Quantity,
      numberOfBatteries: numberOfBatteries ?? this.numberOfBatteries,
      batteryType: batteryType ?? this.batteryType,
      batteriesCabinetType: batteriesCabinetType ?? this.batteriesCabinetType,
      cabinetCage: cabinetCage ?? this.cabinetCage,
      batteriesStatus: batteriesStatus ?? this.batteriesStatus,
      remarks: remarks ?? this.remarks,
    );
  }
}
