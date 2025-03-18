class EnvironmentInformationsEntity {
  String? powerControlSerialNumber;
  int? ampereConsumption;
  bool? miniPhase;
  bool? threePhase;
  String? powerControlOwnership;
  int? fanQuantity;
  int? faultyFanQuantity;
  bool? earthingSystem;
  String? airConditioner1Type;
  String? airConditioner2Type;
  String? stabilizerQuantity;
  String? stabilizerType;
  String? fireSystem;
  bool? exiting;
  bool? working;
  String? remarks;

  EnvironmentInformationsEntity({
    this.powerControlSerialNumber,
    this.ampereConsumption,
    this.miniPhase,
    this.threePhase,
    this.powerControlOwnership,
    this.fanQuantity,
    this.faultyFanQuantity,
    this.earthingSystem,
    this.airConditioner1Type,
    this.airConditioner2Type,
    this.stabilizerQuantity,
    this.stabilizerType,
    this.fireSystem,
    this.exiting,
    this.working,
    this.remarks,
  });
}
