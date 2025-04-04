import 'package:equatable/equatable.dart';

class LvdpInformationsEntity extends Equatable {
  const LvdpInformationsEntity({
    required this.exiting,
    required this.working,
    required this.status,
    required this.remarks,
  });

  final int? exiting;
  final int? working;
  final String? status;
  final String? remarks;

  LvdpInformationsEntity copyWith({
    int? exiting,
    int? working,
    String? status,
    String? remarks,
  }) {
    return LvdpInformationsEntity(
      exiting: exiting ?? this.exiting,
      working: working ?? this.working,
      status: status ?? this.status,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props => [
        exiting,
        working,
        status,
        remarks,
      ];
}
