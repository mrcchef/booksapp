import 'package:book_app/bloc/home_page_bloc.dart';
import 'package:book_app/data/api_client.dart';
import 'package:book_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Client _client = Client();
    APIClinet apiClient = APIClinet(_client);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomePageBloc>(
        create: (context) => HomePageBloc(apiClient),
        child: HomePage(),
      ),
    );
  }
}
