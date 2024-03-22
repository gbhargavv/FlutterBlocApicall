import 'package:flutter/material.dart';
import 'package:flutter_bloc_apicall/screens/users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UsersScreen();
                }));
              },
              child: const Text('Get Users',
                  style: TextStyle(
                    fontSize: 22,
                  )))
        ])));
  }
}
