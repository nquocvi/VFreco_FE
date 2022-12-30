import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitrecognition/bloc/image_bloc.dart';
import 'package:fruitrecognition/bloc/image_event.dart';
import 'package:fruitrecognition/bloc/image_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Info'),
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
                    TextSpan(text: 'VFreco app', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.green)),
                    TextSpan( style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),text: '- is the machine learning based mobile application, powered by artificial intelligence, that could recognize the fruits and vegetables and classify them by color, type, etc.!'),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              RichText(
                text: const TextSpan(
                  text: '       ',
                  style: TextStyle(color: Color.fromARGB(255, 179, 187, 19)),
                  children: <TextSpan>[
                    TextSpan( style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),text: 'This application'),
                    TextSpan(text: ' VFreco', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.green)),
                    TextSpan( style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),text: ' ideally fits for dieters, athletes or those who want to include more fruits into their daily meal.'),
                  ],
                ),
              ),
          ],
        ),
      ));
  }
}
