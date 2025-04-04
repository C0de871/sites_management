import 'package:equatable/equatable.dart';

class SolarWindInformationsEntity extends Equatable {
  const SolarWindInformationsEntity({
    required this.solarType,
    required this.solarCapacity,
    required this.numberOfPanels,
    required this.numberOfModules,
    required this.numberOfFaultyModules,
    required this.numberOfBatteries,
    required this.batteryType,
    required this.batteryStatus,
    required this.windRemarks,
    required this.remarks,
  });

  final String? solarType;
  final String? solarCapacity;
  final String? numberOfPanels;
  final String? numberOfModules;
  final String? numberOfFaultyModules;
  final String? numberOfBatteries;
  final String? batteryType;
  final String? batteryStatus;
  final String? windRemarks;
  final String? remarks;

  SolarWindInformationsEntity copyWith({
    String? solarType,
    String? solarCapacity,
    String? numberOfPanels,
    String? numberOfModules,
    String? numberOfFaultyModules,
    String? numberOfBatteries,
    String? batteryType,
    String? batteryStatus,
    String? windRemarks,
    String? remarks,
  }) {
    return SolarWindInformationsEntity(
      solarType: solarType ?? this.solarType,
      solarCapacity: solarCapacity ?? this.solarCapacity,
      numberOfPanels: numberOfPanels ?? this.numberOfPanels,
      numberOfModules: numberOfModules ?? this.numberOfModules,
      numberOfFaultyModules: numberOfFaultyModules ?? this.numberOfFaultyModules,
      numberOfBatteries: numberOfBatteries ?? this.numberOfBatteries,
      batteryType: batteryType ?? this.batteryType,
      batteryStatus: batteryStatus ?? this.batteryStatus,
      windRemarks: windRemarks ?? this.windRemarks,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props => [
        solarType,
        solarCapacity,
        numberOfPanels,
        numberOfModules,
        numberOfFaultyModules,
        numberOfBatteries,
        batteryType,
        batteryStatus,
        windRemarks,
        remarks,
      ];
}
