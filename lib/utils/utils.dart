class Utils {
  static bool isEmailValid(String? email) {
    if (email?.isNotEmpty == false) {
      return false;
    }

    String source =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(source).hasMatch(email!);
  }

  static bool passwordMinSize(String s, {int minSize = 8}) {
    return s.length >= minSize;
  }
}
