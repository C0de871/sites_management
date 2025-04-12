import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/amperes_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/band_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/environment_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/fiber_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/generator_information_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/lvdp_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/rectifier_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/site_informations_general_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/solar_wind_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/tcu_informations_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/tower_informations_entity.dart';

class ShowSiteDetailsEntity extends Equatable {
  const ShowSiteDetailsEntity({
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

  final SiteInformationsGeneralEntity? site;
  final TowerInformationsEntity? towerInformations;
  final BandInformationsEntity? bandInformations;
  final List<GeneratorInformationEntity>? generatorInformations;
  final SolarWindInformationsEntity? solarWindInformations;
  final RectifierInformationsEntity? rectifierInformations;
  final EnvironmentInformationsEntity? environmentInformations;
  final LvdpInformationsEntity? lvdpInformations;
  final FiberInformationsEntity? fiberInformations;
  final AmperesInformationsEntity? amperesInformations;
  final TcuInformationsEntity? tcuInformations;

  ShowSiteDetailsEntity copyWith({
    SiteInformationsGeneralEntity? site,
    TowerInformationsEntity? towerInformations,
    BandInformationsEntity? bandInformations,
    List<GeneratorInformationEntity>? generatorInformations,
    SolarWindInformationsEntity? solarWindInformations,
    RectifierInformationsEntity? rectifierInformations,
    EnvironmentInformationsEntity? environmentInformations,
    LvdpInformationsEntity? lvdpInformations,
    FiberInformationsEntity? fiberInformations,
    AmperesInformationsEntity? amperesInformations,
    TcuInformationsEntity? tcuInformations,
  }) {
    return ShowSiteDetailsEntity(
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
