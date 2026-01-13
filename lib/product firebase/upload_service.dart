import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadService {
  File? image;
  String? imageUrl;
  String uploadPreset = 'abcdef';
  String cloudName = 'dndihenwf';
  Future<String?> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      image = File(picked.path);

      if (image != null) {
        uploadImage();
      }
    }
    return imageUrl;
  }

  Future uploadImage() async {
    // if(!image==null)return;
    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
    );
    var request = http.MultipartRequest("POST", url);
    request.fields['upload_preset'] = uploadPreset;
    request.files.add(await http.MultipartFile.fromPath('file', image!.path));
    var response = await request.send();
    var res = await http.Response.fromStream(response);
    var data = jsonDecode(res.body);

    imageUrl = data['secure_url'];
  }
}
