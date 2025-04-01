import 'package:equatable/equatable.dart';

class BandInformationsModel extends Equatable {
  const BandInformationsModel({
    required this.gsm900,
    required this.gsm1800,
    required this.the3G,
    required this.lte,
  });

  final Map<String, String> gsm900;
  static const String gsm900Key = "GSM_900";

  final Map<String, String> gsm1800;
  static const String gsm1800Key = "GSM_1800";

  final Map<String, String> the3G;
  static const String the3GKey = "3G";

  final Map<String, String> lte;
  static const String lteKey = "LTE";

  BandInformationsModel copyWith({
    Map<String, String>? gsm900,
    Map<String, String>? gsm1800,
    Map<String, String>? the3G,
    Map<String, String>? lte,
  }) {
    return BandInformationsModel(
      gsm900: gsm900 ?? this.gsm900,
      gsm1800: gsm1800 ?? this.gsm1800,
      the3G: the3G ?? this.the3G,
      lte: lte ?? this.lte,
    );
  }

  factory BandInformationsModel.fromJson(Map<String, dynamic> json) {
    return BandInformationsModel(
      gsm900: Map.from(json[gsm900Key]).map((k, v) => MapEntry<String, String>(k, v)),
      gsm1800: Map.from(json[gsm1800Key]).map((k, v) => MapEntry<String, String>(k, v)),
      the3G: Map.from(json[the3GKey]).map((k, v) => MapEntry<String, String>(k, v)),
      lte: Map.from(json[lteKey]).map((k, v) => MapEntry<String, String>(k, v)),
    );
  }

  Map<String, dynamic> toJson() => {
        gsm900Key: Map.from(gsm900).map((k, v) => MapEntry<String, dynamic>(k, v)),
        gsm1800Key: Map.from(gsm1800).map((k, v) => MapEntry<String, dynamic>(k, v)),
        the3GKey: Map.from(the3G).map((k, v) => MapEntry<String, dynamic>(k, v)),
        lteKey: Map.from(lte).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  @override
  List<Object?> get props => [
        gsm900,
        gsm1800,
        the3G,
        lte,
      ];
}
