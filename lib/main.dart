import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // email, password 입력하는 부분을 제외한 화면을 탭하면, 키보드 사라지게 GestureDetector 사용 
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 300)),
              Center(
                child: /*Image(
                  image: AssetImage('login.png'),
                  width: 150.0,
                ), */
                Text('', style: TextStyle(fontSize: 30),
                ),
              ),
              Form(
                child: Theme(
                data: ThemeData(
                    primaryColor: Colors.grey,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Color.fromARGB(255, 46, 46, 46), fontSize: 15.0))),
                child: Container(
                    padding: EdgeInsets.only(top: 30, bottom: 80, left: 80,right: 80),
                    child: Builder(builder: (context) {
                      return Column(
                        children: [
                          TextField(
                            controller: controller,
                            autofocus: true,
                            decoration: InputDecoration(labelText: '아이디'),
                            keyboardType: TextInputType.name,
                          ),
                          TextField(
                            controller: controller2,
                            decoration:
                                InputDecoration(labelText: '비밀번호'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller.text == 'admin' &&
                                      controller2.text == '1234') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Reservation()));
                                  }
                                  else if (controller.text == 'admin' && controller2.text != '1234') {
                                      showSnackBar(context, Text('Wrong password'));
                                  }
                                  else if (controller.text != 'admin' && controller2.text == '1234') {
                                      showSnackBar(context, Text('Wrong id'));
                                  }
                                  else {
                                    showSnackBar(context, Text('Check your info again'));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 48, 48, 48)),
                                child: Text('Enter', style: TextStyle(fontSize: 20, color: Colors.white),)
                              ))
                        ],
                      );
                    })),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: Color.fromARGB(255, 140, 140, 140),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class Reservation extends StatelessWidget {
  const Reservation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            IconButton(
              icon: Icon(Icons.home_filled),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.format_list_bulleted),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.chat_bubble),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.account_box),
              onPressed: () {},
            ),
            Spacer()
          ],
        ),
      ),
        body: Center(
          child:Text(
            'Hi',
            style: TextStyle(fontSize: 30),
          )
        )
        )
    );
  }
}