
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          throw Exception('Error occured');
        },
        child: const Text('Verify Sentry Setup'),
      )),
    );
  }
}
