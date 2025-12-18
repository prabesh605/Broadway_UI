import 'package:broadway_example_ui/mobile/mobile_model.dart';
import 'package:broadway_example_ui/mobile/mobile_service.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  MobileService service = MobileService();
  List<MobileModel> mobile = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile Page")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final data = await service.getMobileData();
              setState(() {
                mobile = data;
              });
            },
            child: Text("Get Data"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mobile.length,
              itemBuilder: (context, index) {
                final mobileData = mobile[index];
                return ListTile(
                  title: Text(mobileData.name),
                  subtitle: Text("${mobileData.data?.dataPrice}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
