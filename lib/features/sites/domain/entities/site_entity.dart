import 'amperes_entity.dart';
import 'band_entity.dart';
import 'environment_informations_entity.dart';
import 'fiber_information_entity.dart';
import 'generator_information_entity.dart';
import 'genral_site_info_entity.dart';
import 'lvdp_information_entity.dart';
import 'rectifier_information_entity.dart';
import 'solar_wind_info_entity.dart';
import 'tcu_info_entity.dart';
import 'tower_info_entity.dart';

class SiteEntity {
  GeneralSitesInfoEntity? sites;
  TowerInformationsEntity? towerInformations;
  BandEntity? bandInformations;
  List<GeneratorInformationEntity>? generatorInformations;
  SolarWindInformationsEntity? solarWindInformations;
  RectifierInformationsEntity? rectifierInformations;
  EnvironmentInformationsEntity? environmentInformations;
  LvdpInformationsEntity? lvdpInformations;
  AmperesEntity? amperesInformations;
  TcuInformationsEntity? tcuInformations;
  FiberInformationsEntity? fiberInformations;
  List<dynamic>? siteImages;
  List<dynamic>? siteAdditionalImages;
  List<dynamic>? towerImages;
  List<dynamic>? bandImages;
  List<dynamic>? solarImages;
  List<dynamic>? rectifierImages;
  List<dynamic>? batteryImages;

  SiteEntity({
    this.sites,
    this.towerInformations,
    this.bandInformations,
    this.generatorInformations,
    this.solarWindInformations,
    this.rectifierInformations,
    this.environmentInformations,
    this.lvdpInformations,
    this.amperesInformations,
    this.tcuInformations,
    this.fiberInformations,
    this.siteImages,
    this.siteAdditionalImages,
    this.towerImages,
    this.bandImages,
    this.solarImages,
    this.rectifierImages,
    this.batteryImages,
  });
}