import 'package:broadcaadvendor/app/widgets/primary_button.dart';
import 'package:broadcaadvendor/core/validator/validator.dart';
import 'package:broadcaadvendor/core/widgets/text_widget.dart';
import 'package:broadcaadvendor/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late GlobalKey<FormFieldState> emailKey;
  bool? emailIsValid = false;
  @override
  void initState() {
    emailKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
            child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/forgot_password.png"),
            const SizedBox(
              height: 30,
            ),
            const TextWidget(
              text: "Forgot Password?",
              textAlign: TextAlign.center,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xff030E4F),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text:
                  "Enter your email to verify ,We will send the 4 digit code to your email.",
              textAlign: TextAlign.center,
              fontSize: 21,
              fontWeight: FontWeight.w400,
              color: Color(0xff030E4F),
            ),
            const SizedBox(
              height: 20,
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
                hintText: "Email",
                onChanged: (val) {
                  setState(() {
                    emailIsValid = emailKey.currentState!.validate();
                  });
                },
                textFieldkey: emailKey),
            const SizedBox(
              height: 32,
            ),
            PrimaryButton(
                label: "Submit", onPressed: () {}, isEnabled: emailIsValid!)
          ],
        )),
      ),
    );
  }
}
