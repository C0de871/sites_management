class GeneratorInformationEntity {
  String? genTypeAndCapacity;
  String? genHourMeter;
  String? genFuelConsumption;
  String? internalCapacity;
  String? internalExistingFuel;
  bool? internalCage;
  String? externalCapacity;
  String? externalExistingFuel;
  bool? externalCage;
  bool? fuelSensorExiting;
  bool? fuelSensorWorking;
  String? fuelSensorType;
  String? ampereToOwner;
  String? circuitBreakersQuantity;

  GeneratorInformationEntity({
    this.genTypeAndCapacity,
    this.genHourMeter,
    this.genFuelConsumption,
    this.internalCapacity,
    this.internalExistingFuel,
    this.internalCage,
    this.externalCapacity,
    this.externalExistingFuel,
    this.externalCage,
    this.fuelSensorExiting,
    this.fuelSensorWorking,
    this.fuelSensorType,
    this.ampereToOwner,
    this.circuitBreakersQuantity,
  });
}