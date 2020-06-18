import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawyerApp/models/speciality.dart';
import 'package:lawyerApp/services/search.dart';
import 'package:lawyerApp/views/home/lawyer_list.dart';

String selectedCategorie= "Adults";
//final _fireStore = Firestore.instance;
FirebaseUser loggedInUser;

class Test extends StatefulWidget {
  static const String id = 'home';
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final _auth = FirebaseAuth.instance;
  List<String> categories = ["Adults","Childrens","Womens","Mens"];
  List<SpecialityModel> specialities;
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
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    specialities = getSpeciality();
  }
  void getCurrentUser() async {
    try {
    final user = await _auth.currentUser();
    if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      } 
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut(); 
                Navigator.pop(context);
              }),
        ],
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
                        child: Image.asset('images/logo.png', width: 80, height: 80,),
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
            ],
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Text("Find Your \nConsultation", style: TextStyle(
                color: Colors.black87.withOpacity(0.8),
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 40,),
              TextField(
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
              }).toList()),
              SizedBox(height: 30,),
              Text("Categories", style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 20,),
              Container(
                height: 30,
                child: ListView.builder(
                itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                  return CategorieTile(
                    categorie: categories[index],
                    isSelected: selectedCategorie == categories[index],
                    context: this,
                  );
                    }),
              ),
              SizedBox(height: 20,),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: specialities.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return SpecialistTile(
                        imgAssetPath: specialities[index].imgAssetPath,
                        speciality: specialities[index].speciality,
                        noOfDoctors: specialities[index].noOfDoctors,
                        backColor: specialities[index].backgroundColor,
                      );
                    }),
              ),
              SizedBox(height: 20,),
              Text("Lawyers", style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 20,),
              DoctorsTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatefulWidget {

  final String categorie;
  final bool isSelected;
  final _TestState context;
  CategorieTile({this.categorie, this.isSelected,this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.context.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
          color: widget.isSelected ? Color(0xffFFD0AA) : Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(widget.categorie, style: TextStyle(
          color: widget.isSelected ?  Color(0xffFC9535) : Color(0xffA1A1A1)
        ),),
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {

  final String imgAssetPath;
  final String speciality;
  final int noOfDoctors;
  final Color backColor;
  SpecialistTile({@required this.imgAssetPath,@required this.speciality
    ,@required this.noOfDoctors, @required this.backColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => LawyerList()
                  ));
                  },
                  child: Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: backColor,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  padding: EdgeInsets.only(top: 16,right: 16,left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(speciality, style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                      SizedBox(height: 6,),
                      Text("$noOfDoctors Lawyers", style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                      ),),
                      Image.asset(imgAssetPath, height: 160,fit: BoxFit.fitHeight,)
                    ],
                  ),
                ),
              );
            }
          }
          
          

class DoctorsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => LawyerList()
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFEEE0),
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.symmetric(horizontal: 24,
        vertical: 18),
        child: Row(
          children: <Widget>[
            Image.asset("images/doctor_pic.png", height: 50,),
            SizedBox(width: 17,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dr. Stefeni Albert", style: TextStyle(
                  color: Color(0xffFC9535),
                  fontSize: 19
                ),),
                SizedBox(height: 2,),
                Text("Heart Speailist", style: TextStyle(
                  fontSize: 15
                ),)
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,
              vertical: 9),
              decoration: BoxDecoration(
                color: Color(0xffFBB97C),
                borderRadius: BorderRadius.circular(13)
              ),
              child: Text("Call", style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
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