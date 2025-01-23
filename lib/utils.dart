class Utils {

  static String getUsernameFromEmail(String email) {
    if (email.contains('@')) {
      return email.split('@')[0];
    } else {
      throw ArgumentError("Invalid email format");
    }
  }
}

