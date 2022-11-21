import 'package:flutter/material.dart';
import 'package:flutter_tutorial_for_beginners_2022/pages/login_page.dart';
import 'package:flutter_tutorial_for_beginners_2022/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

String imageUrl1 = 'https://ipt.imgix.net/201445';
String imageUrl2 = 'https://ipt.imgix.net/201444';
String currentImageUrl = imageUrl1;
int numberOfImages = 1;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            if (currentImageUrl == imageUrl1) {
                              currentImageUrl = imageUrl2;
                            } else if (currentImageUrl == imageUrl2) {
                              currentImageUrl = imageUrl1;
                            }
                          });
                        },
                        child: const Text('Click')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            numberOfImages++;
                          });
                        },
                        child: Text('Add picture ($numberOfImages)')),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          });
                        },
                        child: const Text('Login')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const RegisterPage();
                          }));
                        },
                        child: const Text('Register')),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: List.generate(numberOfImages,
                      (index) => Image.network(currentImageUrl)),
                ),
              ],
            ),
          ),
        )
        //Image.asset('images/Welcome.png'),
        );
  }
}
