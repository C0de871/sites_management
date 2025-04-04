import 'package:equatable/equatable.dart';

class GeneratorInformationEntity extends Equatable {
  const GeneratorInformationEntity({
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
  final String? genTypeAndCapacity;
  final String? genHourMeter;
  final String? genFuelConsumption;
  final String? internalCapacity;
  final String? internalExistingFuel;
  final int? internalCage;
  final String? externalCapacity;
  final String? externalExistingFuel;
  final int? externalCage;
  final int? fuelSensorExiting;
  final int? fuelSensorWorking;
  final String? fuelSensorType;
  final String? ampereToOwner;
  final String? circuitBreakersQuantity;

  GeneratorInformationEntity copyWith({
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
    return GeneratorInformationEntity(
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
