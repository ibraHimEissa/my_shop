// ignore_for_file: prefer_const_constructors
import 'dart:developer';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/components/custom_surffix_icon.dart';
import 'package:my_shop/components/default_button.dart';
import 'package:my_shop/components/form_error.dart';
import 'package:my_shop/components/toast.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/helper/keyboard.dart';
import 'package:my_shop/models/screens/home/home_screen.dart';
import 'package:my_shop/models/screens/sign_in/cubit/cubit.dart';
import 'package:my_shop/models/screens/sign_in/cubit/states.dart';
import 'package:my_shop/network/local/cache_helper.dart';
import 'package:my_shop/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final List<String?> errors = [];
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessStates) {
            if (state.signInModel.status) {
              showToast(
                  msg: state.signInModel.message, bgColor: Colors.greenAccent);
              if (remember == true) {
                CacheHelper.putData(
                        key: 'token', value: state.signInModel.data!.token)
                    .then((value) {
                });
              }
              Token = state.signInModel.data!.token;
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            } else {
              showToast(
                  msg: state.signInModel.message, bgColor: Colors.redAccent);
            }
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                buildEmailFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPasswordFormField(onSubmit: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                    KeyboardUtil.hideKeyboard(context);
                    ShopLoginCubit.get(context).userLogin(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    /*Navigator.pushNamed(context, LoginSuccessScreen.routeName);*/
                  }
                }),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      activeColor: ePrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          remember = value;
                          log(remember.toString());
                        });
                      },
                    ),
                    Text("Remember me"),
                    Spacer(),
                    GestureDetector(
                      onTap: () =>
                          {} /*Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName)*/
                      ,
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                FormError(errors: errors),
                SizedBox(height: getProportionateScreenHeight(20)),
                BuildCondition(
                  condition: state is! ShopLoginLoadingStates,
                  builder: (context) => DefaultButton(
                    text: "Continue",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // if all are valid then go to success screen
                        KeyboardUtil.hideKeyboard(context);
                        ShopLoginCubit.get(context).userLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        /*Navigator.pushNamed(context, LoginSuccessScreen.routeName);*/
                      }
                    },
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
        },
      );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: eEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: eInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: eEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: eInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField({
    Function? onSubmit,
  }) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onFieldSubmitted: (value) {
        onSubmit!();
      },
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: ePassNullError);
        } else if (value.length >= 8) {
          removeError(error: eShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: ePassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: eShortPassError);
          return "";
        }
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
