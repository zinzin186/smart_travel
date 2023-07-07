enum MainCategory {
  play,
  stay,
  go,
  eat,
  all
}

extension MainCategoryExtension on MainCategory {
  static final _titles = {
    MainCategory.play: "Chơi gì",
    MainCategory.stay: "Ở đâu",
    MainCategory.go: "Đi đâu",
    MainCategory.eat: "Ăn gì",
    MainCategory.all: "Tất cả"
  };
  static final _codes = {
    MainCategory.play: "APP_WHAT_PLAY",
    MainCategory.stay: "APP_WHERE_STAY",
    MainCategory.go: "APP_WHAT_GO",
    MainCategory.eat: "APP_WHAT_EAT",
    MainCategory.all: "APP_WHERE_ALL"
  };

  String get title => _titles[this] ?? "";
  String get code => _codes[this] ?? "";
}