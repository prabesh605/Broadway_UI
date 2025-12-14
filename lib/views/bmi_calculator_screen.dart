import 'package:broadway_example_ui/brains/bmi_calcutor.dart';
import 'package:broadway_example_ui/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// const kInactiveColor = Color(0xff111328);
// const kActiveColor = Color(0xff1d1e33);
enum Gender { male, female }

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  BmiCalcutor bmiCalcutor = BmiCalcutor();
  double height = 120;
  int weight = 60;
  int age = 12;
  Gender? selectedGender;
  bool isMale = false;
  bool isFemale = false;

  final Color activeColor = Color(0xff1d1e33);
  final Color inactiveColor = Color(0xff111328);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e21),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("BMI CALCULATOR", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomWidget(
                      icon: FontAwesomeIcons.mars,
                      name: 'Male',

                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                          // isMale = !isMale;
                        });

                        print("Male is clicked");
                      },
                      color: selectedGender == Gender.male
                          ? activeColor
                          : inactiveColor,
                      // color: isMale ? Colors.red : Colors.green,
                    ),
                    SizedBox(width: 10),
                    CustomWidget(
                      icon: FontAwesomeIcons.venus,
                      name: 'Female',
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                          // isFemale = !isFemale;
                        });

                        print("Female is clicked");
                      },

                      color: selectedGender == Gender.female
                          ? activeColor
                          : inactiveColor,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff1d1e33),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toStringAsFixed(0),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("cm", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context),
                        child: Slider(
                          min: 10,
                          max: 180,
                          value: height.toDouble(),
                          onChanged: (value) {
                            // print(value);
                            setState(() {
                              height = value.toDouble();
                            });
                          },
                        ),
                      ),
                      // Text("slider", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    IncrementDecrementWidget(
                      name: 'WEIGHT',
                      value: '$weight',
                      onPressedPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                      onPressedMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                    SizedBox(width: 20),
                    IncrementDecrementWidget(
                      name: 'AGE',
                      value: '$age',
                      onPressedPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                      onPressedMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    final bmi = bmiCalcutor.bmiCalculator(
                      weight.toDouble(),
                      height,
                    );
                    final result = bmiCalcutor.getResult();
                    final respone = bmiCalcutor.getResponse();
                    print(bmi);
                    print(result);
                    print(respone);

                    final value = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          bmi: bmi,
                          result: result,
                          response: respone,
                          age: age,
                          selectedGender: selectedGender ?? Gender.female,
                        ),
                      ),
                    );
                    if (value == true) {
                      setState(() {
                        height = 120;
                        weight = 60;
                        age = 12;
                      });
                    }
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IncrementDecrementWidget extends StatelessWidget {
  const IncrementDecrementWidget({
    super.key,
    required this.name,
    required this.value,
    required this.onPressedPlus,
    required this.onPressedMinus,
  });
  final String name;
  final String value;
  final VoidCallback onPressedPlus;
  final VoidCallback onPressedMinus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 250,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xff1d1e33),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: onPressedMinus,
                  icon: Icon(Icons.remove, size: 40, color: Colors.white),
                ),
                SizedBox(width: 20),
                IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: onPressedPlus,
                  icon: Icon(Icons.add, size: 40, color: Colors.white),
                ),
              ],
            ),
          ],
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
    required this.onTap,

    required this.color,
  });
  final IconData icon;
  final String name;
  final VoidCallback onTap;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            // color: isClick ? Color(0xff111328) : Color(0xff1d1e33),
            borderRadius: BorderRadius.circular(12),
          ),

          height: 200,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 100, color: Colors.white),
              SizedBox(height: 20),
              Text(name, style: TextStyle(fontSize: 18, color: Colors.white)),
            ],
          ), //venus
        ),
      ),
    );
  }
}
