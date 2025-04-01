import 'package:equatable/equatable.dart';

class TowerInformationsModel extends Equatable {
  const TowerInformationsModel({
    required this.mast,
    required this.tower,
    required this.monopole,
    required this.mastNumber,
    required this.mastStatus,
    required this.towerNumber,
    required this.towerStatus,
    required this.beaconStatus,
    required this.monopoleNumber,
    required this.monopoleStatus,
    required this.mast1Height,
    required this.mast2Height,
    required this.mast3Height,
    required this.tower1Height,
    required this.tower2Height,
    required this.monopoleHeight,
    required this.remarks,
  });

  final int? mast;
  static const String mastKey = "mast";

  final int? tower;
  static const String towerKey = "tower";

  final int? monopole;
  static const String monopoleKey = "monopole";

  final String? mastNumber;
  static const String mastNumberKey = "mast_number";

  final String? mastStatus;
  static const String mastStatusKey = "mast_status";

  final String? towerNumber;
  static const String towerNumberKey = "tower_number";

  final String? towerStatus;
  static const String towerStatusKey = "tower_status";

  final String beaconStatus;
  static const String beaconStatusKey = "beacon_status";

  final int? monopoleNumber;
  static const String monopoleNumberKey = "monopole_number";

  final String? monopoleStatus;
  static const String monopoleStatusKey = "monopole_status";

  final String? mast1Height;
  static const String mast1HeightKey = "mast_1_height";

  final String? mast2Height;
  static const String mast2HeightKey = "mast_2_height";

  final String? mast3Height;
  static const String mast3HeightKey = "mast_3_height";

  final String? tower1Height;
  static const String tower1HeightKey = "tower_1_height";

  final String? tower2Height;
  static const String tower2HeightKey = "tower_2_height";

  final String? monopoleHeight;
  static const String monopoleHeightKey = "monopole_height";

  final String? remarks;
  static const String remarksKey = "remarks";

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
