import 'dart:convert';

import 'package:sites_management/features/sites/data/models/site/sites.dart';
import 'package:sites_management/features/sites/data/models/site/tower_informations.dart';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/site_entity.dart';
import 'amperes_informations.dart';
import 'band_informations.dart';
import 'environment_informations.dart';
import 'fiber_informations.dart';
import 'generator_information.dart';
import 'lvdp_informations.dart';
import 'rectifier_informations.dart';
import 'solar_wind_informations.dart';
import 'tcu_informations.dart';

class SiteModel extends SiteEntity {
  SiteModel({
    super.sites,
    super.towerInformations,
    super.bandInformations,
    super.generatorInformations,
    super.solarWindInformations,
    super.rectifierInformations,
    super.environmentInformations,
    super.lvdpInformations,
    super.amperesInformations,
    super.tcuInformations,
    super.fiberInformations,
    super.siteImages,
    super.siteAdditionalImages,
    super.towerImages,
    super.bandImages,
    super.solarImages,
    super.rectifierImages,
    super.batteryImages,
  });

  factory SiteModel.fromMap(Map<String, dynamic> data) {
    return SiteModel(
      sites: data[ApiKey.sites] == null
          ? null
          : SitesModel.fromMap(data[ApiKey.sites] as Map<String, dynamic>),
      towerInformations: data[ApiKey.towerInformations] == null
          ? null
          : TowerInformationsModel.fromMap(
              data[ApiKey.towerInformations] as Map<String, dynamic>),
      bandInformations: data[ApiKey.bandInformations] == null
          ? null
          : BandModel.fromMap(
              data[ApiKey.bandInformations] as Map<String, dynamic>),
      generatorInformations:
          (data[ApiKey.generatorInformations] as List<dynamic>?)
              ?.map((e) =>
                  GeneratorInformationModel.fromMap(e as Map<String, dynamic>))
              .toList(),
      solarWindInformations: data[ApiKey.solarWindInformations] == null
          ? null
          : SolarWindInformationsModel.fromMap(
              data[ApiKey.solarWindInformations] as Map<String, dynamic>),
      rectifierInformations: data[ApiKey.rectifierInformations] == null
          ? null
          : RectifierInformationsModel.fromMap(
              data[ApiKey.rectifierInformations] as Map<String, dynamic>),
      environmentInformations: data[ApiKey.environmentInformations] == null
          ? null
          : EnvironmentInformationsModel.fromMap(
              data[ApiKey.environmentInformations] as Map<String, dynamic>),
      lvdpInformations: data[ApiKey.lvdpInformations] == null
          ? null
          : LvdpInformationsModel.fromMap(
              data[ApiKey.lvdpInformations] as Map<String, dynamic>),
      amperesInformations: data[ApiKey.amperesInformations] == null
          ? null
          : AmperesModel.fromMap(
              data[ApiKey.amperesInformations] as Map<String, dynamic>),
      tcuInformations: data[ApiKey.tcuInformations] == null
          ? null
          : TcuInformationsModel.fromMap(
              data[ApiKey.tcuInformations] as Map<String, dynamic>),
      fiberInformations: data[ApiKey.fiberInformations] == null
          ? null
          : FiberInformationsModel.fromMap(
              data[ApiKey.fiberInformations] as Map<String, dynamic>),
      siteImages: data[ApiKey.siteImages] as List<dynamic>?,
      siteAdditionalImages: data[ApiKey.siteAdditionalImages] as List<dynamic>?,
      towerImages: data[ApiKey.towerImages] as List<dynamic>?,
      bandImages: data[ApiKey.bandImages] as List<dynamic>?,
      solarImages: data[ApiKey.solarImages] as List<dynamic>?,
      rectifierImages: data[ApiKey.rectifierImages] as List<dynamic>?,
      batteryImages: data[ApiKey.batteryImages] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.sites: (sites as SitesModel?)?.toMap(),
        ApiKey.towerInformations:
            (towerInformations as TowerInformationsModel?)?.toMap(),
        ApiKey.bandInformations: (bandInformations as BandModel?)?.toMap(),
        ApiKey.generatorInformations: generatorInformations
            ?.map((e) => (e as GeneratorInformationModel).toMap())
            .toList(),
        ApiKey.solarWindInformations:
            (solarWindInformations as SolarWindInformationsModel?)?.toMap(),
        ApiKey.rectifierInformations:
            (rectifierInformations as RectifierInformationsModel?)?.toMap(),
        ApiKey.environmentInformations:
            (environmentInformations as EnvironmentInformationsModel?)?.toMap(),
        ApiKey.lvdpInformations:
            (lvdpInformations as LvdpInformationsModel?)?.toMap(),
        ApiKey.amperesInformations:
            (amperesInformations as AmperesModel?)?.toMap(),
        ApiKey.tcuInformations:
            (tcuInformations as TcuInformationsModel?)?.toMap(),
        ApiKey.fiberInformations:
            (fiberInformations as FiberInformationsModel?)?.toMap(),
        ApiKey.siteImages: siteImages,
        ApiKey.siteAdditionalImages: siteAdditionalImages,
        ApiKey.towerImages: towerImages,
        ApiKey.bandImages: bandImages,
        ApiKey.solarImages: solarImages,
        ApiKey.rectifierImages: rectifierImages,
        ApiKey.batteryImages: batteryImages,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SiteModel].
  factory SiteModel.fromJson(String data) {
    return SiteModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SiteModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SiteModel copyWith({
    SitesModel? sites,
    TowerInformationsModel? towerInformations,
    BandModel? bandInformations,
    List<GeneratorInformationModel>? generatorInformations,
    SolarWindInformationsModel? solarWindInformations,
    RectifierInformationsModel? rectifierInformations,
    EnvironmentInformationsModel? environmentInformations,
    LvdpInformationsModel? lvdpInformations,
    AmperesModel? amperesInformations,
    TcuInformationsModel? tcuInformations,
    FiberInformationsModel? fiberInformations,
    List<dynamic>? siteImages,
    List<dynamic>? siteAdditionalImages,
    List<dynamic>? towerImages,
    List<dynamic>? bandImages,
    List<dynamic>? solarImages,
    List<dynamic>? rectifierImages,
    List<dynamic>? batteryImages,
  }) {
    return SiteModel(
      sites: sites ?? this.sites,
      towerInformations: towerInformations ?? this.towerInformations,
      bandInformations: bandInformations ?? this.bandInformations,
      generatorInformations:
          generatorInformations ?? this.generatorInformations,
      solarWindInformations:
          solarWindInformations ?? this.solarWindInformations,
      rectifierInformations:
          rectifierInformations ?? this.rectifierInformations,
      environmentInformations:
          environmentInformations ?? this.environmentInformations,
      lvdpInformations: lvdpInformations ?? this.lvdpInformations,
      amperesInformations: amperesInformations ?? this.amperesInformations,
      tcuInformations: tcuInformations ?? this.tcuInformations,
      fiberInformations: fiberInformations ?? this.fiberInformations,
      siteImages: siteImages ?? this.siteImages,
      siteAdditionalImages: siteAdditionalImages ?? this.siteAdditionalImages,
      towerImages: towerImages ?? this.towerImages,
      bandImages: bandImages ?? this.bandImages,
      solarImages: solarImages ?? this.solarImages,
      rectifierImages: rectifierImages ?? this.rectifierImages,
      batteryImages: batteryImages ?? this.batteryImages,
    );
  }
}
