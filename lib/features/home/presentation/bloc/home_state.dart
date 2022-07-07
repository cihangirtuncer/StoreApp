part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeFailed extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Products>? products;
  const HomeLoaded({this.products});
  @override
  List<Object?> get props => [products];
}
