// ignore_for_file: non_constant_identifier_names

class Vehicle {
  final String plate_no;
  final int capacity;

  Vehicle({required this.plate_no, required this.capacity});
}

class Driver {
  final String first_name;
  final String last_name;
  final int age;

  Driver({
    required this.first_name,
    required this.last_name,
    required this.age,
  });
}

class Conductor {
  final String first_name;
  final String last_name;
  final int age;

  Conductor({
    required this.first_name,
    required this.last_name,
    required this.age,
  });
}

class Terminal {
  final String terminal_no;
  final int available;
  final String status;

  Terminal({
    required this.terminal_no,
    required this.available,
    required this.status,
  });
}
