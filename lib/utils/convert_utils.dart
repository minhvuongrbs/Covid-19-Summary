class ConvertUntils {
  static insertCommasToNumber(int number) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';

    return number.toString().replaceAllMapped(reg, mathFunc);
  }
}
