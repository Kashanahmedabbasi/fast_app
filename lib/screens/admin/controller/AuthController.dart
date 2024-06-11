import 'dart:io';

import 'package:fast_app/Utils/constantWidget.dart';
import 'package:fast_app/screens/admin/services/api.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:meego/const/const_variable.dart';
// import 'package:meego/const/goto.dart';

// import 'package:meego/screens/contant_widget/constant_widget.dart';
// import 'package:meego/screens/main_screens/auth/login.dart';
// import 'package:meego/screens/main_screens/home/bottom_nav.dart';
// import 'package:meego/screens/main_screens/profile/account_settings.dart';
// import 'package:meego/service/api_class.dart';
// import 'package:meego/service/base_api.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/current_user.dart';
import '../../../Utils/internet_check.dart';
import '../../../Utils/show_progress.dart';
import '../../../const/const_variable.dart';
import '../../../const/goto.dart';
import '../services/api_class.dart';
import 'SettingController.dart';

class AuthController extends ChangeNotifier {
  late SettingController settingController;
  //
  final TextEditingController cEmail = TextEditingController();
  final TextEditingController cPassword = TextEditingController();
  final TextEditingController cConfirmPassword = TextEditingController();
  final TextEditingController cFName = TextEditingController();
  final TextEditingController cLName = TextEditingController();
  final TextEditingController creferralCode = TextEditingController();
  final TextEditingController cPhoneNumber = TextEditingController();
  //
  bool isRemember = false;
  bool isTermAgree = false;
  static bool fromFacebook = false;
  File image = File('');

  @override
  void dispose() {
    cEmail.dispose();
    cPassword.dispose();
    cPhoneNumber.dispose();

    cConfirmPassword.dispose();
    creferralCode.dispose();
    cFName.dispose();
    cLName.dispose();
    super.dispose();
  }

  void pickImageOS() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      image = File(value!.path);
      notifyListeners();
    });
  }

  //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setisTermAgree(bool v) {
    isTermAgree = v;
    notifyListeners();
  }

  void setisRemember(bool v) {
    isRemember = v;
    notifyListeners();
  }

  Future<void> sginUp() async {
    if (!isTermAgree) {
      showSnackBar('Term & services must Agree');
      return;
    }
    //
    if (formKey.currentState!.validate()) {
      CurrentUser currentUser = CurrentUser.empty();
      currentUser.firstName = cFName.text;
      currentUser.lastName = cLName.text;
      currentUser.username = '${cFName.text} ${cLName.text}';
      currentUser.mobile = cPhoneNumber.text;
      currentUser.password = cPassword.text;
      currentUser.referalCode = creferralCode.text;
      currentUser.email = cEmail.text;
      currentUser.profilePicture = image.path;
      //
      showProgress();
      //
      var res = await SignUp(user: currentUser, isSocialLogin: false);

      // debug("ddd: ${res.data}");

      //
      if (res.statusCode == 201) {
        showSnackBar(res.message);
        var pref = await SharedPreferences.getInstance();
        String pass = "";
        String email = "";
        bool remember = false;
        if (pref.getString('password') != null &&
            pref.getString('email') != null) {
          pass = pref.getString('password').toString();
          email = pref.getString('email').toString();
          remember = pref.getBool('isRemember')!;
        }
        // Goto.pushAndRemove(LoginScreen(
        //   password: pass,
        //   email: email,
        //   remember: remember,
        // ));
        return;
      } else {
        if (res.data['message'].toString() != 'null') {
          showSnackBar(res.data['message'].toString());
        }
      }
      Goto.pop();
    }
  }

  Future<dynamic> sginUpFromSocial(CurrentUser currentUser) async {
    {
      showProgress();
      //
      final res = await SignUp(user: currentUser, isSocialLogin: true);

      //
      if (res.statusCode == 201) {
        if (res.data.toString().isNotEmpty) {
          if (res.data['message'].toString() != 'null' &&
              res.data['message'].toString() != '' &&
              res.data['message'] != null) {
            showSnackBar(res.data['message'].toString());
          }
        } else {
          showSnackBar(res.message.toString());
        }
        debug(res.data.toString());
        return res;
      } else {
        if (res.data['message'].toString() != 'null' &&
            res.data['message'].toString() != '') {
          showSnackBar(res.data['message'].toString());
        }
      }
      return [];
    }
  }

  bool getIsProfileDone() {
    //final user = settingController.currentUser;
    // if (user.firstName.isEmpty ||
    //     user.lastName.isEmpty ||
    //     user.password.isEmpty ||
    //     user.email.isEmpty) {
    //   return false;
    // }
    // settingController.boxSettings.put('profileDone', 'true');
    return true;
  }

  //
  //

  // Future<void> signInWithFacebook() async {
  //   try {
  //     bool isConnected = await checkConnectivity();
  //     if (isConnected) {
  //       fromFacebook = true;
  //       showProgress();
  //       final LoginResult loginResult = await FacebookAuth.instance.login(
  //         permissions: ['email', 'public_profile'],
  //         loginBehavior: LoginBehavior.katanaOnly,
  //       );

  //       if (loginResult.status == LoginStatus.success) {
  //         print(loginResult.status.toString());
  //         final facebookAuthCredential =
  //             await FacebookAuth.instance.getUserData();
  //         //print(facebookAuthCredential);
  //         debug(facebookAuthCredential);

  //         CurrentUser currentUser = CurrentUser.empty();
  //         currentUser.username = facebookAuthCredential['name'].toString();
  //         currentUser.email = facebookAuthCredential['email'].toString();
  //         currentUser.profilePicture =
  //             facebookAuthCredential['picture']['data']['url'].toString();

  //         final response = await sginUpFromSocial(currentUser);
  //         if (response is ApiResponse) {
  //           settingController.boxProfile.clear();
  //           currentUser.id = response.data['userId'];
  //           if (response.data['user'] != null) {
  //             currentUser = CurrentUser.fromMap(response.data['user']);
  //           }
  //           settingController.currentIndex = 0;
  //           settingController.currentUser = currentUser;
  //           settingController.boxProfile.add(currentUser.toJson());
  //           await BaseApi().updateToke(settingController.currentUser.id);
  //           Goto.pop();
  //           Goto.pushAndRemove(AuthController().getIsProfileDone()
  //               ? const BottomNavigationWidget()
  //               : const MyAccountSettings());
  //         } else {
  //           Goto.pop();
  //           showSnackBar('Failed');
  //         }
  //       } else {
  //         Goto.pop();
  //         print(loginResult.message);
  //         showSnackBar('Failed');
  //       }
  //     } else {
  //       showSnackBar('No Internet');
  //     }
  //   } catch (e) {
  //     Goto.pop();
  //     showSnackBar('Failed ');
  //     debug("Exception - signInScreen.dart - _signInWithFacebook():$e");
  //   }
  // }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
      bool isConnected = await checkConnectivity();
      if (isConnected) {
        showProgress(); // circle progress
        try {
          debug(googleSignIn.currentUser!.email);
          googleSignIn.currentUser!.clearAuthCache();
          // await FirebaseAuth.instance.signOut();
          await googleSignIn.signOut();
          await googleSignIn.disconnect();
        } catch (e) {
          debug('Error: $e');
        }
        // showOnlyLoaderDialog();
        await googleSignIn.signIn().then((value) async {
          debug(value);
          print("done");
          Goto.pop();
          if (value != null) {
            print("done1");
            await value.authentication.then((value1) async {
              print("done2");
              debug(value1.toString());
              debug("CHECK: ${googleSignIn.currentUser!.email}");
              Goto.pop();
              if (googleSignIn.currentUser!.email.isNotEmpty) {
                CurrentUser currentUser = CurrentUser.empty();
                currentUser.username =
                    googleSignIn.currentUser!.displayName!.toString();
                currentUser.firstName = currentUser.username.split(' ').first;
                currentUser.lastName = currentUser.username.split(' ').last;
                currentUser.email = googleSignIn.currentUser!.email.toString();

                final response = await sginUpFromSocial(currentUser);

                if (response is ApiResponse) {
                  print("done3");

                  ///
                  print(response.statusCode.toString());
                  if (response.statusCode == 201) {
                    debug(response.toString());
                    // settingController.boxProfile.clear();
                    if (response.data.toString().isNotEmpty) {
                      print("done4");
                      if (response.data['user'] != null) {
                        currentUser =
                            CurrentUser.fromMap(response.data['user']);
                      }
                    }

                    //settingController.currentIndex = 0;
                    print(currentUser.id);
                    currentUser.id = response.data.toString().isEmpty
                        ? -1
                        : response.data['userId'];
                    // settingController.currentUser = currentUser;
                    // settingController.boxProfile.add(currentUser.toJson());
                    // settingController.notifyListeners();
                    //

                    //TOChange
                    await updateToke(23);
                    // Goto.pushAndRemove(AuthController().getIsProfileDone()
                    //     ? const BottomNavigationWidget()
                    //     : const MyAccountSettings());
                  } else {
                    Goto.pop();
                    if (response.message.toString() != "null") {
                      debug(response.message.toString());
                      showSnackBar(response.message.toString());
                    }
                  }
                } else {
                  Goto.pop();
                  showSnackBar('Failed To Get Data From Google');
                }

                ///
              } else {}
            });
          } else {
            Goto.pop();
          }
        }).catchError((e) {
          debug("ERROR: $e");
          Goto.pop();
        });
      } else {
        showSnackBar('No Internet');
        Goto.pop();
      }
    } catch (e) {
      Goto.pop();
      debug("Exception - signInScreen.dart - _signInWithGoogle():$e");
    }
  }

  ///
  Future<void> loginWithEmail(
      {required GlobalKey<FormState> key, checked}) async {
    try {
      FocusScope.of(navigatorKey.currentContext!).unfocus();
      // Goto.pushAndRemove(const BottomNavigationWidget());
      //

      if (key.currentState!.validate()) {
        /// countine
        showProgress(); // circle progress

        final resp = await login(
            email: cEmail.text, password: cPassword.text, role: 'User');
        debug(resp.data);
        // Goto.pop();
        final json = (resp.data);
        if (resp.statusCode == 200 && resp.data['statusCode'] == 200) {
          // When Auth DONS
          CurrentUser currentUser = CurrentUser.fromMap(json['user']);
          debug(currentUser.toString());
          currentUser.token = json['token'];
          currentUser.password = cPassword.text;
          var pref = await SharedPreferences.getInstance();
          if (checked) {
            await pref.setString('password', cPassword.text.trim());
            await pref.setString('email', cEmail.text.trim());
            await pref.setBool('isRemember', checked);
          } else {
            await pref.setString('password', "");
            await pref.setString('email', "");
            await pref.setBool('isRemember', checked);
          }
          // settingController.boxProfile.clear();
          // settingController.boxProfile.add(currentUser.toJson());
          // settingController.boxProfile.put(keyintro, "");

          // settingController.currentIndex = 0;
          // settingController.currentUser = currentUser;
          await updateToke(settingController.currentUser!.id);
          // Goto.pushAndRemove(AuthController().getIsProfileDone()
          //     ? const BottomNavigationWidget()
          //     : const MyAccountSettings());
        } else {
          if (resp.data['message'].toString() != 'null') {
            showSnackBar(resp.data['message'].toString());
          }
        }

        ///
      } else {
        showSnackBar('Fill All Fields');
      }
      //
    } catch (e) {
      showSnackBar('Failed ! \n $e');
      debug("Exception - signInScreen.dart - _loginWithEmail():$e");
    }
    Goto.pop();
  }
  ////
}
