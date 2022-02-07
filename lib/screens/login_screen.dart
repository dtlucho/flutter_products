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
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
