part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationChange extends BottomNavigationEvent {
  final int index;

  const BottomNavigationChange({required this.index});

  @override
  List<Object> get props => [];
}
