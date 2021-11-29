import 'package:bloc/bloc.dart';
import 'package:book_app/data/api_client.dart';
import 'package:book_app/data/user_model_list.dart';
import 'package:book_app/user_model.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final APIClinet _apiClinet;

  HomePageBloc(this._apiClinet) : super(HomePageInitial()) {
    on<FetchUserData>((event, emit) async {
      emit(HomePageLoding());

      // need to call api
      const String url =
          "https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6";

      try {
        final UserModelList usermodelList = await _apiClinet.get(url);
        emit(HomePageFetched(userModelList: usermodelList.userModelList));
      } on Exception {
        emit(HomePageFailed());
      }
    });
  }
}
