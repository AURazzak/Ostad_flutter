import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
      if (count >= 5) {
        _showDialog();
      }
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Button pressed $count times"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Count:",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Updated font size and weight
                ),
                Text(
                  "$count",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), // Updated font size and weight
                ),
              ],
            ),
            SizedBox(height: 30), // Increased height
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementCount,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Updated padding
                    textStyle: TextStyle(fontSize: 24), // Updated font size
                  ),
                  child: Text("+"),
                ),
                SizedBox(width: 30), // Increased width
                ElevatedButton(
                  onPressed: decrementCount,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Updated padding
                    textStyle: TextStyle(fontSize: 24), // Updated font size
                  ),
                  child: Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}