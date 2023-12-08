part of 'bottom_navigation_bloc.dart';

enum BottomNavigationItem {
  home,
  news,
  history,
  account,
}

class BottomNavigationState extends Equatable {
  final BottomNavigationItem bottomNavigationItem;
  final int index;

  const BottomNavigationState(
    this.bottomNavigationItem,
    this.index,
  );

  @override
  List<Object> get props => [bottomNavigationItem, index];
}
