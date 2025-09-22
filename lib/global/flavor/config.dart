enum Flavor {
  production,
  dev,
}

// # singleton class: ensures there is only one global instance of a class
class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;

  // declare static variable with the same type as class to create the singleton
  static FlavorConfig? _instance;

  //  create private constructor
  FlavorConfig._(
    this.flavor,
    this.baseUrl,
  );

  // factory constructor: checks if instance is null, if it is, create one, else return existing one
  factory FlavorConfig({
    required Flavor flavor,
    required String baseUrl,
  }) {
    _instance ??= FlavorConfig._(flavor, baseUrl);
    return _instance!;
  }

  // static getter: to get an instance of the class without needing to instantiate it
  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception("FlavorConfig not initialized");
    }
    return _instance!;
  }

  // static checkers
  bool get isProduction => flavor == Flavor.production;

  bool get isDev => flavor == Flavor.dev;
}
