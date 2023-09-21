// ignore_for_file: unnecessary_getters_setters

class Person {
  double weight = 0;
  double height = 0;
  String name = "";

  Person(this.weight, this.height, this.name);

  double calculateIMC() {
    return weight / ((height / 100) * (height / 100));
  }
}

class DataRepo {
  final List<double> _data = [];

  Future<List<double>> getData() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _data;
  }
}
