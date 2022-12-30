
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitrecognition/bloc/image_bloc.dart';
import 'package:fruitrecognition/bloc/image_event.dart';
import 'package:fruitrecognition/bloc/image_state.dart';
import 'package:fruitrecognition/guide.dart';
import 'package:fruitrecognition/info.dart';
import 'package:fruitrecognition/result_page2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class RecoPage extends StatefulWidget {
  const RecoPage({super.key, required this.title});

  final String title;

  @override
  State<RecoPage> createState() => _RecoPageState();
}

class _RecoPageState extends State<RecoPage> {
  File? selectedImage;

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if(image==null){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Please select a photo to scan"),
                                    backgroundColor: Color.fromARGB(255, 237, 22, 90)
                                  ));
      }
      else{
        selectedImage = File(image.path);
        }
    });
  }

  void getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 800,
      maxWidth: 800,
      imageQuality:90
      );
      setState(() {
        if(pickedFile==null){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Please select a photo to scan"),
                                    backgroundColor: Color.fromARGB(255, 237, 22, 90)
                                  ));
        }
        else{
          selectedImage = File(pickedFile.path);
        }
    });
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VFreco'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            selectedImage == null
                ? Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 50),
                  child: const Text(
                      'Please select a photo to scan',
                    ),
                )
                : 
                Card(
                    elevation: 8,
                    shadowColor: Colors.deepOrange,
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                    shape:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 0, 220, 228), width: 1)
                    ),
                    child: ListTile(
                      title: Image.file(selectedImage!),
                    ),
                  ),
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
                      onPressed: getFromCamera,
                      child: const Text("Select a photo from the Camera"),
                    ),
                  ), 
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
                      onPressed: getImage,
                      child: const Text("Select a photo from the Album"),
                    ),
                  ),           
             BlocBuilder<ImageBloc, ImageState>(
                builder: (context, state) {
                  return 
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
                            onPressed: (){
                              if(selectedImage == null){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Please select a photo to scan"),
                                  backgroundColor: Color.fromARGB(255, 237, 22, 90)
                                ));
                                
                              }
                              else{
                                  context.read<ImageBloc>().add(
                                                ImageEventUpload(selectedImage!));
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  ResultPage2(selectedImage: selectedImage!,)));
                              }      
                            },
                            child: const Text("Scan"),
                          ),
                        );       
              }
              ),
      
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: getImage,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add_a_photo),
      // ),
      
    );
  }
}