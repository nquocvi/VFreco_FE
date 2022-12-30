import 'package:equatable/equatable.dart';
import 'package:fruitrecognition/model/data.dart';

class ImageState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ImageStateLoading extends ImageState{
  @override
  List<Object?> get props => [];
}

class ImageStateLoaded extends ImageState{
  final Data data;

  ImageStateLoaded(this.data);
  @override
  List<Object?> get props => [];
}