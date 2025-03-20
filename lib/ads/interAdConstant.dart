class InterAdconstant {
  static int interAdCounter = 2;
  static int clickCounter = 0;

  static clickcounter(bool reset) {
    reset ? clickCounter = 0 : clickCounter = clickCounter + 1;
  }
}
