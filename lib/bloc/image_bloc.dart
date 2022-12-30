
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitrecognition/api/api.dart';
import 'package:fruitrecognition/bloc/image_event.dart';
import 'package:fruitrecognition/bloc/image_state.dart';

import '../model/data.dart';

class ImageBloc extends Bloc<ImageEvent,ImageState>{
  ImageBloc() :super(ImageStateLoading()){
    on<ImageEventStarted>(_onStarted);
    on<ImageEventUpload>(_onUpdate);
  }
  _onStarted(ImageEventStarted imageEventStarted, Emitter<ImageState> emitter) async{
     emitter(ImageStateLoading());
  }
  _onUpdate(ImageEventUpload imageEventUpload, Emitter<ImageState> emitter) async{
    Api api = Api();
    Data data = await api.updateImage(imageEventUpload.selectedImage);
    emitter(ImageStateLoaded(data));
  }
  
}