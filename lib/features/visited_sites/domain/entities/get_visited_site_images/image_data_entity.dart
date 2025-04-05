import 'package:equatable/equatable.dart';

class ImageDataEntity extends Equatable {
  const ImageDataEntity({
    required this.id,
    required this.url,
  });

  final int? id;
  final String? url;

  ImageDataEntity copyWith({
    int? id,
    String? url,
  }) {
    return ImageDataEntity(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [
        id,
        url,
      ];
}
