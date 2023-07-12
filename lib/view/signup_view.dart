import 'package:flutter/material.dart';
import 'package:flutter_app_with_mvvm/res/components/round_buttons.dart';
import 'package:flutter_app_with_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_app_with_mvvm/utils/utils.dart';
import 'package:flutter_app_with_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emilFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emilFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: emailController,
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(context, emilFocusNode, passwordFocusNode);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Enter Email Id",
              labelText: " Email Id",
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            focusNode: passwordFocusNode,
            decoration: const InputDecoration(
                hintText: "Enter Password",
                labelText: " Password",
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: InkWell(child: Icon(Icons.visibility_off_rounded))),
          ),
          SizedBox(
            height: height * .05,
          ),
          RoundButton(
            loading: authViewMode.signUpLoading,
            title: "Sign Up",
            onPress: () {
              if (emailController.text.isEmpty) {
                Utils.flushBarErrorMessage("Please Enter Email", context);
              } else if (passwordController.text.isEmpty) {
                Utils.flushBarErrorMessage("Please Enter Password", context);
              } else if (passwordController.text.length < 6) {
                Utils.flushBarErrorMessage(
                    "Please Enter 6 Digits Password", context);
              } else {
                Map data = {
                  "email": emailController.text.toString(),
                  "password": passwordController.text.toString(),
                };
                authViewMode.signUpApi(data, context);
              }
            },
          ),
          SizedBox(
            height: height * .05,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: Text("Already Have An Account"))
        ]),
      ),
    );
  }
}
