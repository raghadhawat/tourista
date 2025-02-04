import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit(this.authRepo) : super(SignInWithGoogleInitial()) {
    _googleSignIn = GoogleSignIn(scopes: ['email']);
  }

  final AuthRepo authRepo;
  late final GoogleSignIn _googleSignIn;

  Future<void> signInWithGoogle() async {
    try {
      emit(SignInWithGoogleLoading());

      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        emit(SignInWithGoogleSuccess(googleUser: googleUser));
      } else {
        // emit(SignInWithGoogleFailure('Google Sign-In failed'));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during Google Sign-In: $e');
      }
      emit(SignInWithGoogleFailure('An error occurred during Google Sign-In'));
    }
  }
}

/*import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit(this.authRepo) : super(SignInWithGoogleInitial());

  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      emit(SignInWithGoogleLoading());
      await googleSignIn.signOut(); // Sign out any previously signed-in user

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      //   final GoogleSignInAuthentication? googleAuth =
      //      await googleUser?.authentication;
      // Create a new credential
      //    final credential = GoogleAuthProvider.credential(
      //  accessToken: googleAuth?.accessToken,
      //      idToken: googleAuth?.idToken,
      //    );

      // Once signed in, return the UserCredential
      //  await FirebaseAuth.instance.signInWithCredential(credential);
      if (googleUser != null) {
        try {
          emit(SignInWithGoogleSuccess(googleUser: googleUser));
        } catch (e) {
          emit(SignInWithGoogleFailure('Error sending user info to server'));
        }
      } else {
        emit(SignInWithGoogleFailure('Google Sign-In failed'));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during Google Sign-In: $e');
      }

      emit(SignInWithGoogleFailure('An error occurred during Google Sign-In'));
    }
  }
}*/
