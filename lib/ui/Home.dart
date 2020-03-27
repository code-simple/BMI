import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  //Variables
  TextEditingController _age = new TextEditingController();
  TextEditingController _height = new TextEditingController();
  TextEditingController _weight = new TextEditingController();
  double _userBMI;
  String _bmiMsg = '';
  String _bmiPos = '';

//Methods
  double _personBmi() {
    // Calculating BMI and returning value toString()
    setState(() {
      if (_height.text.isNotEmpty && _weight.text.isNotEmpty) {
        _userBMI = (double.parse(_weight.text)) /
            ((double.parse(_height.text) /
                100 *
                double.parse(_height.text) /
                100));
        return _bmiMsg = 'Your BMI is ${_userBMI.toStringAsFixed(2)}';
      } else {
        return _bmiMsg = 'Enter Values';
      }
    });
    _bmiMethod();
  }

  String _bmiMethod() {
    setState(() {
      if (_userBMI < 16.0) {
        _bmiPos = 'Severely Underweight';
      } else if (_userBMI > 16.0 && _userBMI < 18.4) {
        _bmiPos = 'Underweight';
      } else if (_userBMI > 18.5 && _userBMI < 24.9) {
        _bmiPos = 'Normal';
      } else if (_userBMI > 25.0 && _userBMI < 29.9) {
        _bmiPos = 'Overweight';
      } else if (_userBMI > 30.0 && _userBMI < 34.9) {
        _bmiPos = 'Moderately Obese';
      } else if (_userBMI > 30.0 && _userBMI < 34.9) {
        _bmiPos = 'Moderately Obese';
      } else if (_userBMI > 35.0 && _userBMI < 39.9) {
        _bmiPos = 'Severely Obese';
      } else if (_userBMI > 40.0) {
        _bmiPos = 'Morbidly Obese';
      }
      return _bmiPos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
              alignment: Alignment.center,
              child: new Image.asset(
                'images/bmi.png',
                width: 190,
                height: 190,
              )),
          new Container(
            padding: new EdgeInsets.all(50),
            child: new Column(
              children: <Widget>[
                new TextField(
                  keyboardType: TextInputType.number,
                  controller: _age,
                  decoration: new InputDecoration(
                    icon: Icon(Icons.person_outline),
                    labelText: 'Age',
                  ),
                ),
                new TextField(
                  keyboardType: TextInputType.number,
                  controller: _height,
                  decoration: new InputDecoration(
                    icon: Icon(Icons.line_weight),
                    labelText: 'Height (cm)',
                  ),
                ),
                new TextField(
                  keyboardType: TextInputType.number,
                  controller: _weight,
                  decoration: new InputDecoration(
                    labelText: 'Weight (kg)',
                    icon: Icon(
                      Icons.graphic_eq,
                    ),
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(5.5),
                  alignment: Alignment.center,
                  child: new RaisedButton(
                      onPressed: _personBmi,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          ),
                      color: Colors.pink.shade300,
                      child: new Text('Calculate')),
                )
              ],
            ),
          ),
          new Container(
              alignment: Alignment.center,
              child: new Column(children: <Widget>[
                new Text(
                  '$_bmiMsg',
                  style:
                      new TextStyle(fontSize: 22.0, color: Colors.blueAccent),
                ),
                new Text(
                  '$_bmiPos',
                  style: new TextStyle(fontSize: 22.0, color: Colors.redAccent),
                )
              ]))
        ],
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
