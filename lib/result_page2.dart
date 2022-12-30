import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitrecognition/bloc/image_bloc.dart';
import 'package:fruitrecognition/bloc/image_event.dart';
import 'package:fruitrecognition/bloc/image_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fruitrecognition/guide.dart';
import 'package:fruitrecognition/info.dart';

class ResultPage2 extends StatefulWidget {
  final File selectedImage;
  const ResultPage2({super.key, required this.selectedImage});

  @override
  State<ResultPage2> createState() => _ResultPage2State();
}

class _ResultPage2State extends State<ResultPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Result'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Info()));
              }, 
            icon: Icon(Icons.error)
          ),
          IconButton(
            onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Guide()));
            }, 
            icon: Icon(Icons.book)
          )
        ],
      ),
      body: BlocBuilder<ImageBloc, ImageState>(
                builder: (context, state) {
                  if(state is ImageStateLoading){
                    return  Center(
                      child:  SpinKitFadingCircle(
                        size: 65,
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index.isEven ? Colors.red : Colors.green,
                            ),
                          );
                        },
                  
                      )
                      );
                  }
                  if(state is ImageStateLoaded){
                    return SingleChildScrollView(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Card(
                            elevation: 8,
                            shadowColor: Colors.deepOrange,
                            margin: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                            shape:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.deepOrange, width: 1)
                            ),
                            child: ListTile(
                              title: Image.file(widget.selectedImage),
                            ),
                          ),
                        CardWidget(text: state.data.category!, colorShadow: Colors.blue, colorBoder: Colors.blue, ),
                        CardWidget(text: state.data.predicted!, colorShadow: Colors.green, colorBoder: Colors.green, ),
                        CardWidget(text: state.data.calor!, colorShadow: Colors.yellow, colorBoder: Colors.yellow, ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.blueGrey,
                                onSurface: Colors.orangeAccent,
                                side: BorderSide(color: Color.fromARGB(255, 0, 220, 228), width: 1),
                                elevation: 10,
                                minimumSize: Size(100, 50),
                                shadowColor: Color.fromARGB(255, 0, 220, 228),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed:() {
                              context.read<ImageBloc>().add(ImageEventStarted());
                              Navigator.pop(context);
                            },
                            child: const Text("Continue"),
                          ),
                        ),
                      CardWidget(text: state.data.con!, colorShadow: Colors.yellow, colorBoder: Colors.yellow, ),      
                      ],
                      ),
                    );
                  }
                return const Text("data");
                }
      ));
  }
}

class CardWidget extends StatelessWidget {
  final String text;
  final Color colorShadow; 
  final Color colorBoder; 
  const CardWidget({
    Key? key, required this.text, required this.colorShadow, required this.colorBoder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: colorShadow,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      shape:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorBoder, width: 1)
      ),
      child: ListTile(
        title: Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey,),),
      ),
    );
  }
}