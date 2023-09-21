import 'package:flutter/material.dart';
import 'package:challenge2/Model/person.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  var dataRepo = DataRepo();
  List<Person> people = [];
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void addPerson() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    String name = nameController.text;

    Person person = Person(height, weight, name);

    setState(() {
      people.add(person);
      heightController.clear();
      weightController.clear();
      nameController.clear();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    dataRepo.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Altura (cm)'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: addPerson,
            child: const Text('Adicionar Pessoa'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (BuildContext context, int index) {
                Person person = people[index];
                double imc = person.calculateIMC();

                return ListTile(
                  title: Text('Nome: ${person.name}'),
                  subtitle: Text(
                      'Altura: ${person.height} cm, Peso: ${person.weight} kg'),
                  trailing: Text('IMC: ${imc.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
