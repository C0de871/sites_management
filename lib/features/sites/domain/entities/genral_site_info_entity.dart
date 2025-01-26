class GeneralSitesInfoEntity {
  String? name;
  String? code;
  String? governorate;
  String? street;
  String? area;
  String? city;
  String? type;
  bool? gsm1900;
  bool? gsm1800;
  bool? threeg;
  bool? lte;
  bool? generator;
  bool? solar;
  bool? wind;
  bool? grid;
  bool? fence;
  String? cabinetNumber;
  String? electricityMeter;
  String? electricityMeterReading;
  String? generatorRemark;

  GeneralSitesInfoEntity({
    this.name,
    this.code,
    this.governorate,
    this.street,
    this.area,
    this.city,
    this.type,
    this.gsm1900,
    this.gsm1800,
    this.threeg,
    this.lte,
    this.generator,
    this.solar,
    this.wind,
    this.grid,
    this.fence,
    this.cabinetNumber,
    this.electricityMeter,
    this.electricityMeterReading,
    this.generatorRemark,
  });
}