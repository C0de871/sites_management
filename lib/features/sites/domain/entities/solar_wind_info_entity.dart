class SolarWindInformationsEntity {
  String? solarType;
  int? solarCapacity;
  int? numberOfPanels;
  int? numberOfModules;
  int? numberOfFaultyModules;
  int? numberOfBatteries;
  String? batteryType;
  int? batteryStatus;
  String? windRemarks;
  String? remarks;

  SolarWindInformationsEntity({
    this.solarType,
    this.solarCapacity,
    this.numberOfPanels,
    this.numberOfModules,
    this.numberOfFaultyModules,
    this.numberOfBatteries,
    this.batteryType,
    this.batteryStatus,
    this.windRemarks,
    this.remarks,
  });
}
