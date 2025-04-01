import 'package:equatable/equatable.dart';

class AmperesInformationsModel extends Equatable {
  const AmperesInformationsModel({
    required this.capacity,
    required this.time,
    required this.cableLength,
    required this.details,
  });

  final String? capacity;
  static const String capacityKey = "capacity";

  final String time;
  static const String timeKey = "time";

  final String cableLength;
  static const String cableLengthKey = "cable_length";

  final String details;
  static const String detailsKey = "details";

  AmperesInformationsModel copyWith({
    String? capacity,
    String? time,
    String? cableLength,
    String? details,
  }) {
    return AmperesInformationsModel(
      capacity: capacity ?? this.capacity,
      time: time ?? this.time,
      cableLength: cableLength ?? this.cableLength,
      details: details ?? this.details,
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
