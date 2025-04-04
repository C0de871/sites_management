import 'package:equatable/equatable.dart';

class RectifierInformationsEntity extends Equatable {
  const RectifierInformationsEntity({
    required this.rectifier1TypeAndVoltage,
    required this.rectifier2TypeAndVoltage,
    required this.module1Quantity,
    required this.module2Quantity,
    required this.faultyModule1Quantity,
    required this.faultyModule2Quantity,
    required this.numberOfBatteries,
    required this.batteryType,
    required this.batteriesCabinetType,
    required this.cabinetCage,
    required this.batteriesStatus,
    required this.remarks,
  });

  final String? rectifier1TypeAndVoltage;
  final String? rectifier2TypeAndVoltage;
  final String? module1Quantity;
  final String? module2Quantity;
  final String? faultyModule1Quantity;
  final String? faultyModule2Quantity;
  final String? numberOfBatteries;
  final String? batteryType;
  final String? batteriesCabinetType;
  final String? cabinetCage;
  final String? batteriesStatus;
  final String? remarks;

  RectifierInformationsEntity copyWith({
    String? rectifier1TypeAndVoltage,
    String? rectifier2TypeAndVoltage,
    String? module1Quantity,
    String? module2Quantity,
    String? faultyModule1Quantity,
    String? faultyModule2Quantity,
    String? numberOfBatteries,
    String? batteryType,
    String? batteriesCabinetType,
    String? cabinetCage,
    String? batteriesStatus,
    String? remarks,
  }) {
    return RectifierInformationsEntity(
      rectifier1TypeAndVoltage: rectifier1TypeAndVoltage ?? this.rectifier1TypeAndVoltage,
      rectifier2TypeAndVoltage: rectifier2TypeAndVoltage ?? this.rectifier2TypeAndVoltage,
      module1Quantity: module1Quantity ?? this.module1Quantity,
      module2Quantity: module2Quantity ?? this.module2Quantity,
      faultyModule1Quantity: faultyModule1Quantity ?? this.faultyModule1Quantity,
      faultyModule2Quantity: faultyModule2Quantity ?? this.faultyModule2Quantity,
      numberOfBatteries: numberOfBatteries ?? this.numberOfBatteries,
      batteryType: batteryType ?? this.batteryType,
      batteriesCabinetType: batteriesCabinetType ?? this.batteriesCabinetType,
      cabinetCage: cabinetCage ?? this.cabinetCage,
      batteriesStatus: batteriesStatus ?? this.batteriesStatus,
      remarks: remarks ?? this.remarks,
    );
  }

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
