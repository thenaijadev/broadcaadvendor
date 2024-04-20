// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:broadcaadvendor/core/errors/auth_error.dart';
import 'package:broadcaadvendor/core/errors/local_auth_error.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateIsNotLoggedIn()) {
    on<AuthEventGetCurrentUser>((event, emit) async {
      emit(const AuthStateIsLoading());

      // final authUser = await authProvider();
      // authUser.fold((l) {
      //   emit(AuthStateAuthError(authError: AuthError(message: l.message)));
      // }, (r) {
      //   emit(AuthStateIsLoggedIn(user: r));
      // });
    });

    on<AuthEventCreateUser>((event, emit) async {
      emit(const AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;
      final String userName = event.userName;

      // final authUser = await authProvider.createUser(
      //     email: email, password: password, userName: userName);
      // authUser.fold(
      //     (l) => emit(
      //         AuthStateAuthError(authError: AuthError(message: l.message))),
      //     (r) async {
      //   emit(AuthStateUserCreated(user: r));
      // });
    });

    on<AuthEventLogin>((event, emit) async {
      emit(const AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;

      // final authUser =
      //     await authProvider.logIn(email: email, password: password);
      // authUser.fold(
      //     (l) => emit(
      //           AuthStateAuthError(
      //             authError: AuthError(message: l.message),
      //           ),
      //         ), (r) {
      //   emit(AuthStateIsLoggedIn(user: r));
      // });
    });

    on<AuthEventLogout>((event, emit) async {
      emit(const AuthStateIsLoading());

      // final authUser = await authProvider.logOut();
      // authUser.fold(
      //     (l) => emit(
      //           AuthStateAuthError(
      //             authError: AuthError(message: l.message),
      //           ),
      //         ), (r) {
      //   emit(AuthStateIsNotLoggedIn());
      // });
    });

    on<AuthEventSendEmailVerification>((event, emit) async {
      emit(const AuthStateIsLoading());
      // final authUser = await authProvider.sendEmailVerification();
      // authUser.fold((l) => AuthError(message: l.message), (r) {
      //   emit(const AuthStateEmailVerificationLinkSent());
      // });
    });

    on<AuthEventSendPasswordReset>((event, emit) async {
      emit(const AuthStateIsLoading());
      // final toEmail = event.toEmail;
      // final authUser = await authProvider.sendPasswordReset(toEmail: toEmail);
      // authUser.fold(
      //     (l) => emit(
      //         AuthStateAuthError(authError: AuthError(message: l.message))),
      //     (r) {
      //   emit(const AuthStatePasswordResetSent());
      // });
    });

    on<AuthEventAuthWithBiometrics>((event, emit) async {
      emit(const AuthStateIsLoading());
      // final bioAuth = await authProvider.authenticate();
      // bioAuth.fold(
      //     (l) => emit(AuthStateBiometricsError(
      //         error: LocalAuthError(message: l.message))), (r) {
      //   emit(const AuthStateIsLoggedIn(
      //       user: AuthUserModel(
      //           id: "id", email: "email", isEmailVerified: true)));
      // });
    });
  }
}
