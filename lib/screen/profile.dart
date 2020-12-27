import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shopping_app/widgets/photo.dart';
import '../screen/personalInformation.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile-screen';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Profile',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Personal.routeName);
            },
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.topLeft,
                          colors: [Colors.pink[100], Colors.red[300]])),
                ),

                Container(
                    // color: Colors.amberAccent,
                    height: 155,
                    // width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4 - 40,
                    ),
                    padding: EdgeInsets.only(top: 9),
                    child: Photo()),
                // Consumer<ProfilePhoto>(builder: (ctx, value, _) {
                //   // print(user.uid)

                //   return Container(
                //     // color: Colors.grey,
                //     child: CircleAvatar(
                //       backgroundImage: value.photo != null
                //           ? FileImage(value.photo)
                //           : value.urll != null
                //               ? NetworkImage(value.urll)
                //               : AssetImage('assets/profile/dummyprofile.jpg'),
                //       // backgroundImage: NetworkImage(photourl),
                //       radius: 90,
                //     ),
                // margin: EdgeInsets.only(
                //     top: MediaQuery.of(context).size.height / 4 - 30,
                //     left: 20),
                // padding: EdgeInsets.only(top: 9),
                //   );
                // }),
                // if (Error != null)
                // Consumer<ProfilePhoto>(
                //   builder: (ctx, value, _) => Container(
                //     // color: Colors.green,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //           child: Text(
                //             value.title != null ? value.title : 'USERNAME',
                //             overflow: TextOverflow.ellipsis,
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //             ),
                //           ),
                //         ),
                //         IconButton(
                //           icon: Icon(Icons.edit),
                //           onPressed: () {
                //             Navigator.of(context).pushNamed(Personal.routeName);
                //           },
                //         ),
                //       ],
                //     ),
                //     margin: EdgeInsets.only(top: 240, left: 200),
                //     // padding: EdgeInsets.only(top: 200, left: 15),
                //   ),
                // ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Orders'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.open_with_rounded),
            subtitle: Text('Check your order status'),
            onTap: () {
              // Navigator.of(context).pushNamed(Orders.routeName);
            },
            // tileColor: Theme.of(context).primaryColor,
          ),
          Divider(),
          ListTile(
            title: Text('Myntra Inside'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.add_business),
            subtitle: Text('Perks,Privileges,Pride'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Help Center'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.headset),
            subtitle: Text('Help Regarding Query'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Whishlist'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.favorite_border_outlined),
            subtitle: Text('Your order love'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Refer & Earn'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.refresh_sharp),
            subtitle: Text('Invite friends and Earn'),
            onTap: () {},
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Saved Card'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.save),
            subtitle: Text('Saved Cards for future order'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Address'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.location_city),
            subtitle: Text('Address for your Order'),
            onTap: () {},
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Setting'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.settings),
            subtitle: Text('Manage Notification for setting'),
            onTap: () {},
          ),
          Divider(),
          Divider(),
          ListTile(
            leading: Icon(Icons.query_builder),
            title: Text(
              'FAQs',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
            onTap: () {
              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('CANTACT US',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.more),
            title: Text(
              'MORE',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            onTap: () {},
          ),
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('LOGOUT'),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.red,
          ),
          Divider(),
          Center(
            child: Text('APP VERSION 4.2011.2'),
            // margin: EdgeInsets.all(15),
            heightFactor: 10,
          )
        ]),
      ),
    );
  }
}
