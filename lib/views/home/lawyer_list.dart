import 'package:flutter/material.dart';
import 'package:lawyerApp/models/lawyer.dart';
import 'package:provider/provider.dart';
import 'lawyer_tile.dart';

class LawyerList extends StatefulWidget {
  @override
  _LawyerListState createState() => _LawyerListState();
}

class _LawyerListState extends State<LawyerList> {
  @override
  Widget build(BuildContext context) {

    final lawyers = Provider.of<List<Lawyer>>(context) ?? [];

    return ListView.builder(
      itemCount: lawyers.length,
      itemBuilder: (context, index) {
        return LawyerTile(lawyer: lawyers[index]);
      },
    );
  }
}