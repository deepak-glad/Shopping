import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Profil {
  final String title;
  File imag;
  String mobilee;
  String emaill;
  String birthb;
  String altmobb;
  String gen;

  Profil(
    this.title,
    this.imag,
    this.mobilee,
    this.emaill,
    this.birthb,
    this.altmobb,
    this.gen,
  );
}

class ProfilePhoto with ChangeNotifier {
  List<Profil> _items = [];
  String title;
  File photo;
  String mobile;
  String email;
  String birth;
  String altmob;
  String genn;
  String urll;

  List<Profil> get items {
    return [..._items];
  }

  void addItems(
    String pickedtitle,
    File pickedImage,
    String pickedmobile,
    String pickedemail,
    String pickedbirthday,
    String pickedaltmobile,
    String pickedGender,
  ) async {
    final newData = Profil(pickedtitle, pickedImage, pickedmobile, pickedemail,
        pickedbirthday, pickedaltmobile, pickedGender);
    photo = newData.imag;
    title = newData.title;
    mobile = newData.mobilee;
    email = newData.emaill;
    birth = newData.birthb;
    altmob = newData.altmobb;
    genn = newData.gen;
    print(photo);
    print(title);
    print(mobile);
    print(email);
    print(birth);
    print(altmob);
    print(genn);
    _items.add(newData);

    var user = FirebaseAuth.instance.currentUser;
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child(user.uid + '.jpg');
    await ref.putFile(photo);

    final url = await ref.getDownloadURL();
    await FirebaseFirestore.instance.collection('databse').doc(user.uid).set({
      'image_url': url,
      'username': title,
      'mobile no.': mobile,
      'useremail': email,
      'birthday': birth,
      'altername no.': altmob,
      'Gender': genn
    });
    print(user);
    urll = user.uid;
    notifyListeners();
  }
}
