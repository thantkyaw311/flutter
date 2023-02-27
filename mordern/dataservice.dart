import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopdata/data/regerstion.dart';
import 'package:shopdata/widget/registerpage.dart';

const String USER_COLLECTION = 'Users';
const String DATA_COLLECTION = 'Data';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  DatabaseService() {}
  CollectionReference<RegisterData> postdata() {
    return _db.collection(USER_COLLECTION).withConverter<RegisterData>(
        fromFirestore: ((snapshot, _) =>
            RegisterData.fromMap(snapshot.data()!)),
        toFirestore: ((register, _) => register.toMap()));
  }

  CollectionReference user =
      FirebaseFirestore.instance.collection(USER_COLLECTION);

  Stream<QuerySnapshot<RegisterData>> getdata() {
    return _db
        .collection(USER_COLLECTION)
        .withConverter<RegisterData>(
            fromFirestore: ((snapshot, _) =>
                RegisterData.fromMap(snapshot.data()!)),
            toFirestore: ((register, _) => register.toMap()))
        .snapshots();
  }

  Future<DocumentSnapshot> useuid(String uid) {
    return _db.collection(USER_COLLECTION).doc(uid).get();
  }

  datequl() {
    return _db
        .collection(USER_COLLECTION)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.map((e) {
        print(e['phonenumber']);
      });
    });
  }

  CollectionReference<login> lodata() {
    return _db.collection(USER_COLLECTION).withConverter<login>(
        fromFirestore: ((snapshot, _) => login.fromMap(snapshot.data()!)),
        toFirestore: ((register, _) => register.toMap()));
  }

  Stream<QuerySnapshot<images>> getimage() {
    return _db
        .collection(DATA_COLLECTION)
        .withConverter<images>(
            fromFirestore: ((snapshot, _) => images.fromMap(snapshot.data()!)),
            toFirestore: ((register, _) => register.toMap()))
        .snapshots();
  }
   CollectionReference  upimage(){
      return _db.collection(DATA_COLLECTION).withConverter<images>(fromFirestore: ((snapshot, _) =>images.fromMap(snapshot.data()!) ), toFirestore: ((value, options) =>value.toMap() ));
     }
}
