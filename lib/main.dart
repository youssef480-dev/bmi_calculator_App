import 'package:bmi_caculator/bmi_screen.dart';
import 'package:bmi_caculator/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
   return MaterialApp(
  debugShowCheckedModeBanner: false,
    home: BlocProvider(create: (context) => BmiCubit(), 
    child: BmiScreen()),
   );
  }

}