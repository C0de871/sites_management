import 'package:equatable/equatable.dart';

class TcuInformationsEntity extends Equatable {
  const TcuInformationsEntity({
    required this.tcu,
    required this.the3G,
    required this.the2G,
    required this.lte,
    required this.remarks,
  });

  final int? tcu;
  final bool? the3G;
  final bool? the2G;
  final bool? lte;
  final String? remarks;

  TcuInformationsEntity copyWith({
    int? tcu,
    bool? the3G,
    bool? the2G,
    bool? lte,
    String? remarks,
  }) {
    return TcuInformationsEntity(
      tcu: tcu ?? this.tcu,
      the3G: the3G ?? this.the3G,
      the2G: the2G ?? this.the2G,
      lte: lte ?? this.lte,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props => [
        tcu,
        the3G,
        the2G,
        lte,
        remarks,
      ];
}
