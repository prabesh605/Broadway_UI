import 'package:broadway_example_ui/brains/bank_account.dart';
import 'package:broadway_example_ui/views/bank_screen.dart';
import 'package:broadway_example_ui/views/dice_screen.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BankAccount bankAccount = BankAccount("Prabesh", 1000);

    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Profile")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                SizedBox(height: 40),
                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Design better Ui design",
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
                SizedBox(height: 60),
                CustomWidget(
                  widget: Icon(Icons.person, color: Colors.white),
                  icon: Icons.person,
                  name: 'Prabesh Bhattarai',
                ),
                SizedBox(height: 20),
                CustomWidget(
                  widget: Icon(Icons.email, color: Colors.white),
                  icon: Icons.email,
                  name: 'Prabesh@gmail.com',
                ),
                SizedBox(height: 20),
                CustomWidget(
                  widget: Icon(Icons.phone, color: Colors.white),
                  icon: Icons.phone,
                  name: '986273635',
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BankScreen()),
                    );
                  },
                  child: Text("Next Screen"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiceScreen()),
                    );
                  },
                  child: Text("Dice"),
                ),
                // Container(
                //   height: 60,
                //   width: double.infinity,
                //   margin: EdgeInsets.all(10),
                //   padding: EdgeInsets.only(left: 10),
                //   decoration: BoxDecoration(
                //     border: Border.all(),
                //     borderRadius: BorderRadius.circular(12),
                //     color: Colors.blue,
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(Icons.email, color: Colors.white),
                //       SizedBox(width: 40),
                //       Text(
                //         "Prabesh@gmail.com",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    required this.icon,
    required this.name,
    required this.widget,
  });
  final IconData icon;
  final String name;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget,
            // Icon(icon, color: Colors.white),
            SizedBox(width: 40),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  

//stateless 
//statefull


// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   return runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.red,
//         appBar: AppBar(
//           title: Text('Dicee'),
//           backgroundColor: Colors.red,
//         ),
//         body: DicePage(),
//       ),
//     ),
//   );
// }

// class DicePage extends StatefulWidget {
//   @override
//   _DicePageState createState() => _DicePageState();
// }

// class _DicePageState extends State<DicePage> {
//   int leftDiceNumber = 1;
//   int rightDiceNumber = 1;

//   void changeDiceFace() {
//     setState(() {
//       leftDiceNumber = Random().nextInt(6) + 1;
//       rightDiceNumber = Random().nextInt(6) + 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: FlatButton(
//               child: Image.asset(
//                 'images/dice$leftDiceNumber.png',
//               ),
//               onPressed: () {
//                 changeDiceFace();
//               },
//             ),
//           ),
//           //Get students to create the second die as a challenge
//           Expanded(
//             child: FlatButton(
//               child: Image.asset(
//                 'images/dice$rightDiceNumber.png',
//               ),
//               onPressed: () {
//                 changeDiceFace();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }