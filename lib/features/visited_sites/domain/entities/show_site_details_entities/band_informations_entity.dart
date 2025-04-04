import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/band_informatoins_sub_entity.dart';

class BandInformationsEntity extends Equatable {
  const BandInformationsEntity({
    required this.gsm900,
    required this.gsm1800,
    required this.the3G,
    required this.lte,
  });

  final BandInformationsSubEntity? gsm900;
  final BandInformationsSubEntity? gsm1800;
  final BandInformationsSubEntity? the3G;
  final BandInformationsSubEntity? lte;

  BandInformationsEntity copyWith({
    BandInformationsSubEntity? gsm900,
    BandInformationsSubEntity? gsm1800,
    BandInformationsSubEntity? the3G,
    BandInformationsSubEntity? lte,
  }) {
    return BandInformationsEntity(
      gsm900: gsm900 ?? this.gsm900,
      gsm1800: gsm1800 ?? this.gsm1800,
      the3G: the3G ?? this.the3G,
      lte: lte ?? this.lte,
    );
  }

  @override
  List<Object?> get props => [
        gsm900,
        gsm1800,
        the3G,
        lte,
      ];
}
