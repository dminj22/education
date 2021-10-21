import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  signInOption: SignInOption.standard,
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> googleSignIn(context) async {
  try {
    GoogleSignInAccount? user  =    await _googleSignIn.signIn();
    if(user!.id.isNotEmpty){
      Navigator.pushNamed(context, '/homePage');
    }
  } catch (error) {
    print(error);
  }
}