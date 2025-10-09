import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class ImageStorageState extends Equatable {
  const ImageStorageState();

  @override
  List<Object?> get props => [];
}

final class ImageStorageInitial extends ImageStorageState {}

class ImageLoaded extends ImageStorageState {
  final File image;
  const ImageLoaded(this.image);

  @override
  List<Object?> get props => [image];
}
