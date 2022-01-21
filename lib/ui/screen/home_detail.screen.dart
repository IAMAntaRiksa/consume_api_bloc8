import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_coding/bloc/bloc/detail_post_bloc.dart';

import 'package:test_coding/ui/screen/home_detail_view_screen.dart';

class ArgumentsDetail {
  final int id;
  final String title;
  ArgumentsDetail({
    required this.id,
    required this.title,
  });
}

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  final ArgumentsDetail args;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailPostBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: HomeDetailViewScreen(
          postId: args.id,
        ),
      ),
    );
  }
}
