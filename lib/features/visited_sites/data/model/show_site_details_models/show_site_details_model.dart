import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/ampers_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/band_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/environment_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/fiber_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/generator_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/lvdp_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/rectifier__informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/site_general_information_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/solar_wind_information_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/tcu_informations_model.dart';
import 'package:sites_management/features/visited_sites/data/model/show_site_details_models/tower_informations_model.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/show_site_details_entity.dart';

class ShowSiteDetailsModel extends ShowSiteDetailsEntity with EquatableMixin {
  const ShowSiteDetailsModel({
    required super.site,
    required super.towerInformations,
    required super.bandInformations,
    required super.generatorInformations,
    required super.solarWindInformations,
    required super.rectifierInformations,
    required super.environmentInformations,
    required super.lvdpInformations,
    required super.fiberInformations,
    required super.amperesInformations,
    required super.tcuInformations,
  });

  static const String siteKey = "site";

  static const String towerInformationsKey = "tower_informations";

  static const String bandInformationsKey = "band_informations";

  static const String generatorInformationsKey = "generator_informations";

  static const String solarWindInformationsKey = "solar_wind_informations";

  static const String rectifierInformationsKey = "rectifier_informations";

  static const String environmentInformationsKey = "environment_informations";

  static const String lvdpInformationsKey = "lvdp_informations";

  static const String fiberInformationsKey = "fiber_informations";

  static const String amperesInformationsKey = "amperes_informations";

  static const String tcuInformationsKey = "tcu_informations";

  factory ShowSiteDetailsModel.fromJson(Map<String, dynamic> json) {
    return ShowSiteDetailsModel(
      site: json[siteKey] == null ? null : SiteGeneralInformationModel.fromJson(json[siteKey]),
      towerInformations: json[towerInformationsKey] == null ? null : TowerInformationsModel.fromJson(json[towerInformationsKey]),
      bandInformations: json[bandInformationsKey] == null ? null : BandInformationsModel.fromJson(json[bandInformationsKey]),
      generatorInformations: json[generatorInformationsKey] == null ? [] : List<GeneratorInformationModel>.from(json[generatorInformationsKey]!.map((x) => GeneratorInformationModel.fromJson(x))),
      solarWindInformations: json[solarWindInformationsKey] == null ? null : SolarWindInformations.fromJson(json[solarWindInformationsKey]),
      rectifierInformations: json[rectifierInformationsKey] == null ? null : RectifierInformationsModel.fromJson(json[rectifierInformationsKey]),
      environmentInformations: json[environmentInformationsKey] == null ? null : EnvironmentInformationsModel.fromJson(json[environmentInformationsKey]),
      lvdpInformations: json[lvdpInformationsKey] == null ? null : LvdpInformationsModel.fromJson(json[lvdpInformationsKey]),
      fiberInformations: json[fiberInformationsKey] == null ? null : FiberInformationsModel.fromJson(json[fiberInformationsKey]),
      amperesInformations: json[amperesInformationsKey] == null ? null : AmperesInformationsModel.fromJson(json[amperesInformationsKey]),
      tcuInformations: json[tcuInformationsKey] == null ? null : TcuInformationsModel.fromJson(json[tcuInformationsKey]),
    );
  }

  Map<String, dynamic> toJson() => {
        siteKey: (site as SiteGeneralInformationModel?)?.toJson(),
        towerInformationsKey: (towerInformations as TowerInformationsModel?)?.toJson(),
        bandInformationsKey: (bandInformations as BandInformationsModel?)?.toJson(),
        generatorInformationsKey: generatorInformations.map((x) => (x as GeneratorInformationModel?)?.toJson()).toList(),
        solarWindInformationsKey: (solarWindInformations as SolarWindInformations?)?.toJson(),
        rectifierInformationsKey: (rectifierInformations as RectifierInformationsModel?)?.toJson(),
        environmentInformationsKey: (environmentInformations as EnvironmentInformationsModel?)?.toJson(),
        lvdpInformationsKey: (lvdpInformations as LvdpInformationsModel?)?.toJson(),
        fiberInformationsKey: (fiberInformations as FiberInformationsModel?)?.toJson(),
        amperesInformationsKey: (amperesInformations as AmperesInformationsModel?)?.toJson(),
        tcuInformationsKey: (tcuInformations as TcuInformationsModel?)?.toJson(),
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
