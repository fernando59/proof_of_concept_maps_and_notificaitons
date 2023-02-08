import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            print('$state');
            return !state.isGpsEnable
                ? const _EnableGpsMessage()
                : const _AcessButton();
          },
        ),
      ),
    );
  }
}

class _AcessButton extends StatelessWidget {
  const _AcessButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Is necesary access to GPS'),
        MaterialButton(
          onPressed: () {},
          child: const Text(
            'Request Acess',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
          elevation: 0,
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'You have enable the GPS',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
    );
  }
}
