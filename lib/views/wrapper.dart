import 'package:flutter/material.dart';
import 'package:lawyerApp/models/user.dart';
import 'package:lawyerApp/views/authenticate/authenticate.dart';
import 'package:lawyerApp/views/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}