import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proof_of_concept_maps_and_notifications/blocs/gps/gps_bloc.dart';
import 'package:proof_of_concept_maps_and_notifications/screens/screens.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => GpsBloc())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maps  App',
        // home: LoadingScreen());
        home: GpsAccessScreen());
  }
}
