import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitrecognition/api/api.dart';
import 'package:fruitrecognition/bloc/image_bloc.dart';
import 'package:fruitrecognition/bloc/image_event.dart';
import 'package:fruitrecognition/reco_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api()
        ),
      ], 
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ImageBloc()..add(ImageEventStarted())
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RecoPage(title: 'Ehe',),
        )
      )
    ); 

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'ViReco'),
    // );
  }
}



