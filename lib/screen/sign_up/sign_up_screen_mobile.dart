import 'package:app_watchink/screen/login/login_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../home/main_screen_mobile.dart';

class SignUpScreenMobile extends StatefulWidget {
  const SignUpScreenMobile({Key? key}) : super(key: key);

  @override
  State<SignUpScreenMobile> createState() => _SignUpScreenMobileState();
}

class _SignUpScreenMobileState extends State<SignUpScreenMobile> {
  late bool _isVisible;
  late bool _isRememberMe;

  final emailController = TextEditingController();
  
  @override
  void initState() {
    _isRememberMe = false;
    _isVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void toggleVisibilityPass() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void toggleRememberMe(bool value) {
    setState(() {
      _isRememberMe = value;
    });
    // print("Is remember me ? $_isRememberMe");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back, 
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0,),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Create your",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontFamily: 'PirataOne',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Account",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontFamily: 'PirataOne',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 230, 230),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          fontFamily: 'Ahellya',
                          fontSize: 14.0
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 230, 230, 230)
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2
                          )
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                        )
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  )
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      obscureText: _isVisible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 230, 230, 230),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          fontFamily: 'Ahellya',
                          fontSize: 14.0
                        ),
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 230, 230, 230),
                          )
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Colors.black, 
                            width: 2
                          )
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            toggleVisibilityPass();
                          }, 
                          icon: Icon(
                            _isVisible ? Icons.visibility : Icons.visibility_off
                          )
                        )
                      ),
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)
                        ),
                        side: const BorderSide(
                          color: Colors.black,
                        ), 
                        value: _isRememberMe, 
                        onChanged: (bool? value) { toggleRememberMe(value!); },
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          fontFamily: 'Ahellya',
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)
                        ),
                      ),
                      onPressed: () {
                        try {
                          if(emailController.text != "") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const MainScreenMobile();
                            }));

                            Fluttertoast.showToast(
                              msg: "${emailController.text} successfully registered and logged in!",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 12.0,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Email cannot be empty!",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 12.0,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                            );
                          }
                        } catch(e, s) {
                          Fluttertoast.showToast(
                              msg: "There is an error!",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 12.0,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                            );
                          print('Exception: $e');
                          print('Stack trace: $s');
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: 'Ahellya',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        ),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {}, 
                    child: const Text(
                      "Forgot the password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ahellya'
                      ),
                    )
                  ),
                ),
                Expanded(
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 64.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Ahellya'
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 64.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          width: 75.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 1
                              )
                            ), 
                            child: Image.asset('images/facebook.png', height: 30, width: 30,),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Container(
                          width: 75.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 1
                              )
                            ), 
                            child: Image.asset('images/google.png', height: 30, width: 30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Container(
                          width: 75.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 1
                              )
                            ), 
                            child: Image.asset('images/mac.png', height: 30, width: 30),
                          ),
                        ),
                      )
                    ],
                  ),
                ),             
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Ahellya'
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          try {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const LoginScreenMobile();
                            }));
                          } catch(e, s) {
                            Fluttertoast.showToast(
                              msg: "There is an error!",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 12.0,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                            );
                            print('Exception: $e');
                            print('Stack trace: $s');
                          }
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ahellya'
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}