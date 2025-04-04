import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/tcu_informations_entity.dart';

class TcuInformationsModel extends TcuInformationsEntity with EquatableMixin {
  const TcuInformationsModel({
    required super.tcu,
    required super.the3G,
    required super.the2G,
    required super.ite,
    required super.remarks,
  });

  static const String tcuKey = "tcu";

  static const String the3GKey = "3g";

  static const String the2GKey = "2g";

  static const String iteKey = "ite";

  static const String remarksKey = "remarks";

  @override
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
