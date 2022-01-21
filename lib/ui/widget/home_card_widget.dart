import 'package:flutter/material.dart';
import 'package:test_coding/model/post.dart';
import 'package:test_coding/ui/screen/home_detail.screen.dart';
import 'package:test_coding/ui/screen/home_detail_view_screen.dart';
import 'package:test_coding/ui/screen/home_screen.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    Key? key,
    required this.itemPost,
  }) : super(key: key);

  final List<Post>? itemPost;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemPost?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeDetailScreen(
                    args: ArgumentsDetail(
                        id: itemPost?[index].id ?? 0,
                        title: itemPost?[index].title ?? ''),
                  );
                },
              ),
            );
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${itemPost?[index].id}'),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${itemPost?[index].title}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Text('${itemPost?[index].body}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
