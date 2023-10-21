part of 'mains_bloc.dart';

sealed class MainsEvent extends Equatable {
  const MainsEvent();

  @override
  List<Object> get props => [];
}

final class ChangedBottomNavBar extends MainsEvent {
  final int index;

  const ChangedBottomNavBar({required this.index});

  @override
  List<Object> get props => [index];
}
