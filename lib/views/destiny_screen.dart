import 'package:broadway_example_ui/brains/story_brain.dart';
import 'package:flutter/material.dart';

class DestinyScreen extends StatefulWidget {
  const DestinyScreen({super.key});

  @override
  State<DestinyScreen> createState() => _DestinyScreenState();
}

class _DestinyScreenState extends State<DestinyScreen> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Destiny App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/story.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // border: Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  storyBrain.getStory(),

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    storyBrain.nextStory(1);
                  });

                  print(storyBrain.storyNumber);
                },
                child: Text(
                  storyBrain.getChoice1(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(height: 10),
              Visibility(
                // visible: false,
                visible: storyBrain.isButtonVisible(),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(2);
                    });

                    print(storyBrain.storyNumber);
                  },
                  child: Text(
                    storyBrain.getChoice2(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Visibility(
                visible: storyBrain.isButtonVisible(),

                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.restart();
                    });
                  },
                  child: Text("Restart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
