enum Environment { testing, pro }

Environment env = Environment.testing;

class Constants {
  static String contentDomain = env == Environment.testing
      ? "https://api-testing.sentrip.vn"
      : "https://api.sentrip.vn";
}