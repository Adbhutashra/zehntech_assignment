import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zehntech_assignment/Providers/loginProvider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200.withOpacity(0.99),
      body: SafeArea(
        child:
            Consumer<LoginProvider>(builder: (context, signInProvider, child) {
          return Form(
            key: signInProvider.loginFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04),
                      child: const Text("Inloggen",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.005),
                      child: const Text("Log in met uw invloggevens",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff969599))),
                    ),

                    ///User name
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Text("Gebruikersnaam",
                          style: TextStyle(
                              fontSize: 15,
                              color: signInProvider.userNameFocus.hasFocus
                                  ? Colors.orange
                                  : const Color(0xff969599))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: TextFormField(
                        controller: signInProvider.userNameCtr,
                        focusNode: signInProvider.userNameFocus,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            width: 0,
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.orange, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(bottom: 4, top: 4),
                          errorStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!isValidEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        onTap: () {
                          signInProvider.userFocus();
                        },
                        onEditingComplete: () {
                          signInProvider.userNameFocus.unfocus();
                        },
                        onChanged: (value) {
                          signInProvider.userFocus();
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: Text("Watchwoord",
                          style: TextStyle(
                              fontSize: 15,
                              color: signInProvider.passWordFocus.hasFocus
                                  ? Colors.orange
                                  : const Color(0xff969599))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: TextFormField(
                        controller: signInProvider.passWordCtr,
                        focusNode: signInProvider.passWordFocus,
                        obscureText: signInProvider.isVisible,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            width: 0,
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.orange, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(bottom: 4, top: 4),
                          errorStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              signInProvider.isVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.black,
                            ),
                            onTap: () {
                              signInProvider.passIsVisible();
                            },
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Password can\'t be empty' : null,
                        onTap: () {
                          signInProvider.passFocus();
                        },
                        onEditingComplete: () {
                          signInProvider.passWordFocus.unfocus();
                        },
                        onChanged: (value) {
                          signInProvider.passFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Watchwoord vergeten?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff969599),
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),

             
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.06),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            signInProvider.submitLogin(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Inloggen",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

bool isValidEmail(String email) {
  final regex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return regex.hasMatch(email);
}
