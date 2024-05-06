import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  String? token;
  String? appCheckToken;

  Future<void> getToken() async {
    try {
      token = await FirebaseAuth.instance.currentUser!.getIdToken(false);

      print("Get token Successfully");
    } on FirebaseAuthException catch (e, stackTrace) {
      print(stackTrace);
    } on Exception catch (e, stackTrace) {
      print(stackTrace);

    }
  }
Future<void> currentUser() async{
    try{
      FirebaseAuth.instance.currentUser!=null;
          print(FirebaseAuth.instance.currentUser!.email!);
          getTok();

    }
    catch(e){
      print(e);
    }
}
  Future<void> getAppCheck() async {
    // try {
    //   appCheckToken = await FirebaseAppCheck.instance.getToken(false);
    //   print("Get AppCheck Successfully");
    // } on FirebaseAuthException catch (e, stackTrace) {
    //   getSnackBar(typeSnackBar: TypeSnackBar.error, text: e.message);
    //   FirebaseCrashlytics.instance.recordError(e, stackTrace);
    // } on Exception catch (e, stackTrace) {
    //   FirebaseCrashlytics.instance.recordError(e, stackTrace);
    // }
  }

  // test token
  void getTok() {
    print(token.toString().substring(0, 505));
    print("---------token------------");
    print(token.toString().substring(500, token!.length));
    print(token!.length);
  }

  void getAppk() {
    print(appCheckToken.toString().substring(0, 505));
    print("---------appcheck------------");
    print(appCheckToken.toString().substring(500, appCheckToken!.length));
    print(appCheckToken!.length);
  }
}
