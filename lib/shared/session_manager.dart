import 'package:rive_animation/shared/user_info.dart';

class SessionManager {
  static late UserInfo ui;
  static UserInfo currentUserInfo() {
    return SessionManager.ui;
  }

  static void setCurrentUser(UserInfo userInfo) {
    SessionManager.ui = userInfo;
  }
}
