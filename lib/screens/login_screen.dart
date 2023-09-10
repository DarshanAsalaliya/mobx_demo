import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../api_service/api_service.dart';
import '../model/user_model.dart';
import '../routes/route_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userId = TextEditingController();
  ApiService apiService = ApiService();
  bool _isLoad = false;

  Future<List<User>> login() async {
    final List<User> user = await apiService.authUser(userId.text.trim());
    // bool result = await apiService.authUser(userId.text.trim());
    return user;
    // return false;
  }

  @override
  Widget build(BuildContext context) {
    void navigatePost(result) {
      GoRouter.of(context).replaceNamed(AppRouteConstant.mainScreen,
          pathParameters: {'id': result[0].id.toString()});
    }

    void showSnackbar(String text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userId,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter User Id"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: _isLoad
                      ? null
                      : () async {
                          if (userId.text.isNotEmpty) {
                            setState(() {
                              _isLoad = true;
                            });

                            List<User> result = await login();
                            if (result.isNotEmpty) {
                              navigatePost(result);
                            } else {
                              showSnackbar('Enter valid userID');
                            }

                            setState(() {
                              _isLoad = false;
                            });
                          } else {
                            showSnackbar('Enter User Id');
                          }
                        },
                  child: _isLoad
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
