import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proof_of_concept_maps_and_notifications/blocs/blocs.dart';
import 'package:proof_of_concept_maps_and_notifications/screens/gps_access_screen.dart';
import 'package:proof_of_concept_maps_and_notifications/screens/map_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: ((context, state) {
        return state.isAllGranted ? const MapScreen() : const GpsAccessScreen();
      }),
    ));
  }
}
