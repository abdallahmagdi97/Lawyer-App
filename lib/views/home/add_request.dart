/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lawyerApp/models/case_type.dart';
import 'package:lawyerApp/models/lawyer.dart';
import 'package:lawyerApp/shared/constants.dart';

class AddRequest extends StatefulWidget {
  final Lawyer lawyer;
  const AddRequest({this.lawyer});
  
  @override
  _AddRequestState createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String requestCaseType;
  String requestCaseSubType;
  List<CaseType> _caseTypes = getCaseTypes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
          initialValue: {
            'date': DateTime.now(),
            'accept_terms': false,
          },
          autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderDropdown(
                      attribute: "caseType",
                      decoration: InputDecoration(labelText: "Case Type"),
                      hint: Text('Select Case Type'),
                      validators: [FormBuilderValidators.required()],
                      items: _caseTypes
                          .map((caseTypes) => DropdownMenuItem(
                              value: caseTypes.caseTypeName, 
                              child: Text("${caseTypes.caseTypeName}"),
                              onTap: () {
                                requestCaseType = caseTypes.caseTypeName;
                              },
                              ))
                          .toList(),
                    ),
  
                    FormBuilderTextField(
                      attribute: "age",
                      decoration: InputDecoration(labelText: "Age"),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(70),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RoundedButton(
                        colour: Colors.lightBlueAccent,
                        title: 'Submit',
                        onPressed: () {
                          setState(() {
                            _fbKey.currentState.save();
                          });
                        }),
                    RoundedButton(
                      title: "Reset",
                      colour: Colors.redAccent,
                      onPressed: () {
                        _fbKey.currentState.reset();
                      },
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
*/