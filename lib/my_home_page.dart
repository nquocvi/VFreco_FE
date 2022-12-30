import 'dart:convert';
import 'dart:io';
import 'package:fruitrecognition/result_page.dart';
import 'package:fruitrecognition/model/data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? selectedImage;
  
  onUploadImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.1.103:5000/upload-image"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: selectedImage!.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    Data data = Data.fromJson(jsonDecode(response.body));

    if(response.statusCode==200){
      print(data.predicted);
      // ignore: use_build_context_synchronously
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(data: data)),
  );
    }
  }

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  void getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,);
      setState(() {
      selectedImage = File(pickedFile!.path);
    });
    
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage == null
                ? const Text(
                    'Please Pick a image to Upload',
                  )
                : SizedBox(width: 250,
                height: 250,child: Image.file(selectedImage!),
                ),
            ElevatedButton(
              //color: Colors.green[300],
              onPressed: getFromCamera,
              child: const Text(
                "Get From Camera",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              //color: Colors.green[300],
              onPressed: onUploadImage,
              child: const Text(
                "Scan",
                style: TextStyle(color: Colors.white),
              ),
            ),
            //Text(resJson['message'])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add_a_photo),
      ),
      
    );
  }
}