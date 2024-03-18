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
  final List<UniversityComponent> components;

  Course(this.name, this.department, this.components);

  @override
  Widget displayDetails() {
    return ExpansionTile(
      collapsedTextColor: Colors.lightBlue,
      backgroundColor: Colors.white54,
      title: Text('Course: $name'),
      subtitle: Text('Department: $department'),
      leading: const Icon(Icons.book),
      children: components.map((component) => component.displayDetails()).toList(),
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
      children: components.map((component) => component.displayDetails()).toList(),
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
              Course(
                'Introduction to Programming',
                'Computer Science',
                [
                  Professor('Dr. Smith', 'Computer Science'),
                  Student('Alice'),
                ],
              ),
            Course(
                'OOAP',
                'Computer Science',
                [
                  Professor('Dr. Smith', 'Computer Science'),
                  Student('Alice'),
                ],
              )
            ],
          ).displayDetails(),
          Department(
            'Mathematics',
            [
              Course(
                'Calculus',
                'Mathematics',
                [
                  Professor('Dr. Johnson', 'Mathematics'),
                  Student('Bob'),
                ],
              ),
            ],
          ).displayDetails(),
          Department(
            'Art Design',
            [
              Course(
                'Drawing',
                'Art Design',
                [
                  Professor('Dr. Chang', 'Art Design'),
                  Student('Peter'),
                ],
              ),
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
