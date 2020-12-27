import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/models/image.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/custom_radio.dart';
import '../provider/profile_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Personal extends StatefulWidget {
  static const routeName = '/personal-information';

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final _titleController = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _email = TextEditingController();
  final _bd = TextEditingController();
  final _alternateno = TextEditingController();
  File _pickedImage;
  String _gender;
  DateTime _selectedDate;

  void _selectGender(String gender) {
    _gender = gender;
  }

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print(_selectedDate);
  }

  _savePlace() {
    if (_titleController.text.isEmpty) {
      // return print('ff');
      return Alert(
        context: context,
        type: AlertType.error,
        title: "ERROR",
        desc: "PLEASE ENTER FULL DETAILS.",
        buttons: [
          DialogButton(
              child: Text(
                "BACK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ).show();
    }
    Provider.of<ProfilePhoto>(context, listen: false).addItems(
        _titleController.text,
        _pickedImage,
        _mobileNumber.text,
        _email.text,
        _selectedDate.toString(),
        _alternateno.text,
        _gender);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add Profile',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Container(
                      // child: CircleAvatar(),
                      height: 180,
                      width: double.infinity,
                      // color: Colors.grey,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.topLeft,
                              colors: [Colors.pink[100], Colors.red[300]])),
                    ),
                    Container(
                      // color: Colors.green,
                      // decoration: BoxDecoration(),
                      margin: EdgeInsets.only(
                        top: 65.0,
                        left: 110.0,
                      ),
                      // padding: EdgeInsets.only(top: 60),
                      child: UserImagePicker(_selectImage),
                      // padding: EdgeInsets.all(5),
                    ),
                  ]),
                  SizedBox(height: 20),
                  Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 2)),
                    width: 350,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.confirmation_number),
                        labelText: 'Mobile Number',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      controller: _mobileNumber,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        icon: Icon(Icons.perm_camera_mic),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      controller: _titleController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        icon: Icon(Icons.email),
                      ),
                      controller: _email,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 80,
                    width: 300,
                    child: GenderSelector(_selectGender),
                    margin: EdgeInsets.only(left: 25),
                  ),
                  SizedBox(height: 20),
                  // Container(
                  //   height: 50,
                  //   width: 350,
                  //   child: TextField(
                  //       keyboardType: TextInputType.datetime,
                  //       decoration: InputDecoration(
                  //         labelText: 'BirthDay',
                  //         border: const OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(10.0))),
                  //         icon: Icon(Icons.data_usage),
                  //       ),
                  //       controller: _bd),
                  // ),
                  Container(
                    width: 255,
                    child: Text(
                      'CHOOSE DATE OF BIRTTH',
                      // style: TextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      // shape: BoxShape.rectangle,
                    ),
                    height: 55,
                    width: media.width - 109,
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // TextField(
                        //   decoration: InputDecoration(labelText:'Date'),
                        // ),

                        Text(
                          _selectedDate == null
                              ? ''
                              : ' ${DateFormat.yMd().format(_selectedDate)}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 45),
                        ),

                        FlatButton(
                          child: Text(
                            _selectedDate == null ? 'CHOOSE DATE' : '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          onPressed: _presentDatePicker,
                          textColor: Colors.red,
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    width: 255,
                    child: Text(
                      'ALERTNATE MOBILE NUMBER',
                      // style: TextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'ALERTNATE MOBILE NUMBER',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          icon: Icon(Icons.confirmation_num),
                        ),
                        controller: _alternateno),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
            color: Colors.black,
          ),
          Container(
            width: 300,
            margin: EdgeInsets.all(20),
            child: RaisedButton.icon(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).canvasColor,
              ),
              label: Text(
                'SAVE DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              onPressed: _savePlace,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Color.fromRGBO(252, 40, 80, 1),
            ),
          ),
        ],
      ),
    );
  }
}
