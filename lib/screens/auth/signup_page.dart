import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/auth_bloc/auth_bloc/auth_cubit.dart';
import 'package:komiwall/blocs/auth_bloc/auth_bloc/auth_states.dart';
import 'package:komiwall/screens/auth/welcome_page.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_navigation.dart';
import 'package:komiwall/src/app_size.dart';

import '../index.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checked = false;
  bool obscure = true;
  showPassword() {
    setState(() {
      obscure = !obscure;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is AuthSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1), content: Text(state.msg)));
        AppNavigation.pushR(context, const IndexPage());
      }
      if (state is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text(state.errMsg)));
      }
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Scaffold(
        backgroundColor: AppColor.redP,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: AppSize.height(context) * 0.35,
                  decoration: const BoxDecoration(
                      color: AppColor.blueP,
                      borderRadius: BorderRadiusDirectional.vertical(
                          bottom: Radius.elliptical(200, 100)),
                      image: DecorationImage(
                        scale: 2,
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 8),
                  child: GestureDetector(
                    onTap: () =>
                        AppNavigation.pushR(context, const WelcomePage()),
                    child: Image.asset(
                      'assets/icons/back.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kToolbarHeight,
            ),
            const Center(
                child: Text(
              'please fill all fields',
              style: TextStyle(fontSize: 14, letterSpacing: 1),
            )),
            const SizedBox(
              height: kToolbarHeight / 3,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(context) * 0.15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                            obscuringCharacter: '@',
                            controller: cubit.username,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: fieldDecoration('username', 'user')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: cubit.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!value.contains('@') ||
                                  value.isEmpty ||
                                  !value.contains('.')) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: fieldDecoration('email', 'email')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                            obscuringCharacter: '@',
                            controller: cubit.password,
                            obscureText: obscure,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 6) {
                                return 'atleast 7 characters';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration:
                                fieldDecoration('password', 'password')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                            obscuringCharacter: '@',
                            obscureText: obscure,
                            controller: cubit.confirmPassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm password';
                              } else if (value != cubit.password.text) {
                                return 'mismatched passwords';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: fieldDecoration(
                                'confirm password', 'password')),
                      ),
                      Row(children: [
                        Checkbox(
                          value: checked,
                          onChanged: (value) {
                            setState(() {
                              checked = value!;
                            });
                          },
                        ),
                        const Text(
                          'agree to our terms and conditions',
                          style: TextStyle(color: Colors.black, fontSize: 8),
                        )
                      ]),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate() &&
                              checked == true) {
                            cubit.registerUser();
                          } else if (checked != true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Agree to continue')),
                            );
                          }
                        },
                        child: Container(
                          width: AppSize.width(context) * 0.7,
                          height: AppSize.height(context) * 0.07,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              border: Border.all(width: 3),
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(75),
                                  right: Radius.circular(75))),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(letterSpacing: 1, fontSize: 30),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      );
    });
  }

  fieldDecoration(hint, icon) {
    return InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        border: const UnderlineInputBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(75), right: Radius.circular(75))),
        prefixIcon: Image.asset(
          'assets/icons/$icon.png',
          height: 24,
          width: 24,
        ),
        suffixIcon: hint == 'password' || hint == 'confirm password'
            ? IconButton(
                onPressed: () {
                  showPassword();
                },
                icon: Icon(obscure == true
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined))
            : null,
        errorStyle: const TextStyle(color: AppColor.redS),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 17, color: Colors.grey.shade400),
        filled: true,
        fillColor: AppColor.blueP);
  }
}
