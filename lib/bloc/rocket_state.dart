part of 'rocket_bloc.dart';

@immutable
abstract class RocketState {}

class RocketInitial extends RocketState {}
class RocketLoading extends RocketState {}
class RocketLoaded extends RocketState {}
class RocketError extends RocketState{}

