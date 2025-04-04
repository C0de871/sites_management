import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/band_informatoins_sub_entity.dart';

class BandInformationsSubModel extends BandInformationsSubEntity with EquatableMixin {
  const BandInformationsSubModel({
    required super.bandType,
    required super.rbs1Type,
    required super.rbs2Type,
    required super.du1Type,
    required super.du2Type,
    required super.ru1Type,
    required super.ru2Type,
    required super.remarks,
  });

  static const String bandTypeKey = "band_type";

  static const String rbs1TypeKey = "rbs_1_type";

  static const String rbs2TypeKey = "rbs_2_type";

  static const String du1TypeKey = "du_1_type";

  static const String du2TypeKey = "du_2_type";

  static const String ru1TypeKey = "ru_1_type";

  static const String ru2TypeKey = "ru_2_type";

  static const String remarksKey = "remarks";

  @override
  BandInformationsSubModel copyWith({
    String? bandType,
    String? rbs1Type,
    String? rbs2Type,
    String? du1Type,
    String? du2Type,
    String? ru1Type,
    String? ru2Type,
    String? remarks,
  }) {
    return BandInformationsSubModel(
      bandType: bandType ?? super.bandType,
      rbs1Type: rbs1Type ?? super.rbs1Type,
      rbs2Type: rbs2Type ?? super.rbs2Type,
      du1Type: du1Type ?? super.du1Type,
      du2Type: du2Type ?? super.du2Type,
      ru1Type: ru1Type ?? super.ru1Type,
      ru2Type: ru2Type ?? super.ru2Type,
      remarks: remarks ?? super.remarks,
    );
  }

  factory BandInformationsSubModel.fromJson(Map<String, dynamic> json) {
    return BandInformationsSubModel(
      bandType: json[bandTypeKey],
      rbs1Type: json[rbs1TypeKey],
      rbs2Type: json[rbs2TypeKey],
      du1Type: json[du1TypeKey],
      du2Type: json[du2TypeKey],
      ru1Type: json[ru1TypeKey],
      ru2Type: json[ru2TypeKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        bandTypeKey: bandType,
        rbs1TypeKey: rbs1Type,
        rbs2TypeKey: rbs2Type,
        du1TypeKey: du1Type,
        du2TypeKey: du2Type,
        ru1TypeKey: ru1Type,
        ru2TypeKey: ru2Type,
        remarksKey: remarks,
      };

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
