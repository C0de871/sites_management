import 'package:equatable/equatable.dart';

class SolarWindInformations extends Equatable {
  const SolarWindInformations({
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
  static const String solarTypeKey = "solar_type";

  final String? solarCapacity;
  static const String solarCapacityKey = "solar_capacity";

  final String? numberOfPanels;
  static const String numberOfPanelsKey = "number_of_panels";

  final String? numberOfModules;
  static const String numberOfModulesKey = "number_of_modules";

  final String? numberOfFaultyModules;
  static const String numberOfFaultyModulesKey = "number_of_faulty_modules";

  final String? numberOfBatteries;
  static const String numberOfBatteriesKey = "number_of_batteries";

  final String? batteryType;
  static const String batteryTypeKey = "battery_type";

  final String? batteryStatus;
  static const String batteryStatusKey = "battery_status";

  final String? windRemarks;
  static const String windRemarksKey = "wind_remarks";

  final String? remarks;
  static const String remarksKey = "remarks";

  SolarWindInformations copyWith({
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
    return SolarWindInformations(
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

  factory SolarWindInformations.fromJson(Map<String, dynamic> json) {
    return SolarWindInformations(
      solarType: json[solarTypeKey],
      solarCapacity: json[solarCapacityKey],
      numberOfPanels: json[numberOfPanelsKey],
      numberOfModules: json[numberOfModulesKey],
      numberOfFaultyModules: json[numberOfFaultyModulesKey],
      numberOfBatteries: json[numberOfBatteriesKey],
      batteryType: json[batteryTypeKey],
      batteryStatus: json[batteryStatusKey],
      windRemarks: json[windRemarksKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        solarTypeKey: solarType,
        solarCapacityKey: solarCapacity,
        numberOfPanelsKey: numberOfPanels,
        numberOfModulesKey: numberOfModules,
        numberOfFaultyModulesKey: numberOfFaultyModules,
        numberOfBatteriesKey: numberOfBatteries,
        batteryTypeKey: batteryType,
        batteryStatusKey: batteryStatus,
        windRemarksKey: windRemarks,
        remarksKey: remarks,
      };

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
