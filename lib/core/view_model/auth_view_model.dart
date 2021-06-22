import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/model/user_model.dart';

class AuthViewModel extends GetxController {
  // ignore: prefer_final_fields
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: prefer_final_fields
  FacebookLogin _facebookLogin = FacebookLogin();

  String email, password, name;

  // If you run with null safety, try it. Change Rn -> Rnx
  // ignore: prefer_final_fields
  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;

  int counter = 0;

  final LocalStorageData localStorageData = Get.find();
  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    //print(_auth.currentUser);
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null)
      {
        getCurrentUserData(_auth.currentUser.uid);
      }
  }


  @override
  void onReady() {
    // ignore: todo
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // ignore: todo
    // TODO: implement onClose
    super.onClose();
  }

  void increment() {
    counter++;
    update();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    // ignore: avoid_print
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);

    final accessToken = result.accessToken.token;

    if (result.status == FacebookLoginStatus.loggedIn) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);

      await _auth.signInWithCredential(faceCredential).then((user) {
        saveUser(user);
        Get.offAll(HomeView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurrentUserData(value.user.uid);
      });
      Get.offAll(HomeView());
    } catch (e) {
      // ignore: avoid_print
      print(e.message);

      Get.snackbar('Error login account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
            saveUser(user);
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        'Error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid) async
  {
    await FireStoreUser().getCurrentUser(uid).then((value){
      setUser(UserModel.fromJson(value.data()));
    });
  }

  void setUser(UserModel userModel)async{
    await localStorageData.setUser(userModel);
  }
}
