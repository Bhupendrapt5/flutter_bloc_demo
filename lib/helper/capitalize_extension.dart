extension CapitalizeFirstLetter on String {
  String get capitalizeFirstLetter => this[0].toUpperCase() + this.substring(1);
}
