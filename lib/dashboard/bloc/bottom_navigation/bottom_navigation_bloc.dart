import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(const BottomNavigationState(BottomNavigationItem.home, 0)) {
    on<BottomNavigationChange>(_onBottomNavigationChange);
  }

  Future<void> _onBottomNavigationChange(event, emit) async {
    if (event.index == 0) {
      return emit(BottomNavigationState(
        BottomNavigationItem.home,
        event.index,
      ));
    }
    if (event.index == 1) {
      return emit(BottomNavigationState(
        BottomNavigationItem.news,
        event.index,
      ));
    }
    if (event.index == 2) {
      return emit(BottomNavigationState(
        BottomNavigationItem.history,
        event.index,
      ));
    }
    if (event.index == 3) {
      return emit(BottomNavigationState(
        BottomNavigationItem.account,
        event.index,
      ));
    }
    return emit(BottomNavigationState(
      BottomNavigationItem.home,
      event.index,
    ));
  }
}
