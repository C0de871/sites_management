import 'package:equatable/equatable.dart';

class EnvironmentInformationsModel extends Equatable {
  const EnvironmentInformationsModel({
    required this.powerControlSerialNumber,
    required this.ampereConsumption,
    required this.miniPhase,
    required this.threePhase,
    required this.powerControlOwnership,
    required this.fanQuantity,
    required this.faultyFanQuantity,
    required this.earthingSystem,
    required this.airConditioner1Type,
    required this.airConditioner2Type,
    required this.stabilizerQuantity,
    required this.stabilizerType,
    required this.exiting,
    required this.working,
    required this.remarks,
  });

  final String? powerControlSerialNumber;
  static const String powerControlSerialNumberKey = "power_control_serial_number";

  final int? ampereConsumption;
  static const String ampereConsumptionKey = "ampere_consumption";

  final int? miniPhase;
  static const String miniPhaseKey = "mini_phase";

  final int? threePhase;
  static const String threePhaseKey = "three_phase";

  final String? powerControlOwnership;
  static const String powerControlOwnershipKey = "power_control_ownership";

  final int? fanQuantity;
  static const String fanQuantityKey = "fan_quantity";

  final int? faultyFanQuantity;
  static const String faultyFanQuantityKey = "faulty_fan_quantity";

  final int? earthingSystem;
  static const String earthingSystemKey = "earthing_system";

  final String? airConditioner1Type;
  static const String airConditioner1TypeKey = "air_conditioner_1_type";

  final String airConditioner2Type;
  static const String airConditioner2TypeKey = "air_conditioner_2_type";

  final String stabilizerQuantity;
  static const String stabilizerQuantityKey = "stabilizer_quantity";

  final String stabilizerType;
  static const String stabilizerTypeKey = "stabilizer_type";

  final int? exiting;
  static const String exitingKey = "exiting";

  final int? working;
  static const String workingKey = "working";

  final String remarks;
  static const String remarksKey = "remarks";

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
      exiting: exiting ?? this.exiting,
      working: working ?? this.working,
      remarks: remarks ?? this.remarks,
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
