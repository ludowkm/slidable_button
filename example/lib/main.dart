import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

void main() {
  runApp(MaterialApp(home: SlidableButtonDemo()));
}

class SlidableButtonDemo extends StatefulWidget {
  const SlidableButtonDemo({Key? key}) : super(key: key);

  @override
  _SlidableButtonDemoState createState() => _SlidableButtonDemoState();
}

class _SlidableButtonDemoState extends State<SlidableButtonDemo> {
  String result = "Let's slide!";

  static const double _DEFAULT_HEIGHT = 60;
  static Color shadowColor = Colors.black.withOpacity(0.1);

  final ValueNotifier<bool> notifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable Button Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(onTap: () {
                notifier.value = false;
              }, child: Text('Slide this button to left or right.')),
              SizedBox(height: 16.0),
              HorizontalSlidableButton(
                  width: double.maxFinite,
                  height: _DEFAULT_HEIGHT,
                  notifier: notifier,
                  buttonWidth: _DEFAULT_HEIGHT - 8,
                  color: Colors.deepOrangeAccent,
                  progressColor: Colors.green,
                  buttonColor: Colors.white,
                  buttonShadow: [
                    BoxShadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: shadowColor),
                    BoxShadow(
                        offset: Offset(-2.0, -2.0),
                        blurRadius: 8.0,
                        color: shadowColor),
                    BoxShadow(
                        offset: Offset(0.0, 2.0),
                        blurRadius: 8.0,
                        color: shadowColor),
                    BoxShadow(
                        offset: Offset(0.0, -2.0),
                        blurRadius: 8.0,
                        color: shadowColor)
                  ],
                  completeSlideAt: 0.75,
                  borderRadius: BorderRadius.circular(12),
                  label: Icon(Icons.keyboard_arrow_right,
                      color: Colors.deepOrangeAccent),
                  doneLabel: Icon(Icons.check,
                      color: Colors.green),
                  doneChild: Center(
                    child: Text('Signed'),
                  ),
                  child: Center(
                    child: Text('Send \$200'),
                  ),
                  onChanged: (position) {
                    if (position != SlidableButtonPosition.end) return;
                    notifier.value = false;
                    notifier.value = true;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
