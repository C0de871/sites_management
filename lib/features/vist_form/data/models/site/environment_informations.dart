import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/environment_informations_entity.dart';

class EnvironmentInformationsModel extends EnvironmentInformationsEntity {
  EnvironmentInformationsModel({
    super.powerControlSerialNumber,
    super.ampereConsumption,
    super.miniPhase,
    super.threePhase,
    super.powerControlOwnership,
    super.fanQuantity,
    super.faultyFanQuantity,
    super.earthingSystem,
    super.airConditioner1Type,
    super.airConditioner2Type,
    super.stabilizerQuantity,
    super.stabilizerType,
    super.fireSystem,
    super.exiting,
    super.working,
    super.remarks,
  });

  factory EnvironmentInformationsModel.fromMap(Map<String, dynamic> data) {
    return EnvironmentInformationsModel(
      powerControlSerialNumber: data[ApiKey.powerControlSerialNumber] as String?,
      ampereConsumption: data[ApiKey.ampereConsumption] as int?,
      miniPhase: data[ApiKey.miniPhase] as bool?,
      threePhase: data[ApiKey.threePhase] as bool?,
      powerControlOwnership: data[ApiKey.powerControlOwnership] as String?,
      fanQuantity: data[ApiKey.fanQuantity] as int?,
      faultyFanQuantity: data[ApiKey.faultyFanQuantity] as int?,
      earthingSystem: data[ApiKey.earthingSystem] as bool?,
      airConditioner1Type: data[ApiKey.airConditioner1Type] as String?,
      airConditioner2Type: data[ApiKey.airConditioner2Type] as String?,
      stabilizerQuantity: data[ApiKey.stabilizerQuantity] as String?,
      stabilizerType: data[ApiKey.stabilizerType] as String?,
      fireSystem: data[ApiKey.fireSystem] as String?,
      exiting: data[ApiKey.exiting] as bool?,
      working: data[ApiKey.working] as bool?,
      remarks: data[ApiKey.remarks] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.powerControlSerialNumber: powerControlSerialNumber,
        ApiKey.ampereConsumption: ampereConsumption,
        ApiKey.miniPhase: miniPhase,
        ApiKey.threePhase: threePhase,
        ApiKey.powerControlOwnership: powerControlOwnership,
        ApiKey.fanQuantity: fanQuantity,
        ApiKey.faultyFanQuantity: faultyFanQuantity,
        ApiKey.earthingSystem: earthingSystem,
        ApiKey.airConditioner1Type: airConditioner1Type,
        ApiKey.airConditioner2Type: airConditioner2Type,
        ApiKey.stabilizerQuantity: stabilizerQuantity,
        ApiKey.stabilizerType: stabilizerType,
        ApiKey.fireSystem: fireSystem,
        ApiKey.exiting: exiting,
        ApiKey.working: working,
        ApiKey.remarks: remarks,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EnvironmentInformationsModel].
  factory EnvironmentInformationsModel.fromJson(String data) {
    return EnvironmentInformationsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EnvironmentInformationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  EnvironmentInformationsModel copyWith({
    String? powerControlSerialNumber,
    int? ampereConsumption,
    bool? miniPhase,
    bool? threePhase,
    String? powerControlOwnership,
    int? fanQuantity,
    int? faultyFanQuantity,
    bool? earthingSystem,
    String? airConditioner1Type,
    String? airConditioner2Type,
    String? stabilizerQuantity,
    String? stabilizerType,
    String? fireSystem,
    bool? exiting,
    bool? working,
    String? remarks,
  }) {
    return EnvironmentInformationsModel(
      powerControlSerialNumber: powerControlSerialNumber ?? this.powerControlSerialNumber,
      ampereConsumption: ampereConsumption ?? this.ampereConsumption,
      miniPhase: miniPhase ?? this.miniPhase,
      threePhase: threePhase ?? this.threePhase,
      powerControlOwnership: powerControlOwnership ?? this.powerControlOwnership,
      fanQuantity: fanQuantity ?? this.fanQuantity,
      faultyFanQuantity: faultyFanQuantity ?? this.faultyFanQuantity,
      earthingSystem: earthingSystem ?? this.earthingSystem,
      airConditioner1Type: airConditioner1Type ?? this.airConditioner1Type,
      airConditioner2Type: airConditioner2Type ?? this.airConditioner2Type,
      stabilizerQuantity: stabilizerQuantity ?? this.stabilizerQuantity,
      stabilizerType: stabilizerType ?? this.stabilizerType,
      fireSystem: fireSystem ?? this.fireSystem,
      exiting: exiting ?? this.exiting,
      working: working ?? this.working,
      remarks: remarks ?? this.remarks,
    );
  }
}
