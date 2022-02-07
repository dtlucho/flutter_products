import 'package:flutter/material.dart';
import 'package:flutter_products/providers/login_form_provider.dart';
import 'package:flutter_products/ui/form_input_decoration.dart';
import 'package:flutter_products/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
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
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginFormProvider.formKey,
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
              onChanged: (value) => loginFormProvider.email = value,
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
              onChanged: (value) => loginFormProvider.password = value,
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
                child: Text(
                  loginFormProvider.isLoading ? 'Loading' : 'Log in',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              onPressed: loginFormProvider.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!loginFormProvider.isValid()) return;

                      loginFormProvider.isLoading = true;
                      await Future.delayed(const Duration(seconds: 3));
                      loginFormProvider.isLoading = false;

                      Navigator.pushReplacementNamed(context, 'home');
                    },
            ),
          ],
        ),
      ),
    );
  }
}
