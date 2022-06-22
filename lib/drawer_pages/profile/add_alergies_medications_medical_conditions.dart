import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Allergies extends StatefulWidget {
  const Allergies({Key? key}) : super(key: key);

  @override
  State<Allergies> createState() => _AllergiesState();
}

class _AllergiesState extends State<Allergies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Add Alergies'.text.headline3(context).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check))
              .pOnly(right: 12)
        ],
      ),
      body: Container(
        color: Colors.white,
        child: TextFormField(
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
          decoration: myInputDecoration('Add Alergies', ''),
        ).pSymmetric(v: 30, h: 16),
      ).p16().cornerRadius(8),
    );
  }
}

class MedicalConditions extends StatefulWidget {
  const MedicalConditions({Key? key}) : super(key: key);

  @override
  State<MedicalConditions> createState() => _MedicalConditionsState();
}

class _MedicalConditionsState extends State<MedicalConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Add Medical Conditions'.text.headline3(context).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check))
              .pOnly(right: 12)
        ],
      ),
      body: Container(
        color: Colors.white,
        child: TextFormField(
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
          decoration: myInputDecoration('Add Medical Conditions', ''),
        ).pSymmetric(v: 30, h: 16),
      ).p16().cornerRadius(8),
    );
  }
}

class Medications extends StatefulWidget {
  const Medications({Key? key}) : super(key: key);

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Add Medications'.text.headline3(context).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check))
              .pOnly(right: 12)
        ],
      ),
      body: Container(
        color: Colors.white,
        child: TextFormField(
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
          decoration: myInputDecoration('Add Medications', ''),
        ).pSymmetric(v: 30, h: 16),
      ).p16().cornerRadius(8),
    );
  }
}
