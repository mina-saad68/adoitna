import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunction {
  static createAcount(
      String email, String pass, Function onSuccess, Function onError) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);

        print('The account already exists for that email.');
      }
      onError(e.message);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  static login(String email, String pass,Function onSuccess, Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if(credential.user!.emailVerified){
        onSuccess();
      }else{
        onError('please verify your account');
      }

    } on FirebaseAuthException catch (e) {

      onError(e.code);
    }
  }
}
