import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx_demo/routes/route_constant.dart';

import '../screens/album/album_photo_screen.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../screens/posts/post_screen.dart';

// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/', routes: [
    // ShellRoute(
    //     navigatorKey: _shellNavigatorKey,
    //     builder: (context,state,child){
    //   return MainScreen(id: state.pathParameters['id']!, location: state.fullPath!, child: child,);
    // } ,
    //     routes: [
    //       GoRoute(
    //         parentNavigatorKey: _shellNavigatorKey,
    //           name: AppRouteConstant.postListScreen,
    //           path: '/post_list/:id',
    //           pageBuilder: (context, state) {
    //             return MaterialPage(child: PostListScreen(id: state.pathParameters['id']!,));
    //           }),
    //       GoRoute(
    //           name: AppRouteConstant.albumScreen,
    //           path: '/album/:id',
    //           pageBuilder: (context, state) {
    //             return MaterialPage(child: AlbumScreen(id: state.pathParameters['id']!,));
    //           }),
    //       GoRoute(
    //           name: AppRouteConstant.todoListScreen,
    //           path: '/todo_list/:id',
    //           pageBuilder: (context, state) {
    //             return MaterialPage(child: TodoListScreen(id: state.pathParameters['id']!,));
    //           }),
    //     ]),
    GoRoute(
      name: AppRouteConstant.loginScreen,
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: LoginScreen());
      },
    ),
    GoRoute(
      name: AppRouteConstant.mainScreen,
      path: '/main/:id',
      pageBuilder: (context, state) {
        return MaterialPage(
            child: MainScreen(
          id: state.pathParameters['id']!,
        ));
      },
    ),
    GoRoute(
        name: AppRouteConstant.postScreen,
        path: '/posts/:id/:postId/:postTitle',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: PostScreen(
            id: state.pathParameters['id']!,
            postId: state.pathParameters['postId']!,
            postTitle: state.pathParameters['postTitle']!,
          ));
        }),
    GoRoute(
        name: AppRouteConstant.postListScreen,
        path: '/post_list/:id',
        pageBuilder: (context, state) {
          // return MaterialPage(child: PostListScreen(id: state.pathParameters['id']!,));
          return MaterialPage(
              child: MainScreen(
            id: state.pathParameters['id']!,
            selectedScreen: 0,
          ));
        }),
    GoRoute(
        name: AppRouteConstant.albumScreen,
        path: '/album/:id',
        pageBuilder: (context, state) {
          // return MaterialPage(child: AlbumScreen(id: state.pathParameters['id']!,));
          return MaterialPage(
              child: MainScreen(
            id: state.pathParameters['id']!,
            selectedScreen: 1,
          ));
        }),
    GoRoute(
        name: AppRouteConstant.todoListScreen,
        path: '/todo_list/:id',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MainScreen(
            id: state.pathParameters['id']!,
            selectedScreen: 2,
          ));

          // return MaterialPage(child: TodoListScreen(id: state.pathParameters['id']!,));
        }),
    GoRoute(
        name: AppRouteConstant.photoListScreen,
        path: '/photo_list/:id/:albumId',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: AlbumPhotoScreen(
                  id: state.pathParameters['id']!,
                  albumId: state.pathParameters['albumId']!));
        }),
  ]);
}
