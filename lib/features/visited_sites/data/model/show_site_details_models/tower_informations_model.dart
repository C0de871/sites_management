import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/tower_informations_entity.dart';

class TowerInformationsModel extends TowerInformationsEntity with EquatableMixin {
  const TowerInformationsModel({
    required super.mast,
    required super.tower,
    required super.monopole,
    required super.mastNumber,
    required super.mastStatus,
    required super.towerNumber,
    required super.towerStatus,
    required super.beaconStatus,
    required super.monopoleNumber,
    required super.monopoleStatus,
    required super.mast1Height,
    required super.mast2Height,
    required super.mast3Height,
    required super.tower1Height,
    required super.tower2Height,
    required super.monopoleHeight,
    required super.remarks,
  });

  static const String mastKey = "mast";

  static const String towerKey = "tower";

  static const String monopoleKey = "monopole";

  static const String mastNumberKey = "mast_number";

  static const String mastStatusKey = "mast_status";

  static const String towerNumberKey = "tower_number";

  static const String towerStatusKey = "tower_status";

  static const String beaconStatusKey = "beacon_status";

  static const String monopoleNumberKey = "monopole_number";

  static const String monopoleStatusKey = "monopole_status";

  static const String mast1HeightKey = "mast_1_height";

  static const String mast2HeightKey = "mast_2_height";

  static const String mast3HeightKey = "mast_3_height";

  static const String tower1HeightKey = "tower_1_height";

  static const String tower2HeightKey = "tower_2_height";

  static const String monopoleHeightKey = "monopole_height";

  static const String remarksKey = "remarks";

  @override
  TowerInformationsModel copyWith({
    int? mast,
    int? tower,
    int? monopole,
    String? mastNumber,
    String? mastStatus,
    String? towerNumber,
    String? towerStatus,
    String? beaconStatus,
    int? monopoleNumber,
    String? monopoleStatus,
    String? mast1Height,
    String? mast2Height,
    String? mast3Height,
    String? tower1Height,
    String? tower2Height,
    String? monopoleHeight,
    String? remarks,
  }) {
    return TowerInformationsModel(
      mast: mast ?? this.mast,
      tower: tower ?? this.tower,
      monopole: monopole ?? this.monopole,
      mastNumber: mastNumber ?? this.mastNumber,
      mastStatus: mastStatus ?? this.mastStatus,
      towerNumber: towerNumber ?? this.towerNumber,
      towerStatus: towerStatus ?? this.towerStatus,
      beaconStatus: beaconStatus ?? this.beaconStatus,
      monopoleNumber: monopoleNumber ?? this.monopoleNumber,
      monopoleStatus: monopoleStatus ?? this.monopoleStatus,
      mast1Height: mast1Height ?? this.mast1Height,
      mast2Height: mast2Height ?? this.mast2Height,
      mast3Height: mast3Height ?? this.mast3Height,
      tower1Height: tower1Height ?? this.tower1Height,
      tower2Height: tower2Height ?? this.tower2Height,
      monopoleHeight: monopoleHeight ?? this.monopoleHeight,
      remarks: remarks ?? this.remarks,
    );
  }

  factory TowerInformationsModel.fromJson(Map<String, dynamic> json) {
    return TowerInformationsModel(
      mast: json[mastKey],
      tower: json[towerKey],
      monopole: json[monopoleKey],
      mastNumber: json[mastNumberKey],
      mastStatus: json[mastStatusKey],
      towerNumber: json[towerNumberKey],
      towerStatus: json[towerStatusKey],
      beaconStatus: json[beaconStatusKey],
      monopoleNumber: json[monopoleNumberKey],
      monopoleStatus: json[monopoleStatusKey],
      mast1Height: json[mast1HeightKey],
      mast2Height: json[mast2HeightKey],
      mast3Height: json[mast3HeightKey],
      tower1Height: json[tower1HeightKey],
      tower2Height: json[tower2HeightKey],
      monopoleHeight: json[monopoleHeightKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        mastKey: mast,
        towerKey: tower,
        monopoleKey: monopole,
        mastNumberKey: mastNumber,
        mastStatusKey: mastStatus,
        towerNumberKey: towerNumber,
        towerStatusKey: towerStatus,
        beaconStatusKey: beaconStatus,
        monopoleNumberKey: monopoleNumber,
        monopoleStatusKey: monopoleStatus,
        mast1HeightKey: mast1Height,
        mast2HeightKey: mast2Height,
        mast3HeightKey: mast3Height,
        tower1HeightKey: tower1Height,
        tower2HeightKey: tower2Height,
        monopoleHeightKey: monopoleHeight,
        remarksKey: remarks,
      };

  @override
  List<Object?> get props => [
        mast,
        tower,
        monopole,
        mastNumber,
        mastStatus,
        towerNumber,
        towerStatus,
        beaconStatus,
        monopoleNumber,
        monopoleStatus,
        mast1Height,
        mast2Height,
        mast3Height,
        tower1Height,
        tower2Height,
        monopoleHeight,
        remarks,
      ];
}
