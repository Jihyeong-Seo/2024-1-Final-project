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
                    Text(
                  '',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                    primaryColor: Colors.grey,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 46, 46, 46),
                            fontSize: 15.0))),
                child: Container(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 80, left: 80, right: 80),
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
                            decoration: InputDecoration(labelText: '비밀번호'),
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
                                                  MainPage()));
                                    } else if (controller.text == 'admin' &&
                                        controller2.text != '1234') {
                                      showSnackBar(
                                          context, Text('Wrong password'));
                                    } else if (controller.text != 'admin' &&
                                        controller2.text == '1234') {
                                      showSnackBar(context, Text('Wrong id'));
                                    } else {
                                      showSnackBar(context,
                                          Text('Check your info again'));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 48, 48, 48)),
                                  child: Text(
                                    'Enter',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )))
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
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BulletinBoardPage(),
                    ),
                  );
                },
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
      ),
    );
  }
}

class BulletinBoardPage extends StatelessWidget {
  const BulletinBoardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시판'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Code to navigate to the article upload page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ArticleUploadPage(),
              ),
            );
          },
          child: Text('글쓰기'),
        ),
      ),
    );
  }
}

class ArticleUploadPage extends StatefulWidget {
  const ArticleUploadPage({super.key});
  @override
  State<ArticleUploadPage> createState() => _ArticleUploadPageState();
}

class _ArticleUploadPageState extends State<ArticleUploadPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('글 쓰기'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
              maxLines: null,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Code to save the article and navigate back to the bulletin board page
                String title = titleController.text;
                String content = contentController.text;
                saveArticle(title, content);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void saveArticle(String title, String content) {
    // Code to save the article to a database or perform any other necessary operations
    // You can use the title and content variables to access the user input
    // For example, you can send an API request to save the article to a server
  }
}
