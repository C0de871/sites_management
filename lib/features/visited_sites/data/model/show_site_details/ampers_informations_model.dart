import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/amperes_informations_entity.dart';

class AmperesInformationsModel extends AmperesInformationsEntity with EquatableMixin {
  const AmperesInformationsModel({
    required super.capacity,
    required super.time,
    required super.cableLength,
    required super.details,
  });

  static const String capacityKey = "capacity";

  static const String timeKey = "time";

  static const String cableLengthKey = "cable_length";

  static const String detailsKey = "details";

  @override
  AmperesInformationsModel copyWith({
    String? capacity,
    String? time,
    String? cableLength,
    String? details,
  }) {
    return AmperesInformationsModel(
      capacity: capacity ?? super.capacity,
      time: time ?? super.time,
      cableLength: cableLength ?? super.cableLength,
      details: details ?? super.details,
    );
  }

  factory AmperesInformationsModel.fromJson(Map<String, dynamic> json) {
    return AmperesInformationsModel(
      capacity: json[capacityKey],
      time: json[timeKey],
      cableLength: json[cableLengthKey],
      details: json[detailsKey],
    );
  }

  Map<String, dynamic> toJson() => {
        capacityKey: capacity,
        timeKey: time,
        cableLengthKey: cableLength,
        detailsKey: details,
      };

  @override
  List<Object?> get props => [
        capacity,
        time,
        cableLength,
        details,
      ];
}
