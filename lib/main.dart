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
      ),
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
