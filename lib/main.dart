import 'package:flutter/material.dart';
import 'package:flutter_ww/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ResultProvider>(
      create: (context) => ResultProvider(),
    ),
  ],  child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '吉江ファミリー',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("計算したくないよ！"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: HexColor('FFCCCC'),
      body: Container(
        child: Stack(
          children: [
            Consumer<ResultProvider>(
              builder: (context, model, child) {
                return model.textWidget(200, 200, "シルバニア吉江");
              },
            ),
            Positioned(
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.resultWidget(400, 200, "シルバニア吉江");
                },
              ),
            ),
            Positioned(
              top: 560,
              left: 50,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.rigidTextWidget(200, 200, "シルバニア吉江");
                },
              ),
            ),
            Positioned(
              top: 160,
              left: 50,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("1");
                },
              ),
            ),
            Positioned(
              top: 160,
              left: 150,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("2");
                },
              ),
            ),
            Positioned(
              top: 160,
              left: 250,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("3");
                },
              ),
            ),
            Positioned(
              top: 260,
              left: 50,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("4");
                },
              ),
            ),
            Positioned(
              top: 260,
              left: 150,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("5");
                },
              ),
            ),
            Positioned(
              top: 260,
              left: 250,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("6");
                },
              ),
            ),
            Positioned(
              top: 360,
              left: 50,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("7");
                },
              ),
            ),
            Positioned(
              top: 360,
              left: 150,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("8");
                },
              ),
            ),
            Positioned(
              top: 360,
              left: 250,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("9");
                },
              ),
            ),
            Positioned(
              top: 460,
              left: 50,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.rigidButton("!");
                },
              ),
            ),
            Positioned(
              top: 460,
              left: 150,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("0");
                },
              ),
            ),
            Positioned(
              top: 460,
              left: 250,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton("C");
                },
              ),
            ),
            Positioned(
              top: 520,
              left: 270,
              child: Consumer<ResultProvider>(
                builder: (context, model, child) {
                  return model.calculateButton(".");
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<ResultProvider>(
        builder: (context, model, child) {
          return model.calculateButton("*=");
        },
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
