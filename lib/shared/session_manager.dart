import 'package:rive_animation/shared/user_info.dart';

class SessionManager {
  static late UserInfo ui;
  static UserInfo currentUserInfo() {
    return SessionManager.ui;
    // return "2ad1e65f-3691-4418-a6d3-df11e97e659a";
  }

  static void setCurrentUser(UserInfo userInfo) {
    SessionManager.ui = userInfo;
  }
}
