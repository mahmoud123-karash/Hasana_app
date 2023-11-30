class JuzPage {
  static int navigateToFirstPage(juzNumber) {
    if (juzNumber == 1) {
      return ((juzNumber - 1) * 20);
    } else {
      return ((juzNumber - 1) * 20) + 1;
    }
  }
}
