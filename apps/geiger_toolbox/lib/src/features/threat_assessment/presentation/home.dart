import 'package:flutter/material.dart';

//home screen
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text("scann"),
        ),
        const Text("home"),
      ],
    );
  }
}
