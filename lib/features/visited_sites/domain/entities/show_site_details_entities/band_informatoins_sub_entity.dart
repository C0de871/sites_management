import 'package:equatable/equatable.dart';

class BandInformationsSubEntity extends Equatable {
  const BandInformationsSubEntity({
    required this.bandType,
    required this.rbs1Type,
    required this.rbs2Type,
    required this.du1Type,
    required this.du2Type,
    required this.ru1Type,
    required this.ru2Type,
    required this.remarks,
  });

  final String? bandType;
  final String? rbs1Type;
  final String? rbs2Type;
  final String? du1Type;
  final String? du2Type;
  final String? ru1Type;
  final String? ru2Type;
  final String? remarks;

  BandInformationsSubEntity copyWith({
    String? bandType,
    String? rbs1Type,
    String? rbs2Type,
    String? du1Type,
    String? du2Type,
    String? ru1Type,
    String? ru2Type,
    String? remarks,
  }) {
    return BandInformationsSubEntity(
      bandType: bandType ?? this.bandType,
      rbs1Type: rbs1Type ?? this.rbs1Type,
      rbs2Type: rbs2Type ?? this.rbs2Type,
      du1Type: du1Type ?? this.du1Type,
      du2Type: du2Type ?? this.du2Type,
      ru1Type: ru1Type ?? this.ru1Type,
      ru2Type: ru2Type ?? this.ru2Type,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props => [
        bandType,
        rbs1Type,
        rbs2Type,
        du1Type,
        du2Type,
        ru1Type,
        ru2Type,
        remarks,
      ];
}
