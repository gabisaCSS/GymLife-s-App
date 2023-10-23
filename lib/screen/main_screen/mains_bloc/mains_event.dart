part of 'mains_bloc.dart';

sealed class MainsEvent extends Equatable {
  const MainsEvent();

  @override
  List<Object> get props => [];
}

final class ChangedBottomNavBarEvent extends MainsEvent {
  final int index;

  const ChangedBottomNavBarEvent({required this.index});

  @override
  List<Object> get props => [index];
}
