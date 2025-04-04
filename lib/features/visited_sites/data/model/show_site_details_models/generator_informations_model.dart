import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/generator_information_entity.dart';

class GeneratorInformationModel extends GeneratorInformationEntity with EquatableMixin {
  const GeneratorInformationModel({
    required super.id,
    required super.genTypeAndCapacity,
    required super.genHourMeter,
    required super.genFuelConsumption,
    required super.internalCapacity,
    required super.internalExistingFuel,
    required super.internalCage,
    required super.externalCapacity,
    required super.externalExistingFuel,
    required super.externalCage,
    required super.fuelSensorExiting,
    required super.fuelSensorWorking,
    required super.fuelSensorType,
    required super.ampereToOwner,
    required super.circuitBreakersQuantity,
  });

  static const String idKey = "id";

  static const String genTypeAndCapacityKey = "gen_type_and_capacity";

  static const String genHourMeterKey = "gen_hour_meter";

  static const String genFuelConsumptionKey = "gen_fuel_consumption";

  static const String internalCapacityKey = "internal_capacity";

  static const String internalExistingFuelKey = "internal_existing_fuel";

  static const String internalCageKey = "internal_cage";

  static const String externalCapacityKey = "external_capacity";

  static const String externalExistingFuelKey = "external_existing_fuel";

  static const String externalCageKey = "external_cage";

  static const String fuelSensorExitingKey = "fuel_sensor_exiting";

  static const String fuelSensorWorkingKey = "fuel_sensor_working";

  static const String fuelSensorTypeKey = "fuel_sensor_type";

  static const String ampereToOwnerKey = "ampere_to_owner";

  static const String circuitBreakersQuantityKey = "circuit_breakers_quantity";

  @override
  GeneratorInformationModel copyWith({
    int? id,
    String? genTypeAndCapacity,
    String? genHourMeter,
    String? genFuelConsumption,
    String? internalCapacity,
    String? internalExistingFuel,
    int? internalCage,
    String? externalCapacity,
    String? externalExistingFuel,
    int? externalCage,
    int? fuelSensorExiting,
    int? fuelSensorWorking,
    String? fuelSensorType,
    String? ampereToOwner,
    String? circuitBreakersQuantity,
  }) {
    return GeneratorInformationModel(
      id: id ?? super.id,
      genTypeAndCapacity: genTypeAndCapacity ?? super.genTypeAndCapacity,
      genHourMeter: genHourMeter ?? super.genHourMeter,
      genFuelConsumption: genFuelConsumption ?? super.genFuelConsumption,
      internalCapacity: internalCapacity ?? super.internalCapacity,
      internalExistingFuel: internalExistingFuel ?? super.internalExistingFuel,
      internalCage: internalCage ?? super.internalCage,
      externalCapacity: externalCapacity ?? super.externalCapacity,
      externalExistingFuel: externalExistingFuel ?? super.externalExistingFuel,
      externalCage: externalCage ?? super.externalCage,
      fuelSensorExiting: fuelSensorExiting ?? super.fuelSensorExiting,
      fuelSensorWorking: fuelSensorWorking ?? super.fuelSensorWorking,
      fuelSensorType: fuelSensorType ?? super.fuelSensorType,
      ampereToOwner: ampereToOwner ?? super.ampereToOwner,
      circuitBreakersQuantity: circuitBreakersQuantity ?? super.circuitBreakersQuantity,
    );
  }

  factory GeneratorInformationModel.fromJson(Map<String, dynamic> json) {
    return GeneratorInformationModel(
      id: json[idKey],
      genTypeAndCapacity: json[genTypeAndCapacityKey],
      genHourMeter: json[genHourMeterKey],
      genFuelConsumption: json[genFuelConsumptionKey],
      internalCapacity: json[internalCapacityKey],
      internalExistingFuel: json[internalExistingFuelKey],
      internalCage: json[internalCageKey],
      externalCapacity: json[externalCapacityKey],
      externalExistingFuel: json[externalExistingFuelKey],
      externalCage: json[externalCageKey],
      fuelSensorExiting: json[fuelSensorExitingKey],
      fuelSensorWorking: json[fuelSensorWorkingKey],
      fuelSensorType: json[fuelSensorTypeKey],
      ampereToOwner: json[ampereToOwnerKey],
      circuitBreakersQuantity: json[circuitBreakersQuantityKey],
    );
  }

  Map<String, dynamic> toJson() => {
        idKey: id,
        genTypeAndCapacityKey: genTypeAndCapacity,
        genHourMeterKey: genHourMeter,
        genFuelConsumptionKey: genFuelConsumption,
        internalCapacityKey: internalCapacity,
        internalExistingFuelKey: internalExistingFuel,
        internalCageKey: internalCage,
        externalCapacityKey: externalCapacity,
        externalExistingFuelKey: externalExistingFuel,
        externalCageKey: externalCage,
        fuelSensorExitingKey: fuelSensorExiting,
        fuelSensorWorkingKey: fuelSensorWorking,
        fuelSensorTypeKey: fuelSensorType,
        ampereToOwnerKey: ampereToOwner,
        circuitBreakersQuantityKey: circuitBreakersQuantity,
      };

  @override
  List<Object?> get props => [
        id,
        genTypeAndCapacity,
        genHourMeter,
        genFuelConsumption,
        internalCapacity,
        internalExistingFuel,
        internalCage,
        externalCapacity,
        externalExistingFuel,
        externalCage,
        fuelSensorExiting,
        fuelSensorWorking,
        fuelSensorType,
        ampereToOwner,
        circuitBreakersQuantity,
      ];
}
