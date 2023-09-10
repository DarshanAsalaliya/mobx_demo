import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api_service/api_service.dart';
import '../../routes/route_constant.dart';

class PostScreen extends StatefulWidget {
  final String id;
  final String postId;
  final String postTitle;
  const PostScreen(
      {Key? key,
      required this.postId,
      required this.postTitle,
      required this.id})
      : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  ApiService apiService = ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (GoRouter.of(context).canPop()) {
                context.pop();
              } else {
                GoRouter.of(context).replaceNamed(
                    AppRouteConstant.postListScreen,
                    pathParameters: {'id': widget.id});
              }
            },
          ),
          title: const Text('Post'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                widget.postTitle,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Comments'),
              Expanded(
                  child: FutureBuilder(
                      future:
                          apiService.getPostComment(int.parse(widget.postId)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final comments = snapshot.data!;

                          return ListView.builder(
                              itemCount: comments.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black26,
                                              width: 0.5))),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            'https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/short/linkedin-profile-picture-maker/dummy_image/thumb/004.webp'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              comments[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              comments[index].email,
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(comments[index].body)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        }
                      }))
            ],
          ),
        ));
  }
}
