import 'package:book_app/bloc/home_page_bloc.dart';
import 'package:book_app/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc _homePageBloc;

  @override
  void initState() {
    _homePageBloc = BlocProvider.of<HomePageBloc>(context);
    _homePageBloc.add(FetchUserData());
    super.initState();
  }

  @override
  void dispose() {
    _homePageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Books App Internship Assignment",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageLoding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomePageFailed) {
            return const Center(
              child: Text("Something gone wrong!!"),
            );
          } else if (state is HomePageInitial) {
            return const SizedBox.shrink();
          }

          final curState = state as HomePageFetched;
          final List<UserModel> userModelList = curState.userModelList;

          return ListView.builder(
            itemCount: userModelList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userModelList[index].name),
                subtitle: Text(userModelList[index].company),
              );
            },
          );
        },
      ),
    );
  }
}
