import 'package:equatable/equatable.dart';

class SiteGeneralInformationModel extends Equatable {
  const SiteGeneralInformationModel({
    required this.name,
    required this.code,
    required this.governorate,
    required this.street,
    required this.area,
    required this.city,
    required this.type,
    required this.gsm1900,
    required this.gsm1800,
    required this.the3G,
    required this.lte,
    required this.generator,
    required this.solar,
    required this.wind,
    required this.grid,
    required this.fence,
    required this.cabinetNumber,
    required this.electricityMeter,
    required this.electricityMeterReading,
    required this.generatorRemark,
  });

  final String? name;
  static const String nameKey = "name";

  final String? code;
  static const String codeKey = "code";

  final String? governorate;
  static const String governorateKey = "governorate";

  final String? street;
  static const String streetKey = "street";

  final String? area;
  static const String areaKey = "area";

  final String? city;
  static const String cityKey = "city";

  final String? type;
  static const String typeKey = "type";

  final int? gsm1900;
  static const String gsm1900Key = "gsm1900";

  final int? gsm1800;
  static const String gsm1800Key = "gsm1800";

  final int? the3G;
  static const String the3GKey = "3g";

  final int? lte;
  static const String lteKey = "lte";

  final int? generator;
  static const String generatorKey = "generator";

  final int? solar;
  static const String solarKey = "solar";

  final int? wind;
  static const String windKey = "wind";

  final int? grid;
  static const String gridKey = "grid";

  final int? fence;
  static const String fenceKey = "fence";

  final int? cabinetNumber;
  static const String cabinetNumberKey = "cabinet_number";

  final String? electricityMeter;
  static const String electricityMeterKey = "electricity_meter";

  final String? electricityMeterReading;
  static const String electricityMeterReadingKey = "electricity_meter_reading";

  final String? generatorRemark;
  static const String generatorRemarkKey = "generator_remark";

  SiteGeneralInformationModel copyWith({
    String? name,
    String? code,
    String? governorate,
    String? street,
    String? area,
    String? city,
    String? type,
    int? gsm1900,
    int? gsm1800,
    int? the3G,
    int? lte,
    int? generator,
    int? solar,
    int? wind,
    int? grid,
    int? fence,
    int? cabinetNumber,
    String? electricityMeter,
    String? electricityMeterReading,
    String? generatorRemark,
  }) {
    return SiteGeneralInformationModel(
      name: name ?? this.name,
      code: code ?? this.code,
      governorate: governorate ?? this.governorate,
      street: street ?? this.street,
      area: area ?? this.area,
      city: city ?? this.city,
      type: type ?? this.type,
      gsm1900: gsm1900 ?? this.gsm1900,
      gsm1800: gsm1800 ?? this.gsm1800,
      the3G: the3G ?? this.the3G,
      lte: lte ?? this.lte,
      generator: generator ?? this.generator,
      solar: solar ?? this.solar,
      wind: wind ?? this.wind,
      grid: grid ?? this.grid,
      fence: fence ?? this.fence,
      cabinetNumber: cabinetNumber ?? this.cabinetNumber,
      electricityMeter: electricityMeter ?? this.electricityMeter,
      electricityMeterReading: electricityMeterReading ?? this.electricityMeterReading,
      generatorRemark: generatorRemark ?? this.generatorRemark,
    );
  }

  factory SiteGeneralInformationModel.fromJson(Map<String, dynamic> json) {
    return SiteGeneralInformationModel(
      name: json[nameKey],
      code: json[codeKey],
      governorate: json[governorateKey],
      street: json[streetKey],
      area: json[areaKey],
      city: json[cityKey],
      type: json[typeKey],
      gsm1900: json[gsm1900Key],
      gsm1800: json[gsm1800Key],
      the3G: json[the3GKey],
      lte: json[lteKey],
      generator: json[generatorKey],
      solar: json[solarKey],
      wind: json[windKey],
      grid: json[gridKey],
      fence: json[fenceKey],
      cabinetNumber: json[cabinetNumberKey],
      electricityMeter: json[electricityMeterKey],
      electricityMeterReading: json[electricityMeterReadingKey],
      generatorRemark: json[generatorRemarkKey],
    );
  }

  Map<String, dynamic> toJson() => {
        nameKey: name,
        codeKey: code,
        governorateKey: governorate,
        streetKey: street,
        areaKey: area,
        cityKey: city,
        typeKey: type,
        gsm1900Key: gsm1900,
        gsm1800Key: gsm1800,
        the3GKey: the3G,
        lteKey: lte,
        generatorKey: generator,
        solarKey: solar,
        windKey: wind,
        gridKey: grid,
        fenceKey: fence,
        cabinetNumberKey: cabinetNumber,
        electricityMeterKey: electricityMeter,
        electricityMeterReadingKey: electricityMeterReading,
        generatorRemarkKey: generatorRemark,
      };

  @override
  List<Object?> get props => [
        name,
        code,
        governorate,
        street,
        area,
        city,
        type,
        gsm1900,
        gsm1800,
        the3G,
        lte,
        generator,
        solar,
        wind,
        grid,
        fence,
        cabinetNumber,
        electricityMeter,
        electricityMeterReading,
        generatorRemark,
      ];
}
