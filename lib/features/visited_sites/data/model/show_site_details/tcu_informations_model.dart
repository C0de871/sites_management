import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/tcu_informations_entity.dart';

class TcuInformationsModel extends TcuInformationsEntity with EquatableMixin {
  const TcuInformationsModel({
    required super.tcu,
    required super.the3G,
    required super.the2G,
    required super.lte,
    required super.remarks,
  });

  static const String tcuKey = "tcu";

  static const String the3GKey = "3G";

  static const String the2GKey = "2G";

  static const String lteKey = "LTE";

  static const String remarksKey = "remarks";

  static const String tcuTypeKey = "tcu_types";

  @override
  TcuInformationsModel copyWith({
    int? tcu,
    bool? the3G,
    bool? the2G,
    bool? lte,
    String? remarks,
  }) {
    return TcuInformationsModel(
      tcu: tcu ?? this.tcu,
      the3G: the3G ?? this.the3G,
      the2G: the2G ?? this.the2G,
      lte: lte ?? this.lte,
      remarks: remarks ?? this.remarks,
    );
  }

  factory TcuInformationsModel.fromJson(Map<String, dynamic> json) {
    return TcuInformationsModel(
      tcu: json[tcuKey],
      the3G: json[tcuTypeKey][the3GKey],
      the2G: json[tcuTypeKey][the2GKey],
      lte: json[tcuTypeKey][lteKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        tcuKey: tcu,
        the3GKey: the3G,
        the2GKey: the2G,
        lteKey: lte,
        remarksKey: remarks,
      };

  @override
  List<Object?> get props => [
        tcu,
        the3G,
        the2G,
        lte,
        remarks,
      ];
}
