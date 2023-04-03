import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      routes: {
        'home' : (context) => const home(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List intro = [
    {
      'text': "Experience places like never before",
      'image': "assets/images/img.png",
    },
    {
      'text': "Your preference & mood we'll find best offers around",
      'image': "assets/images/img_1.png",
    },
    {
      'text': "Search,Discover & Recover real highlights and treasures",
      'image': "assets/images/img_2.png",
    },
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: intro
                            .map(
                              (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 10,
                              width:10,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context,'home');
                        },
                        child: Text(
                          "SKIP",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${intro[index]['text']}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      Image(
                        image: AssetImage("${intro[index]['image']}"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (index < 2) {
                              index++;
                            } else {
                              Navigator.pushNamed(context,'home');
                            }
                            if (index > 2) {
                              index == 2;
                            }
                            print(index);
                          });
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}