import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api_service/api_service.dart';
import '../../model/photos_model.dart';
import '../../routes/route_constant.dart';

class AlbumPhotoScreen extends StatefulWidget {
  final String id;
  final String albumId;
  const AlbumPhotoScreen({Key? key, required this.albumId, required this.id})
      : super(key: key);

  @override
  State<AlbumPhotoScreen> createState() => _AlbumPhotoScreenState();
}

class _AlbumPhotoScreenState extends State<AlbumPhotoScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              GoRouter.of(context).replaceNamed(AppRouteConstant.albumScreen,
                  pathParameters: {'id': widget.id});
            }
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Photo>>(
            future: apiService.getPhotoList(int.parse(widget.albumId)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final albums = snapshot.data!;
                return GridView.builder(
                    itemCount: albums.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          color: Colors.white,
                        ),
                        // color: Colors.red,
                        child: Image.network(
                          albums[index].thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
