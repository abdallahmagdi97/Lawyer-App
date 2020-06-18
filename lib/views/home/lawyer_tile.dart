import 'package:flutter/material.dart';
import 'package:lawyerApp/models/lawyer.dart';
import 'package:lawyerApp/views/home/lawyer_profile.dart';

class LawyerTile extends StatelessWidget {

  final Lawyer lawyer;
  LawyerTile({ this.lawyer });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(lawyer.name),
          subtitle: Text('Address : ${lawyer.address}\nPhone : ${lawyer.phone}'),
          onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LawyerProfile(lawyer: lawyer),
          ),
        );
      },
          enabled: true,
        ),
      ),
    );
  }
}