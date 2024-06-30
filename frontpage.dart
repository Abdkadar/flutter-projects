import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  late DateTime indate;
  late DateTime outdate;
  final intTime = TextEditingController();
  final outTime = TextEditingController();
  final printTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Biometric'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            height: 400,
            width: 500,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: intTime,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Get In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => setState(
                      () {
                        indate = DateTime.now();
                        intTime.text = '$indate';
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: outTime,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Get Out',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => setState(
                      () {
                        outdate = DateTime.now();
                        outTime.text = '$outdate';
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: printTime,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Print',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => setState(
                      () {
                        final hours = outdate.difference(indate).inHours;
                        final minutes = outdate.difference(indate).inMinutes;
                        final totalWorkingHours = '$hours hrs.$minutes min';
                        printTime.text = totalWorkingHours;
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
