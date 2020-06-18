import 'package:flutter/material.dart';
import 'package:lawyerApp/models/case.dart';
import 'package:lawyerApp/views/home/case_tile.dart';
import 'package:provider/provider.dart';

class CasesList extends StatefulWidget {
  @override
  _CasesListState createState() => _CasesListState();
}

class _CasesListState extends State<CasesList> {
  @override
  Widget build(BuildContext context) {

    final cases = Provider.of<List<Case>>(context) ?? [];

    return ListView.builder(
      itemCount: cases.length,
      itemBuilder: (context, index) {
        return CaseTile(kCase: cases[index]);
      },
    );
  }
}