import 'dart:convert';

import 'package:broadway_example_ui/mobile/mobile_model.dart';
import 'package:http/http.dart' as http;

class MobileService {
  Future<List<MobileModel>> getMobileData() async {
    final response = await http.get(
      Uri.parse("https://api.restful-api.dev/objects"),
    );
    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);

      final data = jsonData.map((e) => MobileModel.fromJson(e)).toList();
      // final data = jsonData.map((e) => MobileModel.fromJson(e)).toList();

      return data;
    } else {
      throw Exception("Error");
    }
  }
}
