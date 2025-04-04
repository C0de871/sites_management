import 'package:equatable/equatable.dart';

class TowerInformationsEntity extends Equatable {
  const TowerInformationsEntity({
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
  final int? tower;
  final int? monopole;
  final String? mastNumber;
  final String? mastStatus;
  final String? towerNumber;
  final String? towerStatus;
  final String beaconStatus;
  final int? monopoleNumber;
  final String? monopoleStatus;
  final String? mast1Height;
  final String? mast2Height;
  final String? mast3Height;
  final String? tower1Height;
  final String? tower2Height;
  final String? monopoleHeight;
  final String? remarks;

  TowerInformationsEntity copyWith({
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
    return TowerInformationsEntity(
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
