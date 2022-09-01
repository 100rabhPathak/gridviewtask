import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'I Identify as',
      home: MyHomePage(title: 'I Identify as'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> choices = [
    "Straight Male",
    "Straight Female",
    "Lesbian",
    "Gay",
    "Bisexual",
    "Transgender",
    "Intersex",
    "Queer",
  ];
  int selected_Index = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 100,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: const Text(
                "I Identify as",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const Padding(padding: EdgeInsets.all(30.0)),
        GridView.builder(
            itemCount: choices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 0.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (selected_Index == index) {
                      selected_Index = -1;
                    } else {
                      selected_Index = index;
                    }
                  });
                },
                child: Container(
                    width: 180,
                    height: 35,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: selected_Index == index
                            ? const Color(0xff1ECEA5)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 2.0)),
                    child: Text(
                      choices[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: selected_Index == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    )),
              );
            }),
        const Padding(padding: EdgeInsets.all(20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (selected_Index == 8) {
                    selected_Index = -1;
                  } else {
                    selected_Index = 8;
                  }
                });
              },
              child: Container(
                  width: 180,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: selected_Index == 8
                          ? const Color(0xff1ECEA5)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(width: 2.0)),
                  child: Text(
                    "Non-Binary",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: selected_Index == 8 ? Colors.white : Colors.black,
                    ),
                  )),
            )
          ],
        ),
        const Padding(padding: EdgeInsets.all(30.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  var p = selected_Index;
                  if (p == -1) {
                    Fluttertoast.showToast(
                        msg: "Please Select One Option  ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (8 > p && p >= 0) {
                    Fluttertoast.showToast(
                        msg: choices[p],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (selected_Index == 8) {
                    Fluttertoast.showToast(
                        msg: "Non-Binary ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                });
              },
              child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: selected_Index != -1
                          ? const Color(0xff1ECEA5)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(width: 2.0)),
                  child: Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: selected_Index != -1 ? Colors.white : Colors.black,
                    ),
                  )),
            )
          ],
        )
      ]),
    ));
  }
}
