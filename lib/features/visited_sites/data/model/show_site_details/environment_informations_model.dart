import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/environment_informations_entity.dart';

class EnvironmentInformationsModel extends EnvironmentInformationsEntity with EquatableMixin {
  const EnvironmentInformationsModel({
    required super.powerControlSerialNumber,
    required super.ampereConsumption,
    required super.miniPhase,
    required super.threePhase,
    required super.powerControlOwnership,
    required super.fanQuantity,
    required super.faultyFanQuantity,
    required super.earthingSystem,
    required super.airConditioner1Type,
    required super.airConditioner2Type,
    required super.stabilizerQuantity,
    required super.stabilizerType,
    required super.exiting,
    required super.working,
    required super.remarks,
  });

  static const String powerControlSerialNumberKey = "power_control_serial_number";

  static const String ampereConsumptionKey = "ampere_consumption";

  static const String miniPhaseKey = "mini_phase";

  static const String threePhaseKey = "three_phase";

  static const String powerControlOwnershipKey = "power_control_ownership";

  static const String fanQuantityKey = "fan_quantity";

  static const String faultyFanQuantityKey = "faulty_fan_quantity";

  static const String earthingSystemKey = "earthing_system";

  static const String airConditioner1TypeKey = "air_conditioner_1_type";

  static const String airConditioner2TypeKey = "air_conditioner_2_type";

  static const String stabilizerQuantityKey = "stabilizer_quantity";

  static const String stabilizerTypeKey = "stabilizer_type";

  static const String exitingKey = "exiting";

  static const String workingKey = "working";

  static const String remarksKey = "remarks";

  @override
  EnvironmentInformationsModel copyWith({
    String? powerControlSerialNumber,
    int? ampereConsumption,
    int? miniPhase,
    int? threePhase,
    String? powerControlOwnership,
    int? fanQuantity,
    int? faultyFanQuantity,
    int? earthingSystem,
    String? airConditioner1Type,
    String? airConditioner2Type,
    String? stabilizerQuantity,
    String? stabilizerType,
    int? exiting,
    int? working,
    String? remarks,
  }) {
    return EnvironmentInformationsModel(
      powerControlSerialNumber: powerControlSerialNumber ?? super.powerControlSerialNumber,
      ampereConsumption: ampereConsumption ?? super.ampereConsumption,
      miniPhase: miniPhase ?? super.miniPhase,
      threePhase: threePhase ?? super.threePhase,
      powerControlOwnership: powerControlOwnership ?? super.powerControlOwnership,
      fanQuantity: fanQuantity ?? super.fanQuantity,
      faultyFanQuantity: faultyFanQuantity ?? super.faultyFanQuantity,
      earthingSystem: earthingSystem ?? super.earthingSystem,
      airConditioner1Type: airConditioner1Type ?? super.airConditioner1Type,
      airConditioner2Type: airConditioner2Type ?? super.airConditioner2Type,
      stabilizerQuantity: stabilizerQuantity ?? super.stabilizerQuantity,
      stabilizerType: stabilizerType ?? super.stabilizerType,
      exiting: exiting ?? super.exiting,
      working: working ?? super.working,
      remarks: remarks ?? super.remarks,
    );
  }

  factory EnvironmentInformationsModel.fromJson(Map<String, dynamic> json) {
    return EnvironmentInformationsModel(
      powerControlSerialNumber: json[powerControlSerialNumberKey],
      ampereConsumption: json[ampereConsumptionKey],
      miniPhase: json[miniPhaseKey],
      threePhase: json[threePhaseKey],
      powerControlOwnership: json[powerControlOwnershipKey],
      fanQuantity: json[fanQuantityKey],
      faultyFanQuantity: json[faultyFanQuantityKey],
      earthingSystem: json[earthingSystemKey],
      airConditioner1Type: json[airConditioner1TypeKey],
      airConditioner2Type: json[airConditioner2TypeKey],
      stabilizerQuantity: json[stabilizerQuantityKey],
      stabilizerType: json[stabilizerTypeKey],
      exiting: json[exitingKey],
      working: json[workingKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        powerControlSerialNumberKey: powerControlSerialNumber,
        ampereConsumptionKey: ampereConsumption,
        miniPhaseKey: miniPhase,
        threePhaseKey: threePhase,
        powerControlOwnershipKey: powerControlOwnership,
        fanQuantityKey: fanQuantity,
        faultyFanQuantityKey: faultyFanQuantity,
        earthingSystemKey: earthingSystem,
        airConditioner1TypeKey: airConditioner1Type,
        airConditioner2TypeKey: airConditioner2Type,
        stabilizerQuantityKey: stabilizerQuantity,
        stabilizerTypeKey: stabilizerType,
        exitingKey: exiting,
        workingKey: working,
        remarksKey: remarks,
      };

  @override
  List<Object?> get props => [
        powerControlSerialNumber,
        ampereConsumption,
        miniPhase,
        threePhase,
        powerControlOwnership,
        fanQuantity,
        faultyFanQuantity,
        earthingSystem,
        airConditioner1Type,
        airConditioner2Type,
        stabilizerQuantity,
        stabilizerType,
        exiting,
        working,
        remarks,
      ];
}
