import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultProvider extends ChangeNotifier {
  String result = "";
  int b = 0;
  double resultNumber = 0;
  double processNumber = 0;

  ResultProvider() {
    initValue();
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
            result += number;
            notifyListeners();
          }
          if(number == "C"){
            refresh();
            notifyListeners();
          }
          if(number == "*="){
            returnResult();
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
    initValue();
    notifyListeners(); // Providerを介してConsumer配下のWidgetがリビルドされる
  }

  void updateText(String str) {
    b++;
    result = str;
  }

  void notify() {
    notifyListeners(); // Providerを介してConsumer配下のWidgetがリビルドされる
  }

  void returnResult(){
    processNumber = double.parse(result);
    resultNumber = processNumber*1.08;
    result = "";
  }
}
