part of 'bmi_cubit.dart';


sealed class BmiState {}

final class BmiIntial extends BmiState {}
final class selectGender extends BmiState {}
final class printHeight extends BmiState {}
final class setWeight extends BmiState {}
final class setAge extends BmiState {}
