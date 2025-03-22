import "dart:convert";
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                quote,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text("- $author", style: TextStyle(fontSize: 18))),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse('https://zenquotes.io/api/random');
                var response = await http.get(url);
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');
                var data = jsonDecode(response.body);
                print(data);

                setState(() {
                  
                  quote = data[0]["q"];
                  author = data[0]["a"];
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
