import 'package:flutter/material.dart';
import 'package:lawyerApp/models/case.dart';

class CaseTile extends StatelessWidget {

  final Case kCase;
  CaseTile({ this.kCase });

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
          title: Text(kCase.caseLawyer.toString()),
          subtitle: Text('Case Type : \t${kCase.caseType}\nCase SubType : \t${kCase.caseSubType}'),
          onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CaseDetails(kCase: kCase),
          ),
        );*/
      },
          enabled: true,
        ),
      ),
    );
  }
}