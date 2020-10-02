import 'package:flutter/material.dart';
import 'package:whats_that/models/user.dart';
import 'package:provider/provider.dart';
import 'package:whats_that/screens/authenticate/authenticate.dart';
import 'package:whats_that/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    if (user != null) {
      return MyHomePage(
        title: 'Campus SafeApp',
      );
    } else {
      return Authenticate();
    }
  }
}
