part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoding extends HomePageState {}

class HomePageFetched extends HomePageState {
  final List<UserModel> userModelList;

  const HomePageFetched({required this.userModelList});
  @override
  List<Object> get props => [userModelList];
}

class HomePageFailed extends HomePageState {}
