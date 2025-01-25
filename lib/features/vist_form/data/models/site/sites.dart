import 'dart:convert';

import 'package:sites_management/features/vist_form/domain/entities/genral_site_info_entity.dart';

import '../../../../../core/databases/api/end_points.dart';

class SitesModel extends GeneralSitesInfoEntity {
  SitesModel({
    super.name,
    super.code,
    super.governorate,
    super.street,
    super.area,
    super.city,
    super.type,
    super.gsm1900,
    super.gsm1800,
    super.threeg,
    super.lte,
    super.generator,
    super.solar,
    super.wind,
    super.grid,
    super.fence,
    super.cabinetNumber,
    super.electricityMeter,
    super.electricityMeterReading,
    super.generatorRemark,
  });

  factory SitesModel.fromMap(Map<String, dynamic> data) {
    return SitesModel(
      name: data[ApiKey.name] as String?,
      code: data[ApiKey.code] as String?,
      governorate: data[ApiKey.governorate] as String?,
      street: data[ApiKey.street] as String?,
      area: data[ApiKey.area] as String?,
      city: data[ApiKey.city] as String?,
      type: data[ApiKey.type] as String?,
      gsm1900: data[ApiKey.gsm1900] as bool?,
      gsm1800: data[ApiKey.gsm1800] as bool?,
      threeg: data[ApiKey.threeg] as bool?,
      lte: data[ApiKey.lte] as bool?,
      generator: data[ApiKey.generator] as bool?,
      solar: data[ApiKey.solar] as bool?,
      wind: data[ApiKey.wind] as bool?,
      grid: data[ApiKey.grid] as bool?,
      fence: data[ApiKey.fence] as bool?,
      cabinetNumber: data[ApiKey.cabinetNumber] as String?,
      electricityMeter: data[ApiKey.electricityMeter] as String?,
      electricityMeterReading: data[ApiKey.electricityMeterReading] as String?,
      generatorRemark: data[ApiKey.generatorRemark] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.name: name,
        ApiKey.code: code,
        ApiKey.governorate: governorate,
        ApiKey.street: street,
        ApiKey.area: area,
        ApiKey.city: city,
        ApiKey.type: type,
        ApiKey.gsm1900: gsm1900,
        ApiKey.gsm1800: gsm1800,
        ApiKey.threeg: threeg,
        ApiKey.lte: lte,
        ApiKey.generator: generator,
        ApiKey.solar: solar,
        ApiKey.wind: wind,
        ApiKey.grid: grid,
        ApiKey.fence: fence,
        ApiKey.cabinetNumber: cabinetNumber,
        ApiKey.electricityMeter: electricityMeter,
        ApiKey.electricityMeterReading: electricityMeterReading,
        ApiKey.generatorRemark: generatorRemark,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SitesModel].
  factory SitesModel.fromJson(String data) {
    return SitesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SitesModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SitesModel copyWith({
    String? name,
    String? code,
    String? governorate,
    String? street,
    String? area,
    String? city,
    String? type,
    bool? gsm1900,
    bool? gsm1800,
    bool? threeg,
    bool? lte,
    bool? generator,
    bool? solar,
    bool? wind,
    bool? grid,
    bool? fence,
    String? cabinetNumber,
    String? electricityMeter,
    String? electricityMeterReading,
    String? generatorRemark,
  }) {
    return SitesModel(
      name: name ?? this.name,
      code: code ?? this.code,
      governorate: governorate ?? this.governorate,
      street: street ?? this.street,
      area: area ?? this.area,
      city: city ?? this.city,
      type: type ?? this.type,
      gsm1900: gsm1900 ?? this.gsm1900,
      gsm1800: gsm1800 ?? this.gsm1800,
      threeg: threeg ?? this.threeg,
      lte: lte ?? this.lte,
      generator: generator ?? this.generator,
      solar: solar ?? this.solar,
      wind: wind ?? this.wind,
      grid: grid ?? this.grid,
      fence: fence ?? this.fence,
      cabinetNumber: cabinetNumber ?? this.cabinetNumber,
      electricityMeter: electricityMeter ?? this.electricityMeter,
      electricityMeterReading:
          electricityMeterReading ?? this.electricityMeterReading,
      generatorRemark: generatorRemark ?? this.generatorRemark,
    );
  }
}