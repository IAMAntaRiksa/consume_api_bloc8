import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_coding/bloc/bloc/detail_post_bloc.dart';
import 'package:test_coding/ui/widget/widget_state.dart';

class HomeDetailViewScreen extends StatefulWidget {
  const HomeDetailViewScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);
  final int postId;

  @override
  State<HomeDetailViewScreen> createState() => _HomeDetailViewScreenState();
}

class _HomeDetailViewScreenState extends State<HomeDetailViewScreen> {
  @override
  void initState() {
    context.read<DetailPostBloc>().add(DetailPost(id: widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailPostBloc, DetailPostState>(
      builder: (context, state) {
        if (state is DetailPostLoading) {
          return WidgetState.loadig(context);
        } else if (state is DetailPostError) {
          return WidgetState.loadigError(context);
        } else if (state is DetailPostEmpatyState) {
          return WidgetState.empatyState(context);
        } else if (state is DetailPostSuccess) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.posts.body,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
