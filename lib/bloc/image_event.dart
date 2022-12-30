
import 'dart:io';

import 'package:equatable/equatable.dart';

class ImageEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ImageEventStarted extends ImageEvent{
  @override
  List<Object?> get props => [];
}

class ImageEventUpload extends ImageEvent{
  final File selectedImage;

  ImageEventUpload(this.selectedImage);
  @override
  List<Object?> get props => [];
}