import 'package:crochapp/models/pattern_model.dart';

class Singleton {
  static final Singleton _instance = Singleton._internal();

  PatternModel pattern = PatternModel.empty();
  bool backto = false;

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory Singleton() {
    return _instance;
  }
  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment         above
  // it's also private, so it can only be called in this class
  Singleton._internal() {
    // initialization logic
  }

  // rest of class as normal,
}
