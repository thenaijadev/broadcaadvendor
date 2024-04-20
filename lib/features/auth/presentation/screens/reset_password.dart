import 'package:broadcaadvendor/app/widgets/primary_button.dart';
import 'package:broadcaadvendor/core/validator/validator.dart';
import 'package:broadcaadvendor/core/widgets/text_widget.dart';
import 'package:broadcaadvendor/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late GlobalKey<FormFieldState> confirmPasswordKey;
  late GlobalKey<FormFieldState> passwordKey;
  bool obscureText = false;

  bool confirmPasswordIsValids = false;
  bool passwordIsValid = false;

  @override
  void initState() {
    confirmPasswordKey = GlobalKey<FormFieldState>();
    passwordKey = GlobalKey<FormFieldState>();
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
            Image.asset("assets/images/reset_password.png"),
            const SizedBox(
              height: 30,
            ),
            const TextWidget(
              text: "Reset Password",
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
                  "Set the password to your account so you can login and access all the content.",
              textAlign: TextAlign.center,
              fontSize: 21,
              fontWeight: FontWeight.w400,
              color: Color(0xff030E4F),
            ),
            const SizedBox(
              height: 20,
            ),
            InputFieldWidget(
              enabledBorderRadius: 5,
              obscureText: obscureText,
              hintColor: const Color.fromARGB(120, 58, 58, 58),
              hintSize: 18,
              hintText: "Password",
              validator: (p0) {
                final passwordState =
                    Validator.validatePassword(passwordKey.currentState?.value);
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
                icon: Icon(obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
            InputFieldWidget(
              enabledBorderRadius: 5,
              obscureText: obscureText,
              hintColor: const Color.fromARGB(120, 58, 58, 58),
              hintSize: 18,
              hintText: "Confirm Passwords",
              validator: (p0) {
                final confirmPasswordState = Validator.validateConfirmPassword(
                    value: confirmPasswordKey.currentState?.value,
                    firstPassword: passwordKey.currentState?.value);
                return confirmPasswordState;
              },
              onChanged: (val) {
                setState(() {
                  confirmPasswordIsValids =
                      confirmPasswordKey.currentState!.validate();
                });
              },
              textFieldkey: confirmPasswordKey,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            PrimaryButton(
                label: "Submit",
                onPressed: () {},
                isEnabled: passwordIsValid && confirmPasswordIsValids)
          ],
        )),
      ),
    );
  }
}
