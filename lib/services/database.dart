import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lawyerApp/models/case.dart';
import 'package:lawyerApp/models/lawyer.dart';
import 'package:lawyerApp/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference lawyerCollection = Firestore.instance.collection('lawyer');
  final CollectionReference caseCollection = Firestore.instance.collection('case');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await lawyerCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // Lawyer list from snapshot
  List<Lawyer> _lawyerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Lawyer(
        name: doc.data['name'],
        address: doc.data['address'],
        phone: doc.data['phone'],
      );
    }).toList();
  }

  // Cases list from snapshot
  List<Case> casesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Case(
        caseType: doc.data['caseType'],
        caseSubType: doc.data['caseSubType'],
        information: doc.data['information'],
        caseUser: doc.data['caseUser'],
        caseLawyer: doc.data['caseLawyer'],
      );
    }).toList();
  }
  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
    );
  }

  // get Lawyers stream
  Stream<List<Lawyer>> get lawyers {
    return lawyerCollection.snapshots()
      .map(_lawyerListFromSnapshot);
  }

  // get Cases stream
  Stream<List<Case>> get cases {
    return caseCollection.snapshots()
      .map(casesListFromSnapshot);
  }
  // get user doc stream
  Stream<UserData> get userData {
    return lawyerCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}