import "dart:convert";
import "package:flutter/material.dart";
import "package:quotesapp/screen/second_screen.dart";
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String qoute = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  title = "Apple";
                });
              },
              child: Text("Get qoute"),
            ),
          ],
        ),
      ),
    );
  }
}
