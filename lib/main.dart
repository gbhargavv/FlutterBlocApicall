import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_apicall/bloc/user_bloc.dart';
import 'package:flutter_bloc_apicall/repo/users_repo.dart';
import 'package:flutter_bloc_apicall/screens/home_screen.dart';

void main() {
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(
      create: (context) => UsersRepo(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}