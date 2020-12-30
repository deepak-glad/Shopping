import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screen/personalInformation.dart';

// class Photo extends StatefulWidget {
//   @override
//   _PhotoState createState() => _PhotoState();
// }

// class _PhotoState extends State<Photo> {
//   @override
//   Widget build(BuildContext context) {
//     var user = FirebaseAuth.instance.currentUser;
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection("databse").snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.data == null) {
//           print(snapshot.data == null);
//           return CircularProgressIndicator();
//         } final doc = snapshot.data.documents;

//         return ListView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot database = snapshot.data.documents[index];
//               if (database.id != user.uid) {
//                 return Row(children: [
//                   CircleAvatar(
//                     backgroundImage:
//                         AssetImage('assets/profile/dummyprofile.jpg'),
//                     radius: 70,
//                   ),
//                   Expanded(
//                     child: Text(
//                       'USERNAME',
//                       // textAlign: TextAlign.center,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () {
//                       Navigator.of(context).pushNamed(Personal.routeName);
//                     },
//                   ),
//                 ]);
//               }
//               return Row(children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   backgroundImage: NetworkImage(database["image_url"]),
//                   radius: 70,
//                 ),
//                 Expanded(
//                   child: Text(
//                     database["username"],
//                     textAlign: TextAlign.right,
//                     overflow: TextOverflow.clip,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.edit),
//                   onPressed: () {
//                     Navigator.of(context).pushNamed(Personal.routeName);
//                   },
//                 ),
//               ]);
//             });
//       },
//     );
//   }
// }
class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
        initialData: FirebaseAuth.instance.currentUser,
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("databse").snapshots(),
              builder: (ctx, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).errorColor,
                      strokeWidth: 4.0,
                    ),
                  );
                }

                return ListView.builder(
                    // reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: streamSnapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot database =
                          streamSnapshot.data.documents[index];
                      // print(user.uid);
                      // print(database.id);
                      // print(streamSnapshot.data.documents[index]["username"]);
                      if (futureSnapshot.data.uid == database.id) {
                        print(database["username"]);
                        return Row(children: [
                          CircleAvatar(
                            // backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(database["image_url"], scale: 1),
                            radius: 70,
                          ),
                          Expanded(
                            child: Text(
                              database["username"],
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Personal.routeName);
                            },
                          ),
                        ]);
                      }
                      //  else
                      //   return Row(children: [
                      //     CircleAvatar(
                      //       backgroundImage:
                      //           AssetImage('assets/profile/dummyprofile.jpg'),
                      //       radius: 70,
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //         'USERNAME',
                      //         // textAlign: TextAlign.center,
                      //         overflow: TextOverflow.ellipsis,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 20,
                      //         ),
                      //       ),
                      //     ),
                      //     IconButton(
                      //       icon: Icon(Icons.edit),
                      //       onPressed: () {
                      //         Navigator.of(context)
                      //             .pushNamed(Personal.routeName);
                      //       },
                      //     ),
                      //   ]);
                      return Container();
                    });
              });
        });
  }
}
