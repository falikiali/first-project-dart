import 'package:app_watchink/screen/login/login_screen_mobile.dart';
import 'package:app_watchink/screen/sign_up/sign_up_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class FirstScreenMobile extends StatelessWidget {
  const FirstScreenMobile({Key? key}) : super(key: key);

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Lottie.asset(
                    'lotties/contact.json'
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      primary: Colors.white
                    ), 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/facebook.png', width: 30, height: 30,),
                          const SizedBox(width: 8.0,),
                          const Text(
                            "Continue with Facebook",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ahellya'
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 8.0,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      primary: Colors.white
                    ), 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/google.png', width: 30, height: 30,),
                          const SizedBox(width: 8.0,),
                          const Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ahellya'
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 8.0,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      primary: Colors.white
                    ), 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/mac.png', width: 30, height: 30,),
                          const SizedBox(width: 8.0,),
                          const Text(
                            "Continue with Apple",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ahellya'
                            ),
                          )
                        ],
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
                          "or",
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)
                        ),
                      ),
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
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          "Sign in with password",
                          style: TextStyle(
                            fontFamily: 'Ahellya',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have any account?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Ahellya'
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            try {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const SignUpScreenMobile();
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
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ahellya'
                            ),
                          ),
                        )
                      ],
                    ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}