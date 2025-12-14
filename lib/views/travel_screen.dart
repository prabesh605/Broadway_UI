import 'package:flutter/material.dart';

class DestinationModel {
  final Widget widget;
  final String name;
  DestinationModel({required this.widget, required this.name});
}

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  List<DestinationModel> destinationImage = [
    DestinationModel(
      widget: Image.asset("assets/image1.jpg", height: 220),
      name: "China",
    ),
    DestinationModel(
      widget: Image.asset("assets/image2.jpg", height: 220),
      name: "India",
    ),
    DestinationModel(
      widget: Image.asset("assets/image3.jpg", height: 220),
      name: "Nepal",
    ),
    DestinationModel(
      widget: Image.asset("assets/image1.jpg", height: 220),
      name: "Bhutan",
    ),

    DestinationModel(
      widget: Image.asset("assets/image2.jpg", height: 220),
      name: "Japan",
    ),

    DestinationModel(
      widget: Image.asset("assets/image3.jpg", height: 220),
      name: "Uk",
    ),
    DestinationModel(
      widget: Image.asset("assets/image1.jpg", height: 220),
      name: "china",
    ),
    DestinationModel(
      widget: Image.asset("assets/image2.jpg", height: 220),
      name: "China",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travel")),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade100,
        child: ListView(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
                backgroundColor: Colors.green,
                radius: 60,
              ),
            ),
            // ListTile()
            // Row(
            //   children: [
            //     Icon(Icons.home),
            //     SizedBox(width: 10),
            //     Text(
            //       "Home",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.card_travel),
              title: Text(
                "Destination",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text(
                "Booking",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Travel Destination",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                // border: Border.all(),
                // borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: destinationImage.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final DestinationModel destination = destinationImage[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        destination.widget,
                        Text(
                          destination.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                // children: [
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset("assets/image1.jpg", height: 220),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset("assets/image2.jpg", height: 220),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset("assets/image3.jpg", height: 220),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset("assets/image1.jpg", height: 220),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset("assets/image2.jpg", height: 220),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset("assets/image3.jpg", height: 220),
                //   ),
                //   // Image.asset("assets/image1.jpg", height: 220),
                //   // Image.asset("assets/image2.jpg", height: 220),
                //   // Image.asset("assets/image3.jpg", height: 220),
                //   // Image.asset("assets/image1.jpg", height: 220),
                // ],
              ),
            ),
            Text(
              "Popular Destination",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              // height: 1000,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/image1.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/image2.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/image3.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/image1.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/image2.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/image3.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
