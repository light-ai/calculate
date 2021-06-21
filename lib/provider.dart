import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultProvider extends ChangeNotifier {
  String result = "";
  String rigidNumber = "";
  int b = 0;
  double resultNumber = 0;
  double processNumber = 0;
  bool check = false;

  ResultProvider() {
    initValue();
  }

  Widget rigidButton(String number){
    if(check == false) {
      return ButtonTheme(
        minWidth: 50,
        height: 50,
        child: RaisedButton(
          child: Text(number),
          color: Colors.white,
          textColor: Colors.black,
          shape: Border(
            top: BorderSide(color: Colors.red),
            left: BorderSide(color: Colors.blue),
            right: BorderSide(color: Colors.yellow),
            bottom: BorderSide(color: Colors.green),
          ),
          onPressed: () {
            if (number != "*=" && number != "!") {
              result += number;
              notifyListeners();
            }
            if (number == "C") {
              refresh();
              notifyListeners();
            }
            if (number == "*=") {
              returnResult(double.parse(rigidNumber));
              notifyListeners();
            }
            if (number == "!") {
              if (check == false) {
                check = true;
                notifyListeners();
              } else {
                check = false;
                notifyListeners();
              }
            }
          },
        ),
      );
    }else{
      return ButtonTheme(
        minWidth: 50,
        height: 50,
        child: RaisedButton(
          child: Text(number),
          color: Colors.blue,
          textColor: Colors.black,
          shape: Border(
            top: BorderSide(color: Colors.red),
            left: BorderSide(color: Colors.blue),
            right: BorderSide(color: Colors.yellow),
            bottom: BorderSide(color: Colors.green),
          ),
          onPressed: () {
            if (number != "*=" && number != "!") {
              result += number;
              notifyListeners();
            }
            if (number == "C") {
              refresh();
              notifyListeners();
            }
            if (number == "*=") {
              returnResult(double.parse(rigidNumber));
              notifyListeners();
            }
            if (number == "!") {
              if (check == false) {
                check = true;
                notifyListeners();
              } else {
                check = false;
                notifyListeners();
              }
            }
          },
        ),
      );
    }
  }

  Widget textWidget(double width, double height, String number) {
    if(resultNumber == 0) {
      return Container(
        width: width,
        height: height,
        child: Text(result,
          style: TextStyle(
              color: Colors.black,
              fontSize: 30
          ),),
      );
    }else{
      return Container();
    }
  }

  Widget rigidTextWidget(double width, double height, String number) {
    return Container(
      width: width,
      height: height,
      child: Text(rigidNumber,
        style: TextStyle(
            color: Colors.black,
            fontSize: 30
        ),),
    );
  }

  Widget resultWidget(double width, double height, String number) {
    if(resultNumber != 0) {
      return Container(
        width: width,
        height: height,
        child: Text(resultNumber.toString(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 30
          ),),
      );
    }else{
      return Container();
    }
  }

  Widget calculateButton(String number){
    return ButtonTheme(
      minWidth: 50,
      height: 50,
      child: RaisedButton(
        child: Text(number),
        color: Colors.white,
        textColor: Colors.black,
        shape: Border(
          top: BorderSide(color: Colors.red),
          left: BorderSide(color: Colors.blue),
          right: BorderSide(color: Colors.yellow),
          bottom: BorderSide(color: Colors.green),
        ),
        onPressed: () {
          if(number != "*=") {
            rigidResult(number);
          }
          if(number == "C"){
            refresh();
            notifyListeners();
          }
          if(number == "*="){
            returnResult(double.parse(rigidNumber));
            notifyListeners();
          }
        },
      ),
    );
  }

  // 初期化
  void initValue() {
    result = "";
    resultNumber = 0;
  }

  void refresh() {
    if(check == false) {
      initValue();
      notifyListeners();
    }else{
      rigidNumber = "";
    }
  }

  void updateText(String str) {
    b++;
    result = str;
  }

  void notify() {
    notifyListeners(); // Providerを介してConsumer配下のWidgetがリビルドされる
  }

  void returnResult(double a){
    processNumber = double.parse(result);
    resultNumber = processNumber*a;
    result = resultNumber.toString();
  }

  void rigidResult(String number){
    if(check == true){
      rigidNumber += number;
      notifyListeners();
    }else{
      result += number;
      notifyListeners();
    }
  }
}
