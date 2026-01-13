import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? image;
  String? imageUrl;
  String uploadPreset = 'abcdef';
  String cloudName = 'dndihenwf';
  Future pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
      if (image != null) {
        uploadImage();
      }
    }
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
    setState(() {
      imageUrl = data['secure_url'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageUrl != null
                ? SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(imageUrl ?? "", fit: BoxFit.contain),
                  )
                : Container(),
            ElevatedButton(
              onPressed: () {
                pickImage();
              },
              child: Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
