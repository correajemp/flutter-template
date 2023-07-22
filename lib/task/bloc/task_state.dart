part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  const TaskLoaded({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];
}

class TaskError extends TaskState {
  final String? message;
  const TaskError(this.message);
}
