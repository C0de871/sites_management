import 'package:equatable/equatable.dart';

class EnvironmentInformationsEntity extends Equatable {
  const EnvironmentInformationsEntity({
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
  final int? ampereConsumption;
  final int? miniPhase;
  final int? threePhase;
  final String? powerControlOwnership;
  final int? fanQuantity;
  final int? faultyFanQuantity;
  final int? earthingSystem;
  final String? airConditioner1Type;
  final String? airConditioner2Type;
  final String? stabilizerQuantity;
  final String? stabilizerType;
  final int? exiting;
  final int? working;
  final dynamic remarks;

  EnvironmentInformationsEntity copyWith({
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
    return EnvironmentInformationsEntity(
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
