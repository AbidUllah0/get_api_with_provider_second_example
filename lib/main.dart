import 'package:flutter/material.dart';
import 'package:get_api_class2/domain/photos_provider/photos_provider.dart';
import 'package:get_api_class2/presentation/screens/HomeScreen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PhotosProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Api Two Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
