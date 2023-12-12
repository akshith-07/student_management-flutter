// import 'package:loginregister_authentication/controllers/login_controller.dart';
// import 'package:loginregister_authentication/controllers/registration_controller.dart';
// import 'package:loginregister_authentication/screens/auth/widgets/input_fields.dart';
// import 'package:loginregister_authentication/screens/auth/widgets/submit_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   RegisterationController registerationController =
//       Get.put(RegisterationController());

//   LoginController loginController = Get.put(LoginController());

//   var isLogin = false.obs;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(36),
//           child: Center(
//             child: Obx(
//               () => Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                       child: Text(
//                         'WELCOME',
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         MaterialButton(
//                           color: !isLogin.value ? Colors.white : Colors.amber,
//                           onPressed: () {
//                             isLogin.value = false;
//                           },
//                           child: Text('Register'),
//                         ),
//                         MaterialButton(
//                           color: isLogin.value ? Colors.white : Colors.teal,
//                           onPressed: () {
//                             isLogin.value = true;
//                           },
//                           child: Text('Login'),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 80,
//                     ),
//                     isLogin.value ? loginWidget() : registerWidget()
//                   ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget registerWidget() {
//     return Column(
//       children: [
//         InputTextFieldWidget(
//             textEditingController: registerationController.nameController,
//             hintText: 'Enter your name'),
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(
//             textEditingController: registerationController.emailController,
//             hintText: 'Enter email address'),
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(
//           textEditingController: registerationController.passwordController,
//           hintText: 'Enter password',
//           isPassword: true,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         SubmitButton(
//           onPressed: () => registerationController.registerWithEmail(),
//           title: 'Register',
//         )
//       ],
//     );
//   }

//   Widget loginWidget() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(
//             textEditingController: loginController.emailController,
//             hintText: 'Enter email address'),
//         SizedBox(
//           height: 20,
//         ),
//         InputTextFieldWidget(
//           textEditingController: loginController.passwordController,
//           hintText: 'Enter password',
//           isPassword: true,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         SubmitButton(
//           onPressed: () => loginController.loginWithEmail(),
//           title: 'Login',
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginregister_authentication/controllers/login_controller.dart';
import 'package:loginregister_authentication/controllers/registration_controller.dart';
import 'package:loginregister_authentication/screens/auth/widgets/input_fields.dart';
import 'package:loginregister_authentication/screens/auth/widgets/submit_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;

  final _registerFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text(
                      'WELCOME',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: !isLogin.value ? Colors.white : Colors.amber,
                        onPressed: () {
                          isLogin.value = false;
                        },
                        child: Text('Register'),
                      ),
                      MaterialButton(
                        color: isLogin.value ? Colors.white : Colors.teal,
                        onPressed: () {
                          isLogin.value = true;
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  isLogin.value ? loginWidget() : registerWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          InputTextFieldWidget(
            textEditingController: registerationController.nameController,
            hintText: 'Enter your name',
            validator: _validateName,
          ),
          SizedBox(
            height: 20,
          ),
          InputTextFieldWidget(
            textEditingController: registerationController.emailController,
            hintText: 'Enter email address',
            validator: _validateEmail,
          ),
          SizedBox(
            height: 20,
          ),
          InputTextFieldWidget(
            textEditingController: registerationController.passwordController,
            hintText: 'Enter password',
            isPassword: true,
            validator: _validatePassword,
          ),
          SizedBox(
            height: 20,
          ),
          SubmitButton(
            onPressed: () {
              if (_registerFormKey.currentState?.validate() ?? false) {
                registerationController.registerWithEmail();
              }
            },
            title: 'Register',
          )
        ],
      ),
    );
  }

  Widget loginWidget() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InputTextFieldWidget(
            textEditingController: loginController.emailController,
            hintText: 'Enter email address',
            validator: _validateEmail,
          ),
          SizedBox(
            height: 20,
          ),
          InputTextFieldWidget(
            textEditingController: loginController.passwordController,
            hintText: 'Enter password',
            isPassword: true,
            validator: _validatePassword,
          ),
          SizedBox(
            height: 20,
          ),
          SubmitButton(
            onPressed: () {
              if (_loginFormKey.currentState?.validate() ?? false) {
                loginController.loginWithEmail();
              }
            },
            title: 'Login',
          )
        ],
      ),
    );
  }
}
