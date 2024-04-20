import 'package:broadcaadvendor/app/enums/enums.dart';
import 'package:broadcaadvendor/app/widgets/oauth_button.dart';
import 'package:broadcaadvendor/app/widgets/primary_button.dart';
import 'package:broadcaadvendor/config/router/routes.dart';
import 'package:broadcaadvendor/core/validator/validator.dart';
import 'package:broadcaadvendor/core/widgets/text_widget.dart';
import 'package:broadcaadvendor/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late GlobalKey<FormFieldState> emailKey;
  late GlobalKey<FormFieldState> passwordKey;
  late GlobalKey<FormFieldState> nameKey;
  bool obscureText = true;
  bool emailIsValid = false;

  bool nameIsValid = false;
  bool passwordIsValid = false;

  @override
  void initState() {
    emailKey = GlobalKey<FormFieldState>();
    passwordKey = GlobalKey<FormFieldState>();
    nameKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/auth_logo.png",
                  width: 350,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: "Sign Up",
                  color: theme.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                InputFieldWidget(
                    validator: (p0) {
                      final nameState = Validator.validateText(
                          nameKey.currentState?.value, "Full Name");
                      return nameState;
                    },
                    enabledBorderRadius: 5,
                    hintColor: const Color.fromARGB(120, 58, 58, 58),
                    hintSize: 18,
                    hintText: "Full Name",
                    onChanged: (val) {
                      setState(() {
                        nameIsValid = nameKey.currentState!.validate();
                      });
                    },
                    textFieldkey: nameKey),
                InputFieldWidget(
                  enabledBorderRadius: 5,
                  obscureText: obscureText,
                  hintColor: const Color.fromARGB(120, 58, 58, 58),
                  hintSize: 18,
                  hintText: "Password",
                  validator: (p0) {
                    final passwordState = Validator.validatePassword(
                        passwordKey.currentState?.value);
                    return passwordState;
                  },
                  onChanged: (val) {
                    setState(() {
                      passwordIsValid = passwordKey.currentState!.validate();
                    });
                  },
                  textFieldkey: passwordKey,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                    ),
                  ),
                ),
                InputFieldWidget(
                    validator: (p0) {
                      final emailState =
                          Validator.validateEmail(emailKey.currentState?.value);
                      return emailState;
                    },
                    enabledBorderRadius: 5,
                    hintColor: const Color.fromARGB(120, 58, 58, 58),
                    hintSize: 18,
                    hintText: "Email/Phone number",
                    onChanged: (val) {
                      setState(() {
                        emailIsValid = emailKey.currentState!.validate();
                      });
                    },
                    textFieldkey: emailKey),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  label: "Sign Up",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.otpVerification);
                  },
                  isEnabled: emailIsValid && passwordIsValid && nameIsValid,
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: "Forgot Password?",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF49F1C),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: "OR",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 20,
                ),
                OAuthButton(
                  type: ButtonType.google,
                  onPressed: () {},
                  label: "Continue with Google",
                ),
                OAuthButton(
                  type: ButtonType.facebook,
                  onPressed: () {},
                  label: "Continue with Facebook",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "Already have an account?",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      text: "Login",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffF49F1C),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
