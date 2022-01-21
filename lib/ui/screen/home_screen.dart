import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_coding/bloc/list_post_bloc.dart';
import 'package:test_coding/model/post.dart';
import 'package:test_coding/ui/widget/home_card_widget.dart';
import 'package:test_coding/ui/widget/widget_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Coding'),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<ListPostBloc>().add(FetchListPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListPostBloc, ListPostState>(
      builder: (context, state) {
        if (state is ListPostLoading) {
          return WidgetState.loadig(context);
        } else if (state is ListPostLoadingError) {
          return WidgetState.loadigError(context);
        } else if (state is ListPostLoadingEmpaty) {
          return WidgetState.empatyState(context);
        } else if (state is ListPostLoadingSuccess) {
          return PostListItem(itemPost: state.posts);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class PostListItem extends StatelessWidget {
  const PostListItem({
    Key? key,
    required this.itemPost,
  }) : super(key: key);
  final List<Post>? itemPost;
  @override
  Widget build(BuildContext context) {
    return HomeCardWidget(itemPost: itemPost);
  }
}
