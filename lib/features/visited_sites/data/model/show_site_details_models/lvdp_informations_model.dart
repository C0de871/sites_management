import 'package:equatable/equatable.dart';

class LvdpInformationsModel extends Equatable {
  const LvdpInformationsModel({
    required this.exiting,
    required this.working,
    required this.status,
    required this.remarks,
  });

  final int? exiting;
  static const String exitingKey = "exiting";

  final int? working;
  static const String workingKey = "working";

  final String? status;
  static const String statusKey = "status";

  final String? remarks;
  static const String remarksKey = "remarks";

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
