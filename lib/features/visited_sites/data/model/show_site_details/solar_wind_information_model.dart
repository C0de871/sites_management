import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/solar_wind_informations_entity.dart';

class SolarWindInformations extends SolarWindInformationsEntity with EquatableMixin {
  const SolarWindInformations({
    required super.solarType,
    required super.solarCapacity,
    required super.numberOfPanels,
    required super.numberOfModules,
    required super.numberOfFaultyModules,
    required super.numberOfBatteries,
    required super.batteryType,
    required super.batteryStatus,
    required super.windRemarks,
    required super.remarks,
  });

  static const String solarTypeKey = "solar_type";

  static const String solarCapacityKey = "solar_capacity";

  static const String numberOfPanelsKey = "number_of_panels";

  static const String numberOfModulesKey = "number_of_modules";

  static const String numberOfFaultyModulesKey = "number_of_faulty_modules";

  static const String numberOfBatteriesKey = "number_of_batteries";

  static const String batteryTypeKey = "battery_type";

  static const String batteryStatusKey = "battery_status";

  static const String windRemarksKey = "wind_remarks";

  static const String remarksKey = "remarks";

  @override
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
