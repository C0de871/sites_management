import 'package:equatable/equatable.dart';

class TcuInformationsEntity extends Equatable {
  const TcuInformationsEntity({
    required this.tcu,
    required this.the3G,
    required this.the2G,
    required this.ite,
    required this.remarks,
  });

  final int? tcu;
  final int? the3G;
  final int? the2G;
  final int? ite;
  final String? remarks;

  TcuInformationsEntity copyWith({
    int? tcu,
    int? the3G,
    int? the2G,
    int? ite,
    String? remarks,
  }) {
    return TcuInformationsEntity(
      tcu: tcu ?? this.tcu,
      the3G: the3G ?? this.the3G,
      the2G: the2G ?? this.the2G,
      ite: ite ?? this.ite,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props => [
        tcu,
        the3G,
        the2G,
        ite,
        remarks,
      ];
}
