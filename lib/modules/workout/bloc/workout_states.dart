import 'package:equatable/equatable.dart';
import 'package:flutter_application/modules/workout/model/workout.dart';

sealed class WorkoutStates extends Equatable {
  const WorkoutStates();

  @override
  List<Object> get props => [];
}

class WorkoutInitialState extends WorkoutStates {}

class WorkoutLoading extends WorkoutStates {}

class WorkoutLoaded extends WorkoutStates {
  final List<Workout> workouts;

  const WorkoutLoaded(this.workouts);
}

class WorkoutError extends WorkoutStates {
  final String message;

  const WorkoutError(this.message);
}
