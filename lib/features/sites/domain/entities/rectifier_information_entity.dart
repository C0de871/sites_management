class RectifierInformationsEntity {
  String? rectifier1TypeAndVoltage;
  String? rectifier2TypeAndVoltage;
  String? module1Quantity;
  String? module2Quantity;
  String? faultyModule1Quantity;
  String? faultyModule2Quantity;
  String? numberOfBatteries;
  String? batteryType;
  String? batteriesCabinetType;
  bool? cabinetCage;
  String? batteriesStatus;
  String? remarks;

  RectifierInformationsEntity({
    this.rectifier1TypeAndVoltage,
    this.rectifier2TypeAndVoltage,
    this.module1Quantity,
    this.module2Quantity,
    this.faultyModule1Quantity,
    this.faultyModule2Quantity,
    this.numberOfBatteries,
    this.batteryType,
    this.batteriesCabinetType,
    this.cabinetCage,
    this.batteriesStatus,
    this.remarks,
  });
}
