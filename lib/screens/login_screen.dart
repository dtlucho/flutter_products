import 'package:flutter/material.dart';
import 'package:flutter_products/ui/form_input_decoration.dart';
import 'package:flutter_products/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text("Login", style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 30),
                    const _LoginForm(),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              const Text(
                "Create a new account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: FormInputDecoration.authInputDecoration(
                hintText: "john.doe@email.com",
                labelText: "Email",
                prefixIcon: Icons.alternate_email_sharp,
              ),
              validator: (value) {
                String _pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp _regExp = RegExp(_pattern);
                return _regExp.hasMatch(value ?? '') ? null : 'Invalid email';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: FormInputDecoration.authInputDecoration(
                hintText: "*****",
                labelText: "Password",
                prefixIcon: Icons.lock_outline,
              ),
              validator: (value) {
                return value != null && value.length >= 6
                    ? null
                    : 'Password requires at least 6 characters';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledColor: Colors.grey,
              color: Colors.deepPurple,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 15.0,
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
