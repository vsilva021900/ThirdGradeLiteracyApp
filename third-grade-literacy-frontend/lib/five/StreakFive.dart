class StreakFive {
  // [0] -> 5
  // [1] -> 5.1
  // [2] -> 5.2
  // [3] -> 5.3
  static List<int> streak = [0, 0, 0, 0];
  static List<int> maxStreak = [0, 0, 0, 0];

  static correct(int index) {
    if (maxStreak[index] < 5) {
      maxStreak[index] += 1;
    }
    if (streak[index] < 5) {
      streak[index] += 1;
    }
  }

  static incorrect(int index) {
    if (streak[index] > 0) {
      streak[index] -= 1;
    }
  }

  static String getImagePath(int index) {
    int s = streak[index];
    int maxS = maxStreak[index];

    return _imagePaths[s][maxS - s];
  }

  // [# gold] [ # silver]
  static var _imagePaths = [
    // 0 gold
    ["", "assets/stars/one_silver.png", "assets/stars/two_silver.png", "assets/stars/three_silver.png",
      "assets/stars/four_silver.png", "assets/stars/five_silver.png"],
    // 1 gold
    ["assets/stars/one_gold.png", "assets/stars/one_gold_one_silver.png", "assets/stars/one_gold_two_silver.png",
      "assets/stars/one_gold_three_silver.png", "assets/stars/one_gold_four_silver.png"],
    // 2 gold
    ["assets/stars/two_gold.png", "assets/stars/two_gold_one_silver.png", "assets/stars/two_gold_two_silver.png",
      "assets/stars/two_gold_three_silver.png"],
    // 3 gold
    ["assets/stars/three_gold.png", "assets/stars/three_gold_one_silver.png", "assets/stars/three_gold_two_silver.png"],
    // 4 gold
    ["assets/stars/four_gold.png", "assets/stars/four_gold_one_silver.png"],
    // 5 gold
    ["assets/stars/five_gold.png"]
  ];
}