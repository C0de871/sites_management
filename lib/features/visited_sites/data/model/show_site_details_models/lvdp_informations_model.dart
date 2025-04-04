import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/lvdp_informations_entity.dart';

class LvdpInformationsModel extends LvdpInformationsEntity {
  const LvdpInformationsModel({
    required super.exiting,
    required super.working,
    required super.status,
    required super.remarks,
  });

  static const String exitingKey = "exiting";

  static const String workingKey = "working";

  static const String statusKey = "status";

  static const String remarksKey = "remarks";

  @override
  LvdpInformationsModel copyWith({
    int? exiting,
    int? working,
    String? status,
    String? remarks,
  }) {
    return LvdpInformationsModel(
      exiting: exiting ?? this.exiting,
      working: working ?? this.working,
      status: status ?? this.status,
      remarks: remarks ?? this.remarks,
    );
  }

  factory LvdpInformationsModel.fromJson(Map<String, dynamic> json) {
    return LvdpInformationsModel(
      exiting: json[exitingKey],
      working: json[workingKey],
      status: json[statusKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        exitingKey: exiting,
        workingKey: working,
        statusKey: status,
        remarksKey: remarks,
      };

  @override
  List<Object?> get props => [
        exiting,
        working,
        status,
        remarks,
      ];
}
