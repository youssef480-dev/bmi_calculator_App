import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:bmi_caculator/bmi_screen.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiIntial());

void maleGender(SexType type){

 emit(selectGender());
}
void femaleGender(SexType type){

 emit(selectGender());

}

void showHeight(double height ,double value){


  emit(printHeight());
}
void incWeight(double weight){

  emit(setWeight());
}

void decWeight(double weight){

  emit(setWeight());
  }

  void incAge(double Age){

  emit(setAge());
}

void decAge(double Age){

  emit(setAge());
  }

}