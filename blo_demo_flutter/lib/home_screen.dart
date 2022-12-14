import 'package:blo_demo_flutter/bloc/internet_bloc.dart';
import 'package:blo_demo_flutter/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<InternetBloc,InternetState>(
            builder: ( context, state) {
              if(state is InternetGainedState){
                return const Text('Connected!');
              } else if(state is InternetLostState){
                return const Text('Not Connected!');
              } else if (state is InternetInitialState){
                return const Text('Loading....');
              }
              return const Text('Nothing... here... to show....');
            },
          ),
        ),
      ),
    );
  }
}
