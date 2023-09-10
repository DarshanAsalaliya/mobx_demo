import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api_service/api_service.dart';
import '../../model/posts_model.dart';
import '../../routes/route_constant.dart';

class PostListScreen extends StatefulWidget {
  final String id;
  const PostListScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Lists'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'LogOut',
              onPressed: () {
                GoRouter.of(context).replaceNamed(AppRouteConstant.loginScreen);
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<List<Post>>(
            future: apiService.getPosts(int.parse(widget.id)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final posts = snapshot.data!;
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                              AppRouteConstant.postScreen,
                              pathParameters: {
                                'id': posts[index].userId.toString(),
                                'postId': posts[index].id.toString(),
                                'postTitle': posts[index].title
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(color: Colors.white),
                          width: double.infinity,
                          child: Center(child: Text(posts[index].body)),
                        ),
                      );
                    });
              }
            },
          ),
        ));
  }
}
