import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api_service/api_service.dart';
import '../../routes/route_constant.dart';

class AlbumScreen extends StatefulWidget {
  final String id;
  const AlbumScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          title: const Text('Album'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
              future: apiService.getAlbumList(int.parse(widget.id)),
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
                        return InkWell(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                                AppRouteConstant.photoListScreen,
                                pathParameters: {
                                  'id': widget.id,
                                  'albumId': albums[index].id.toString()
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                color: Colors.white),
                            // color: Colors.red,
                            child: Center(
                              child: Text(
                                albums[index].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }
              }),
        ));
  }
}
