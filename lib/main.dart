import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/bloc/photo_bloc.dart';
import 'package:wallpaper_app/bloc/wallpaper_list_bloc/wallpaper_list_bloc.dart';
import 'package:wallpaper_app/pages/splash_page/splash_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotoBloc(apiHelper: ApiHelper()),
        ),
        BlocProvider(
          create: (context) => WallpaperListBloc(apiHelper: ApiHelper()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: SplashScreen(),
    );
  }
}
