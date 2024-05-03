import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/button_media.dart';
import 'package:flutter_application_1/component/divider_cus.dart';
import 'package:google_fonts/google_fonts.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _visibility = false;

  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Email field must be filled';
    }
    if (!_isValidEmail(value)) {
      return 'Email not valid';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value == null || value.length < 6) {
      return 'Password must be longer than 6 characters.\n';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Uppercase letter is missing.\n';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Lowercase letter is missing.\n';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Digit is missing.\n';
    }

    if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return 'Special character is missing.\n';
    }

    return null;
  }

  bool _isValidEmail(email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void _login() {
    if (_loginFormKey.currentState!.validate()) {
      // Get.snackbar("Login", "berhasil login");
      // Get.offAllNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back! Glad to see you, Again!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          labelText: 'Enter your email',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey
                                    .withOpacity(0.5)), //<-- SEE HERE
                          ),
                        ),
                        validator: emailValidator),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          labelText: 'Enter your password',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey.withOpacity(0.5)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_visibility
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _visibility = !_visibility;
                              });
                            },
                          )),
                      validator: passwordValidator,
                      obscureText: _visibility,
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.black),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            const DividerCus(title: "Login"),
            const SizedBox(
              height: 20,
            ),
            const ButtonMedia(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Register Now',
                      style: const TextStyle(
                        color: Color(0xff35C2C1),
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
