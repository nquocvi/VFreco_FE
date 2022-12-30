import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/data.dart';

class Api{

  Future<Data> updateImage(File selectedImage) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.1.9:5000/upload-image"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    Data data = Data.fromJson(jsonDecode(response.body));
    if(response.statusCode==200){
      return data;
    }
    return Data();
  }
}