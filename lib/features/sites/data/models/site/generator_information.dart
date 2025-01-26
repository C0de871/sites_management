import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/generator_information_entity.dart';

class GeneratorInformationModel extends GeneratorInformationEntity {
  GeneratorInformationModel({
    super.genTypeAndCapacity,
    super.genHourMeter,
    super.genFuelConsumption,
    super.internalCapacity,
    super.internalExistingFuel,
    super.internalCage,
    super.externalCapacity,
    super.externalExistingFuel,
    super.externalCage,
    super.fuelSensorExiting,
    super.fuelSensorWorking,
    super.fuelSensorType,
    super.ampereToOwner,
    super.circuitBreakersQuantity,
  });

  factory GeneratorInformationModel.fromMap(Map<String, dynamic> data) {
    return GeneratorInformationModel(
      genTypeAndCapacity: data[ApiKey.genTypeAndCapacity] as String?,
      genHourMeter: data[ApiKey.genHourMeter] as String?,
      genFuelConsumption: data[ApiKey.genFuelConsumption] as String?,
      internalCapacity: data[ApiKey.internalCapacity] as String?,
      internalExistingFuel: data[ApiKey.internalExistingFuel] as String?,
      internalCage: data[ApiKey.internalCage] as bool?,
      externalCapacity: data[ApiKey.externalCapacity] as String?,
      externalExistingFuel: data[ApiKey.externalExistingFuel] as String?,
      externalCage: data[ApiKey.externalCage] as bool?,
      fuelSensorExiting: data[ApiKey.fuelSensorExiting] as bool?,
      fuelSensorWorking: data[ApiKey.fuelSensorWorking] as bool?,
      fuelSensorType: data[ApiKey.fuelSensorType] as String?,
      ampereToOwner: data[ApiKey.ampereToOwner] as String?,
      circuitBreakersQuantity: data[ApiKey.circuitBreakersQuantity] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.genTypeAndCapacity: genTypeAndCapacity,
        ApiKey.genHourMeter: genHourMeter,
        ApiKey.genFuelConsumption: genFuelConsumption,
        ApiKey.internalCapacity: internalCapacity,
        ApiKey.internalExistingFuel: internalExistingFuel,
        ApiKey.internalCage: internalCage,
        ApiKey.externalCapacity: externalCapacity,
        ApiKey.externalExistingFuel: externalExistingFuel,
        ApiKey.externalCage: externalCage,
        ApiKey.fuelSensorExiting: fuelSensorExiting,
        ApiKey.fuelSensorWorking: fuelSensorWorking,
        ApiKey.fuelSensorType: fuelSensorType,
        ApiKey.ampereToOwner: ampereToOwner,
        ApiKey.circuitBreakersQuantity: circuitBreakersQuantity,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GeneratorInformationModel].
  factory GeneratorInformationModel.fromJson(String data) {
    return GeneratorInformationModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GeneratorInformationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  GeneratorInformationModel copyWith({
    String? genTypeAndCapacity,
    String? genHourMeter,
    String? genFuelConsumption,
    String? internalCapacity,
    String? internalExistingFuel,
    bool? internalCage,
    String? externalCapacity,
    String? externalExistingFuel,
    bool? externalCage,
    bool? fuelSensorExiting,
    bool? fuelSensorWorking,
    String? fuelSensorType,
    String? ampereToOwner,
    String? circuitBreakersQuantity,
  }) {
    return GeneratorInformationModel(
      genTypeAndCapacity: genTypeAndCapacity ?? this.genTypeAndCapacity,
      genHourMeter: genHourMeter ?? this.genHourMeter,
      genFuelConsumption: genFuelConsumption ?? this.genFuelConsumption,
      internalCapacity: internalCapacity ?? this.internalCapacity,
      internalExistingFuel: internalExistingFuel ?? this.internalExistingFuel,
      internalCage: internalCage ?? this.internalCage,
      externalCapacity: externalCapacity ?? this.externalCapacity,
      externalExistingFuel: externalExistingFuel ?? this.externalExistingFuel,
      externalCage: externalCage ?? this.externalCage,
      fuelSensorExiting: fuelSensorExiting ?? this.fuelSensorExiting,
      fuelSensorWorking: fuelSensorWorking ?? this.fuelSensorWorking,
      fuelSensorType: fuelSensorType ?? this.fuelSensorType,
      ampereToOwner: ampereToOwner ?? this.ampereToOwner,
      circuitBreakersQuantity: circuitBreakersQuantity ?? this.circuitBreakersQuantity,
    );
  }
}
