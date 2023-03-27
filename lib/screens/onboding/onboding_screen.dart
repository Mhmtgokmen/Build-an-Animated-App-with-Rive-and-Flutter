import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/entryPoint/entry_point.dart';
import 'package:rive_animation/service/login_service.dart';
import 'package:rive_animation/shared/session_manager.dart';
import 'package:rive_animation/shared/user_info.dart';
import 'package:rive_animation/shared/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/animated_btn.dart';
import 'components/sign_in_dialog.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;
  final LoginService _loginService = LoginService();
  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
    sharedLogin();
  }

  Future<void> sharedLogin() {
    return Future.delayed(
      const Duration(seconds: 1),
      () async {
        try {
          var prefs = await SharedPreferences.getInstance();
          String? session = prefs.getString("session");
          if (session == null) {
            // setState(() {
            //   isShowSignInDialog = true;
            // });

            // ignore: use_build_context_synchronously
            return showCustomDialog(
              context,
              onValue: (_) {
                setState(() {
                  isShowSignInDialog = false;
                });
              },
            );
          } else {
            var loginReturnInfo =
                await _loginService.getAuthenticatedUser(session);
            if (loginReturnInfo.isLoginRequired == true) {
              //ignore: use_build_context_synchronously
              return showCustomDialog(
                context,
                onValue: (_) {
                  setState(() {
                    isShowSignInDialog = false;
                  });
                },
              );
            } else if (loginReturnInfo.isSuccess) {
              SessionManager.setCurrentUser(loginReturnInfo.data);
              prefs.setString(
                  'session', (loginReturnInfo.data as UserInfo).sessionId);
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EntryPoint(),
                ),
              );
            } else {
              // ignore: use_build_context_synchronously
              return showCustomDialog(
                context,
                onValue: (_) {
                  setState(() {
                    isShowSignInDialog = false;
                  });
                },
              );
            }
          }
        } on Exception catch (_) {
          Utilities.showMessage(context: context, message: _.toString());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isShowSignInDialog = true;
                            });
                            showCustomDialog(
                              context,
                              onValue: (_) {
                                setState(() {
                                  isShowSignInDialog = false;
                                });
                              },
                            );
                          },
                        );
                        // sharedLogin();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
