import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'First Layout'),
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
  final myController_user = TextEditingController();
  final myController_pwd = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController_user.dispose();
    myController_pwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.cyan,
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: 80,
                  child: IconButton(
                    color: Colors.,
                    padding: const EdgeInsets.all(15),
                    iconSize: 130,
                    icon: const Icon(Icons.insert_photo),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Row Child 1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Row Child 2',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Row Child 3',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'This is Column',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: myController_user,
                  decoration: InputDecoration(
                      hintText: 'username',
                      filled: true,
                      fillColor: Colors.white70),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: myController_pwd,
                  decoration: InputDecoration(
                      hintText: 'password',
                      filled: true,
                      fillColor: Colors.white70),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      myController_user.clear();
                      myController_pwd.clear();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed: () => displayToast(),
                      //print('Hello login'),
                      child: Text('Login')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  } //end bulid

  void displayToast() {
    String username = myController_user.text;
    String password = myController_pwd.text;

    Fluttertoast.showToast(
      msg: 'Your username:$username \n Your password: $password',
      toastLength: Toast.LENGTH_SHORT,
    );
  }
} //end class _MyHomePage
