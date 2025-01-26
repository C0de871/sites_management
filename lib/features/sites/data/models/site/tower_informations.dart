import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/tower_info_entity.dart';

class TowerInformationsModel extends TowerInformationsEntity {
  TowerInformationsModel({
    super.mast,
    super.tower,
    super.monopole,
    super.mastNumber,
    super.mastStatus,
    super.towerNumber,
    super.towerStatus,
    super.beaconStatus,
    super.monopoleNumber,
    super.monopoleStatus,
    super.mast1Height,
    super.mast2Height,
    super.mast3Height,
    super.tower1Height,
    super.tower2Height,
    super.monopoleHeight,
    super.remarks,
  });

  factory TowerInformationsModel.fromMap(Map<String, dynamic> data) {
    return TowerInformationsModel(
      mast: data[ApiKey.mast] as bool?,
      tower: data[ApiKey.tower] as bool?,
      monopole: data[ApiKey.monopole] as bool?,
      mastNumber: data[ApiKey.mastNumber] as String?,
      mastStatus: data[ApiKey.mastStatus] as String?,
      towerNumber: data[ApiKey.towerNumber] as String?,
      towerStatus: data[ApiKey.towerStatus] as String?,
      beaconStatus: data[ApiKey.beaconStatus] as String?,
      monopoleNumber: data[ApiKey.monopoleNumber] as String?,
      monopoleStatus: data[ApiKey.monopoleStatus] as String?,
      mast1Height: data[ApiKey.mast1Height] as String?,
      mast2Height: data[ApiKey.mast2Height] as String?,
      mast3Height: data[ApiKey.mast3Height] as String?,
      tower1Height: data[ApiKey.tower1Height] as String?,
      tower2Height: data[ApiKey.tower2Height] as String?,
      monopoleHeight: data[ApiKey.monopoleHeight] as String?,
      remarks: data[ApiKey.remarks] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.mast: mast,
        ApiKey.tower: tower,
        ApiKey.monopole: monopole,
        ApiKey.mastNumber: mastNumber,
        ApiKey.mastStatus: mastStatus,
        ApiKey.towerNumber: towerNumber,
        ApiKey.towerStatus: towerStatus,
        ApiKey.beaconStatus: beaconStatus,
        ApiKey.monopoleNumber: monopoleNumber,
        ApiKey.monopoleStatus: monopoleStatus,
        ApiKey.mast1Height: mast1Height,
        ApiKey.mast2Height: mast2Height,
        ApiKey.mast3Height: mast3Height,
        ApiKey.tower1Height: tower1Height,
        ApiKey.tower2Height: tower2Height,
        ApiKey.monopoleHeight: monopoleHeight,
        ApiKey.remarks: remarks,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TowerInformationsModel].
  factory TowerInformationsModel.fromJson(String data) {
    return TowerInformationsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TowerInformationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  TowerInformationsModel copyWith({
    bool? mast,
    bool? tower,
    bool? monopole,
    String? mastNumber,
    String? mastStatus,
    String? towerNumber,
    String? towerStatus,
    String? beaconStatus,
    String? monopoleNumber,
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
}
