import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitrecognition/bloc/image_bloc.dart';
import 'package:fruitrecognition/bloc/image_event.dart';
import 'package:fruitrecognition/bloc/image_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Guide extends StatefulWidget {
  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Guide'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              
            }, 
            icon: Icon(Icons.error)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.book)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            RichText(
                text: const TextSpan(
                  text: '       ',
                  style: TextStyle(color: Color.fromARGB(255, 179, 187, 19)),
                  children: <TextSpan>[
                    TextSpan(text: 'Step 1: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.green)),
                    TextSpan( style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),text: 'You select a photo from the camera by clicking the button " Select a photo from the Camera" or the album by clicking the button " Select a photo from the Album"'),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              RichText(
                text: const TextSpan(
                  text: '       ',
                  style: TextStyle(color: Color.fromARGB(255, 179, 187, 19)),
                  children: <TextSpan>[
                    TextSpan(text: 'Step 2:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.green)),
                    TextSpan( style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),text: ' You click the Scan button'),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              RichText(
                text: const TextSpan(
                  text: '       ',
                  style: TextStyle(color: Color.fromARGB(255, 179, 187, 19)),
                  children: <TextSpan>[
                    TextSpan(text: 'Step 3: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.green)),
                    TextSpan( style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),text: 'Wait and enjoy the result'),
                  ],
                ),
              ),
              
          ],
        ),
      ));
  }
}
