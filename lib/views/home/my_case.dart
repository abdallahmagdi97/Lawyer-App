import 'package:flutter/material.dart';
import 'package:lawyerApp/models/case.dart';
import 'package:lawyerApp/services/auth.dart';
import 'package:lawyerApp/services/database.dart';
import 'package:lawyerApp/shared/constants.dart';
import 'package:lawyerApp/views/home/case_list.dart';
import 'package:lawyerApp/views/home/home.dart';
import 'package:lawyerApp/views/home/lawyer_search.dart';
import 'package:lawyerApp/views/home/settings_form.dart';
import 'package:lawyerApp/views/home/user_profile.dart';
import 'package:provider/provider.dart';

class MyCases extends StatefulWidget {

  @override
  _MyCasesState createState() => _MyCasesState();
}

class _MyCasesState extends State<MyCases> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Case>>.value(
      value: DatabaseService().cases,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
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
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset('assets/logo.png', width: 80, height: 80,),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('LawyerApp', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                    )
                  ],),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.brown,
                    Colors.brown[10],
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
            ],
          )
      ),
        appBar: AppBar(
          title: Text('The LawyerApp'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            RaisedButton(
              color: Colors.brown[400],
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => /*AddCase()*/null)),
              child: Text('New Case',style: TextStyle(color: Colors.white, decorationThickness: 100, fontSize: 19)),
              ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CasesList()
        ),
      ),
    );
  }
}
