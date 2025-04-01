import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/ampers_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/band_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/environment_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/fiber_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/generator_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/lvdp_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/site_general_information_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/solar_wind_information_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/tcu_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/tower_informations_model.dart';

class ShowSiteDetailsModel extends Equatable {
  const ShowSiteDetailsModel({
    required this.site,
    required this.towerInformations,
    required this.bandInformations,
    required this.generatorInformations,
    required this.solarWindInformations,
    required this.rectifierInformations,
    required this.environmentInformations,
    required this.lvdpInformations,
    required this.fiberInformations,
    required this.amperesInformations,
    required this.tcuInformations,
  });

  final SiteGeneralInformationModel? site;
  static const String siteKey = "site";

  final TowerInformationsModel? towerInformations;
  static const String towerInformationsKey = "tower_informations";

  final BandInformationsModel? bandInformations;
  static const String bandInformationsKey = "band_informations";

  final List<GeneratorInformationModel> generatorInformations;
  static const String generatorInformationsKey = "generator_informations";

  final SolarWindInformations? solarWindInformations;
  static const String solarWindInformationsKey = "solar_wind_informations";

  final Map<String, int> rectifierInformations;
  static const String rectifierInformationsKey = "rectifier_informations";

  final EnvironmentInformationsModel? environmentInformations;
  static const String environmentInformationsKey = "environment_informations";

  final LvdpInformationsModel? lvdpInformations;
  static const String lvdpInformationsKey = "lvdp_informations";

  final FiberInformationsModel? fiberInformations;
  static const String fiberInformationsKey = "fiber_informations";

  final AmperesInformationsModel? amperesInformations;
  static const String amperesInformationsKey = "amperes_informations";

  final TcuInformationsModel? tcuInformations;
  static const String tcuInformationsKey = "tcu_informations";

  ShowSiteDetailsModel copyWith({
    SiteGeneralInformationModel? site,
    TowerInformationsModel? towerInformations,
    BandInformationsModel? bandInformations,
    List<GeneratorInformationModel>? generatorInformations,
    SolarWindInformations? solarWindInformations,
    Map<String, int>? rectifierInformations,
    EnvironmentInformationsModel? environmentInformations,
    LvdpInformationsModel? lvdpInformations,
    FiberInformationsModel? fiberInformations,
    AmperesInformationsModel? amperesInformations,
    TcuInformationsModel? tcuInformations,
  }) {
    return ShowSiteDetailsModel(
      site: site ?? this.site,
      towerInformations: towerInformations ?? this.towerInformations,
      bandInformations: bandInformations ?? this.bandInformations,
      generatorInformations: generatorInformations ?? this.generatorInformations,
      solarWindInformations: solarWindInformations ?? this.solarWindInformations,
      rectifierInformations: rectifierInformations ?? this.rectifierInformations,
      environmentInformations: environmentInformations ?? this.environmentInformations,
      lvdpInformations: lvdpInformations ?? this.lvdpInformations,
      fiberInformations: fiberInformations ?? this.fiberInformations,
      amperesInformations: amperesInformations ?? this.amperesInformations,
      tcuInformations: tcuInformations ?? this.tcuInformations,
    );
  }

  factory ShowSiteDetailsModel.fromJson(Map<String, dynamic> json) {
    return ShowSiteDetailsModel(
      site: json[siteKey] == null ? null : SiteGeneralInformationModel.fromJson(json[siteKey]),
      towerInformations: json[towerInformationsKey] == null ? null : TowerInformationsModel.fromJson(json[towerInformationsKey]),
      bandInformations: json[bandInformationsKey] == null ? null : BandInformationsModel.fromJson(json[bandInformationsKey]),
      generatorInformations: json[generatorInformationsKey] == null ? [] : List<GeneratorInformationModel>.from(json[generatorInformationsKey]!.map((x) => GeneratorInformationModel.fromJson(x))),
      solarWindInformations: json[solarWindInformationsKey] == null ? null : SolarWindInformations.fromJson(json[solarWindInformationsKey]),
      rectifierInformations: Map.from(json[rectifierInformationsKey]).map((k, v) => MapEntry<String, int>(k, v)),
      environmentInformations: json[environmentInformationsKey] == null ? null : EnvironmentInformationsModel.fromJson(json[environmentInformationsKey]),
      lvdpInformations: json[lvdpInformationsKey] == null ? null : LvdpInformationsModel.fromJson(json[lvdpInformationsKey]),
      fiberInformations: json[fiberInformationsKey] == null ? null : FiberInformationsModel.fromJson(json[fiberInformationsKey]),
      amperesInformations: json[amperesInformationsKey] == null ? null : AmperesInformationsModel.fromJson(json[amperesInformationsKey]),
      tcuInformations: json[tcuInformationsKey] == null ? null : TcuInformationsModel.fromJson(json[tcuInformationsKey]),
    );
  }

  Map<String, dynamic> toJson() => {
        siteKey: site?.toJson(),
        towerInformationsKey: towerInformations?.toJson(),
        bandInformationsKey: bandInformations?.toJson(),
        generatorInformationsKey: generatorInformations.map((x) => x.toJson()).toList(),
        solarWindInformationsKey: solarWindInformations?.toJson(),
        rectifierInformationsKey: Map.from(rectifierInformations).map((k, v) => MapEntry<String, dynamic>(k, v)),
        environmentInformationsKey: environmentInformations?.toJson(),
        lvdpInformationsKey: lvdpInformations?.toJson(),
        fiberInformationsKey: fiberInformations?.toJson(),
        amperesInformationsKey: amperesInformations?.toJson(),
        tcuInformationsKey: tcuInformations?.toJson(),
      };

  @override
  List<Object?> get props => [
        site,
        towerInformations,
        bandInformations,
        generatorInformations,
        solarWindInformations,
        rectifierInformations,
        environmentInformations,
        lvdpInformations,
        fiberInformations,
        amperesInformations,
        tcuInformations,
      ];
}
