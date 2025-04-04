import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/band_informations_entity.dart';

import '../../../domain/entities/show_site_details/band_informatoins_sub_entity.dart';
import 'band_informations_sub_model.dart';

class BandInformationsModel extends BandInformationsEntity with EquatableMixin {
  const BandInformationsModel({
    required super.gsm900,
    required super.gsm1800,
    required super.the3G,
    required super.lte,
  });

  static const String gsm900Key = "GSM_900";

  static const String gsm1800Key = "GSM_1800";

  static const String the3GKey = "3G";

  static const String lteKey = "LTE";

  @override
  BandInformationsModel copyWith({
    BandInformationsSubEntity? gsm900,
    BandInformationsSubEntity? gsm1800,
    BandInformationsSubEntity? the3G,
    BandInformationsSubEntity? lte,
  }) {
    return BandInformationsModel(
      gsm900: gsm900 ?? super.gsm900,
      gsm1800: gsm1800 ?? super.gsm1800,
      the3G: the3G ?? super.the3G,
      lte: lte ?? super.lte,
    );
  }

  factory BandInformationsModel.fromJson(Map<String, dynamic> json) {
    return BandInformationsModel(
      gsm900: json[gsm900Key] == null ? null : BandInformationsSubModel.fromJson(json[gsm900Key]),
      gsm1800: json[gsm1800Key] == null ? null : BandInformationsSubModel.fromJson(json[gsm1800Key]),
      the3G: json[the3GKey] == null ? null : BandInformationsSubModel.fromJson(json[the3GKey]),
      lte: json[lteKey] == null ? null : BandInformationsSubModel.fromJson(json[lteKey]),
    );
  }

  Map<String, dynamic> toJson() => {
        gsm900Key: (gsm900 as BandInformationsSubModel?)?.toJson(),
        gsm1800Key: (gsm1800 as BandInformationsSubModel?)?.toJson(),
        the3GKey: (the3G as BandInformationsSubModel?)?.toJson(),
        lteKey: (lte as BandInformationsSubModel?)?.toJson(),
      };

  @override
  List<Object?> get props => [
        gsm900,
        gsm1800,
        the3G,
        lte,
      ];
}
