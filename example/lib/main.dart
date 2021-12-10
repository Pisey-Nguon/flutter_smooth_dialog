import 'package:flutter/material.dart';
import 'package:smooth_dialog/smooth_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SmoothDialog smoothDialog;

  @override
  void initState() {
    super.initState();
    smoothDialog = SmoothDialog(context);
  }

  void _showDialog() {
    smoothDialog
        .setTitleHeader("this is the header dialog")
        .setDescription("This is description")
        .setTitlePositive("Confirm")
        .setTitleNegative("Cancel")
        .showDialog();
  }

  void _hideDialog() {
    smoothDialog.dismissDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                _showDialog();
              },
              child: const Text(
                "Show",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
