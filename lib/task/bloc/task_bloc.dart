// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:fluttertemplate/models/task/task.dart';
import 'package:fluttertemplate/repositories/task/task_repository.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  TaskBloc(this._taskRepository) : super(const TaskLoaded()) {
    on<LoadTask>(_onLoadTask);
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }

  Future<void> _onLoadTask(LoadTask event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = await _taskRepository.getTask();
      emit(TaskLoaded(tasks: tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    if (state is TaskLoaded) {
      emit(TaskLoaded(tasks: List.from(state.tasks)..add(event.task)));
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    if (state is TaskLoaded) {
      List<Task> tasks = state.tasks.where((task) {
        return task.id != event.task.id;
      }).toList();
      emit(TaskLoaded(tasks: tasks));
    }
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    if (state is TaskLoaded) {
      List<Task> tasks = (state.tasks.map((task) {
        return task.id == event.task.id ? event.task : task;
      })).toList();
      emit(TaskLoaded(tasks: tasks));
    }
  }
}
