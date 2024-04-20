import 'package:broadcaadvendor/config/router/routes.dart';
import 'package:broadcaadvendor/core/widgets/error_screen.dart';
import 'package:broadcaadvendor/features/auth/presentation/screens/login_screen.dart';
import 'package:broadcaadvendor/features/auth/presentation/screens/otp_screen.dart';
import 'package:broadcaadvendor/features/auth/presentation/screens/reset_password.dart';
import 'package:broadcaadvendor/features/auth/presentation/screens/signup_screen.dart';
import 'package:broadcaadvendor/features/auth/presentation/screens/verification_successful.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );

      case Routes.otpVerification:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
      case Routes.verificationSuccessful:
        return MaterialPageRoute(
          builder: (_) => const VerificationSuccessfulScreen(),
        );
      // case Routes.forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgotPasswordScreen(),
      //   );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
