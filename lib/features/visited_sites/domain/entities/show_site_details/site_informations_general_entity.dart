import 'package:equatable/equatable.dart';

class SiteInformationsGeneralEntity extends Equatable {
  const SiteInformationsGeneralEntity({
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
  final String? code;
  final String? governorate;
  final String? street;
  final String? area;
  final String? city;
  final String? type;
  final int? gsm1900;
  final int? gsm1800;
  final int? the3G;
  final int? lte;
  final int? generator;
  final int? solar;
  final int? wind;
  final int? grid;
  final int? fence;
  final int? cabinetNumber;
  final String? electricityMeter;
  final String? electricityMeterReading;
  final String? generatorRemark;

  SiteInformationsGeneralEntity copyWith({
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
    return SiteInformationsGeneralEntity(
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
