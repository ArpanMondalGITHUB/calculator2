// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 15, 35, 148)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var whcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();

  var result = "";

  var msg = "";
  var bgcolor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text("Your BMI")),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI APP",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueAccent.shade700),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: whcontroller,
                    decoration: const InputDecoration(
                      label: Text("input you weight in kg"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: ftcontroller,
                    decoration: const InputDecoration(
                      label: Text("input your height in feet"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: incontroller,
                    decoration: const InputDecoration(
                        label: Text("input your height in inches"),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = whcontroller.text.toString();
                        var ft = ftcontroller.text.toString();
                        var inc = incontroller.text.toString();

                        if (whcontroller.text != "" &&
                            ftcontroller.text != "" &&
                            incontroller.text != "") {
                          //logic
                          var inwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(inc);

                          var tinch = (ift * 12) + iInch;

                          var tcm = tinch * 2.54;

                          var tm = tcm / 100;

                          var bmi = inwt / (tm * tm);

                          if (bmi > 25) {
                            msg = "you are overweight tour ";
                            bgcolor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "you are lower weight your ";
                            bgcolor = Colors.red.shade200;
                          } else {
                            msg = "you are healthy your";
                            bgcolor = Colors.green.shade200;
                          }

                          setState(() {
                            result = "$msg bmi is : ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "please fill all the requirements";
                          });
                        }
                      },
                      child: const Text("Check")),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    " ${result}",
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
