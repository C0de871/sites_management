import 'package:equatable/equatable.dart';

class GeneratorInformationModel extends Equatable {
  const GeneratorInformationModel({
    required this.id,
    required this.genTypeAndCapacity,
    required this.genHourMeter,
    required this.genFuelConsumption,
    required this.internalCapacity,
    required this.internalExistingFuel,
    required this.internalCage,
    required this.externalCapacity,
    required this.externalExistingFuel,
    required this.externalCage,
    required this.fuelSensorExiting,
    required this.fuelSensorWorking,
    required this.fuelSensorType,
    required this.ampereToOwner,
    required this.circuitBreakersQuantity,
  });

  final int? id;
  static const String idKey = "id";

  final String? genTypeAndCapacity;
  static const String genTypeAndCapacityKey = "gen_type_and_capacity";

  final String? genHourMeter;
  static const String genHourMeterKey = "gen_hour_meter";

  final String? genFuelConsumption;
  static const String genFuelConsumptionKey = "gen_fuel_consumption";

  final String? internalCapacity;
  static const String internalCapacityKey = "internal_capacity";

  final String? internalExistingFuel;
  static const String internalExistingFuelKey = "internal_existing_fuel";

  final int? internalCage;
  static const String internalCageKey = "internal_cage";

  final String? externalCapacity;
  static const String externalCapacityKey = "external_capacity";

  final String? externalExistingFuel;
  static const String externalExistingFuelKey = "external_existing_fuel";

  final int? externalCage;
  static const String externalCageKey = "external_cage";

  final int? fuelSensorExiting;
  static const String fuelSensorExitingKey = "fuel_sensor_exiting";

  final int? fuelSensorWorking;
  static const String fuelSensorWorkingKey = "fuel_sensor_working";

  final String? fuelSensorType;
  static const String fuelSensorTypeKey = "fuel_sensor_type";

  final String? ampereToOwner;
  static const String ampereToOwnerKey = "ampere_to_owner";

  final String? circuitBreakersQuantity;
  static const String circuitBreakersQuantityKey = "circuit_breakers_quantity";

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
      id: id ?? this.id,
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
