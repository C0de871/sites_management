import 'package:equatable/equatable.dart';

import '../../../domain/entities/show_site_details_entities/site_informations_general_entity.dart';

class SiteGeneralInformationModel extends SiteInformationsGeneralEntity with EquatableMixin {
  const SiteGeneralInformationModel({
    required super.name,
    required super.code,
    required super.governorate,
    required super.street,
    required super.area,
    required super.city,
    required super.type,
    required super.gsm1900,
    required super.gsm1800,
    required super.the3G,
    required super.lte,
    required super.generator,
    required super.solar,
    required super.wind,
    required super.grid,
    required super.fence,
    required super.cabinetNumber,
    required super.electricityMeter,
    required super.electricityMeterReading,
    required super.generatorRemark,
  });

  static const String nameKey = "name";

  static const String codeKey = "code";

  static const String governorateKey = "governorate";

  static const String streetKey = "street";

  static const String areaKey = "area";

  static const String cityKey = "city";

  static const String typeKey = "type";

  static const String gsm1900Key = "gsm1900";

  static const String gsm1800Key = "gsm1800";

  static const String the3GKey = "3g";

  static const String lteKey = "lte";

  static const String generatorKey = "generator";

  static const String solarKey = "solar";

  static const String windKey = "wind";

  static const String gridKey = "grid";

  static const String fenceKey = "fence";

  static const String cabinetNumberKey = "cabinet_number";

  static const String electricityMeterKey = "electricity_meter";

  static const String electricityMeterReadingKey = "electricity_meter_reading";

  static const String generatorRemarkKey = "generator_remark";

  @override
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
