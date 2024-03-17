import 'package:flutter/material.dart';

// ****************** Define component interface ***********
abstract class UniversityComponent {
  Widget displayDetails();
}

//******************* Specific leaf node classes ************
class Professor implements UniversityComponent {
  final String name;
  final String department;

  Professor(this.name, this.department);

  @override
  Widget displayDetails() {
    return ListTile(
      title: Text('Professor: $name'),
      subtitle: Text('Department: $department'),
      leading: const Icon(Icons.person),
    );
  }
}

class Course implements UniversityComponent {
  final String name;
  final String department;

  Course(this.name, this.department);

  @override
  Widget displayDetails() {
    return ListTile(
      title: Text('Course: $name'),
      subtitle: Text('Department: $department'),
      leading: const Icon(Icons.book),
    );
  }
}

class Student implements UniversityComponent {
  final String name;

  Student(this.name);

  @override
  Widget displayDetails() {
    return ListTile(
      title: Text('Student: $name'),
      leading: const Icon(Icons.school),
    );
  }
}

//******************  Composite node classes ************
class Department implements UniversityComponent {
  final String name;
  final List<UniversityComponent> components;

  Department(this.name, this.components);

  @override
  Widget displayDetails() {
    return ExpansionTile(
      collapsedTextColor: Colors.lightBlue,
      backgroundColor: Colors.white54,
      title: Text(' $name'),
      children:
          components.map((component) => component.displayDetails()).toList(),
    );
  }
}

//*********************  Client *************
class UniversityStructureApp extends StatelessWidget {
  const UniversityStructureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'University Structure',
      home: UniversityStructurePage(),
    );
  }
}

class UniversityStructurePage extends StatelessWidget {
  const UniversityStructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('University Structure'),
      ),
      body: ListView(
        children: <Widget>[
          Department(
            'Computer Science',
            [
              Professor('Dr. Smith', 'Computer Science'),
              Course('Introduction to Programming', 'Computer Science'),
              Student('Alice'),
            ],
          ).displayDetails(),
          Department(
            'Mathematics',
            [
              Professor('Dr. Johnson', 'Mathematics'),
              Course('Calculus', 'Mathematics'),
              Student('Bob'),
            ],
          ).displayDetails(),
          Department(
            'Art Design',
            [
              Professor('Dr. Chang', 'Art Design'),
              Course('Drawing', 'Art Design'),
              Student('Peter'),
            ],
          ).displayDetails(),
        ],
      ),
    );
  }
}

void main() {
  runApp(const UniversityStructureApp());
}