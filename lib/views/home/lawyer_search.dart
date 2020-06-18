import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawyerApp/services/search.dart';
import 'package:lawyerApp/shared/constants.dart';
import 'package:lawyerApp/views/home/home.dart';
import 'package:lawyerApp/views/home/my_case.dart';
import 'package:lawyerApp/views/home/settings_form.dart';
import 'package:lawyerApp/views/home/user_profile.dart';

class LawyerSearch extends StatefulWidget {
  @override
  _LawyerSearchState createState() => _LawyerSearchState();
}

class _LawyerSearchState extends State<LawyerSearch> {
  final _auth = FirebaseAuth.instance;
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }
  void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
            color: Colors.black87
        ),
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Container(
                  child: Column(children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/logo.png', width: 80, height: 80,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('LawyerApp', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                    )
                  ],),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.blue,
                    Colors.lightBlueAccent,
                  ],
                  ),
                ),
                ),
              CustomListTile(icon: Icons.home, text: 'Home', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home()))),
              CustomListTile(icon: Icons.person, text: 'Profile', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()))),
              CustomListTile(icon: Icons.work, text: 'My Cases', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyCases()))),
              CustomListTile(icon: Icons.search, text: 'Search for a Lawyer', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LawyerSearch()))),
              CustomListTile(icon: Icons.notifications, text: 'Notifications', onTap: null),
              CustomListTile(icon: Icons.settings, text: 'Settings', onTap: () => _showSettingsPanel()),
              CustomListTile(icon: Icons.lock, text: 'Log Out', onTap: () async {await _auth.signOut();}),
              //CustomListTile(icon: Icons.notifications, text: 'Test', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Test()))),
            ],
          )
      ),
      body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList())
        ])
    );
  }
}

Widget buildResultCard(data) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 2.0,
    child: Container(
      child: Center(
        child: Text(data['name'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        )
      )
    )
  );
}
