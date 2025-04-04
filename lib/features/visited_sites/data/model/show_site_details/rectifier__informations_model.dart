import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/rectifier_informations_entity.dart';

class RectifierInformationsModel extends RectifierInformationsEntity with EquatableMixin {
  RectifierInformationsModel({
    required super.rectifier1TypeAndVoltage,
    required super.rectifier2TypeAndVoltage,
    required super.module1Quantity,
    required super.module2Quantity,
    required super.faultyModule1Quantity,
    required super.faultyModule2Quantity,
    required super.numberOfBatteries,
    required super.batteryType,
    required super.batteriesCabinetType,
    required super.cabinetCage,
    required super.batteriesStatus,
    required super.remarks,
  });

  static const String rectifier1TypeAndVoltageKey = "rectifier_1_type_and_voltage";

  static const String rectifier2TypeAndVoltageKey = "rectifier_2_type_and_voltage";

  static const String module1QuantityKey = "module_1_quantity";

  static const String module2QuantityKey = "module_2_quantity";

  static const String faultyModule1QuantityKey = "faulty_module_1_quantity";

  static const String faultyModule2QuantityKey = "faulty_module_2_quantity";

  static const String numberOfBatteriesKey = "number_of_batteries";

  static const String batteryTypeKey = "battery_type";

  static const String batteriesCabinetTypeKey = "batteries_cabinet_type";

  static const String cabinetCageKey = "cabinet_cage";

  static const String batteriesStatusKey = "batteries_status";

  static const String remarksKey = "remarks";

  factory RectifierInformationsModel.fromJson(Map<String, dynamic> json) {
    return RectifierInformationsModel(
      rectifier1TypeAndVoltage: json[rectifier1TypeAndVoltageKey],
      rectifier2TypeAndVoltage: json[rectifier2TypeAndVoltageKey],
      module1Quantity: json[module1QuantityKey],
      module2Quantity: json[module2QuantityKey],
      faultyModule1Quantity: json[faultyModule1QuantityKey],
      faultyModule2Quantity: json[faultyModule2QuantityKey],
      numberOfBatteries: json[numberOfBatteriesKey],
      batteryType: json[batteryTypeKey],
      batteriesCabinetType: json[batteriesCabinetTypeKey],
      cabinetCage: json[cabinetCageKey],
      batteriesStatus: json[batteriesStatusKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        rectifier1TypeAndVoltageKey: rectifier1TypeAndVoltage,
        rectifier2TypeAndVoltageKey: rectifier2TypeAndVoltage,
        module1QuantityKey: module1Quantity,
        module2QuantityKey: module2Quantity,
        faultyModule1QuantityKey: faultyModule1Quantity,
        faultyModule2QuantityKey: faultyModule2Quantity,
        numberOfBatteriesKey: numberOfBatteries,
        batteryTypeKey: batteryType,
        batteriesCabinetTypeKey: batteriesCabinetType,
        cabinetCageKey: cabinetCage,
        batteriesStatusKey: batteriesStatus,
        remarksKey: remarks,
      };

  @override
  List<Object?> get props => [
        rectifier1TypeAndVoltage,
        rectifier2TypeAndVoltage,
        module1Quantity,
        module2Quantity,
        faultyModule1Quantity,
        faultyModule2Quantity,
        numberOfBatteries,
        batteryType,
        batteriesCabinetType,
        cabinetCage,
        batteriesStatus,
        remarks,
      ];
}
