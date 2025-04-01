import 'package:equatable/equatable.dart';

class TcuInformationsModel extends Equatable {
  const TcuInformationsModel({
    required this.tcu,
    required this.the3G,
    required this.the2G,
    required this.ite,
    required this.remarks,
  });

  final int? tcu;
  static const String tcuKey = "tcu";

  final int? the3G;
  static const String the3GKey = "3g";

  final int? the2G;
  static const String the2GKey = "2g";

  final int? ite;
  static const String iteKey = "ite";

  final String? remarks;
  static const String remarksKey = "remarks";

  TcuInformationsModel copyWith({
    int? tcu,
    int? the3G,
    int? the2G,
    int? ite,
    String? remarks,
  }) {
    return TcuInformationsModel(
      tcu: tcu ?? this.tcu,
      the3G: the3G ?? this.the3G,
      the2G: the2G ?? this.the2G,
      ite: ite ?? this.ite,
      remarks: remarks ?? this.remarks,
    );
  }

  factory TcuInformationsModel.fromJson(Map<String, dynamic> json) {
    return TcuInformationsModel(
      tcu: json[tcuKey],
      the3G: json[the3GKey],
      the2G: json[the2GKey],
      ite: json[iteKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        tcuKey: tcu,
        the3GKey: the3G,
        the2GKey: the2G,
        iteKey: ite,
        remarksKey: remarks,
      };

  @override
  List<Object?> get props => [
        tcu,
        the3G,
        the2G,
        ite,
        remarks,
      ];
}
