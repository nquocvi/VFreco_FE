import 'package:flutter/material.dart';
import 'package:fruitrecognition/model/data.dart';

class ResultPage extends StatefulWidget {
  final Data data;
  const ResultPage({super.key, required this.data});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ket qua'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(widget.data.category.toString()),),
          Center(child: Text(widget.data.predicted.toString()),),
          Center(child: Text(widget.data.calor.toString()),),
        ],
      )
      );
  }
}