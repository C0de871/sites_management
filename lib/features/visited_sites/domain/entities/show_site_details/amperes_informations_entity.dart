import 'package:equatable/equatable.dart';

class AmperesInformationsEntity extends Equatable {
  const AmperesInformationsEntity({
    required this.capacity,
    required this.time,
    required this.cableLength,
    required this.details,
  });

  final String? capacity;
  final String time;
  final String cableLength;
  final String details;

  AmperesInformationsEntity copyWith({
    String? capacity,
    String? time,
    String? cableLength,
    String? details,
  }) {
    return AmperesInformationsEntity(
      capacity: capacity ?? this.capacity,
      time: time ?? this.time,
      cableLength: cableLength ?? this.cableLength,
      details: details ?? this.details,
    );
  }

  @override
  List<Object?> get props => [
        capacity,
        time,
        cableLength,
        details,
      ];
}
