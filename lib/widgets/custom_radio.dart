import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Gender {
  String name;
  IconData icon;
  bool isSelected;
  Gender(this.name, this.icon, this.isSelected);
}

class CustomRadio extends StatelessWidget {
  final Gender _gender;
  CustomRadio(this._gender);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: _gender.isSelected
            ? Color(0xFF3B4257)
            : Color.fromRGBO(255, 255, 255, 0.8),
        child: Container(
          height: 25,
          width: 85,
          alignment: Alignment.center,
          margin: new EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                size: 30,
              ),
              SizedBox(height: 10),
              Text(
                _gender.name,
                style: TextStyle(
                    color: _gender.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}

class GenderSelector extends StatefulWidget {
  final Function gdd;
  GenderSelector(this.gdd);

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> genders = new List<Gender>();
  String gd;
  // _GenderSelectorState(this.gd);

  @override
  void initState() {
    super.initState();
    genders.add(new Gender("Male", MdiIcons.genderMale, false));
    genders.add(new Gender("Female", MdiIcons.genderFemale, false));
    genders.add(new Gender("Others", MdiIcons.genderTransgender, false));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: genders.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.pinkAccent,
            onTap: () {
              setState(() {
                genders.forEach((gender) => gender.isSelected = false);
                genders[index].isSelected = true;
                gd = genders[index].name;
                print(gd);
              });
              widget.gdd(gd);
            },
            child: CustomRadio(genders[index]),
          );
        });
  }
}
