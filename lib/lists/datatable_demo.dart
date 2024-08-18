import 'package:flutter/material.dart';

class DatatableDemo extends StatefulWidget {
  const DatatableDemo({super.key});

  @override
  State<DatatableDemo> createState() => _DatatableDemoState();
}

class _DatatableDemoState extends State<DatatableDemo> {
  int rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('Person Lists'),
        rowsPerPage: rowsPerPage,
        onRowsPerPageChanged: (int? newRowCount) {
          if (newRowCount != null) {
            setState(() {
              rowsPerPage = newRowCount;
            });
          }
        },
        columns: [
          DataColumn(label: Text('No')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Phone')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Address')),
        ],
        source: PersonDataSource(),
      ),
    );
  }
}

class Person {
  String name;
  String phone;
  String email;
  String address;
  bool selected = false;

  Person(this.name, this.phone, this.email, this.address);
}

class PersonDataSource extends DataTableSource {
  int selectedCount = 0;
  final List<Person> persons = <Person>[
    Person('John Doe', '555-1234', 'john.doe@example.com',
        '123 Main St, Cityville'),
    Person('Jane Smith', '555-5678', 'jane.smith@example.com',
        '456 Elm St, Townsville'),
    Person('Alice Johnson', '555-8765', 'alice.johnson@example.com',
        '789 Oak St, Villagetown'),
    Person('Bob Brown', '555-3456', 'bob.brown@example.com',
        '101 Maple St, Cityville'),
    Person('Charlie Davis', '555-6543', 'charlie.davis@example.com',
        '202 Pine St, Townsville'),
    Person('Diana Green', '555-2345', 'diana.green@example.com',
        '303 Cedar St, Villagetown'),
    Person('Evan Harris', '555-6789', 'evan.harris@example.com',
        '404 Birch St, Cityville'),
    Person('Fiona Scott', '555-9876', 'fiona.scott@example.com',
        '505 Spruce St, Townsville'),
    Person('George King', '555-4567', 'george.king@example.com',
        '606 Fir St, Villagetown'),
    Person('Helen Moore', '555-7654', 'helen.moore@example.com',
        '707 Redwood St, Cityville'),
    Person('Ian Price', '555-5432', 'ian.price@example.com',
        '808 Ash St, Townsville'),
    Person('Jenny Clark', '555-8765', 'jenny.clark@example.com',
        '909 Cypress St, Villagetown'),
    Person('Kevin White', '555-4321', 'kevin.white@example.com',
        '1010 Palm St, Cityville'),
    Person('Lily Adams', '555-6789', 'lily.adams@example.com',
        '1111 Oakwood St, Townsville'),
    Person('Michael Taylor', '555-3210', 'michael.taylor@example.com',
        '1212 Willow St, Villagetown'),
    Person('Nancy Turner', '555-7654', 'nancy.turner@example.com',
        '1313 Sycamore St, Cityville'),
    Person('Oliver Thompson', '555-2345', 'oliver.thompson@example.com',
        '1414 Chestnut St, Townsville'),
    Person('Paula Walker', '555-4567', 'paula.walker@example.com',
        '1515 Magnolia St, Villagetown'),
    Person('Quincy Rogers', '555-1234', 'quincy.rogers@example.com',
        '1616 Dogwood St, Cityville'),
    Person('Rachel Young', '555-6543', 'rachel.young@example.com',
        '1717 Poplar St, Townsville'),
  ];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= persons.length) return null;
    final Person person = persons[index];
    return DataRow.byIndex(
        index: index,
        selected: person.selected,
        onSelectChanged: (bool? newValue){
          if(person.selected != newValue){
            selectedCount += newValue! ? 1 : -1;
            person.selected = newValue;
            notifyListeners();
          }
        },
        cells: <DataCell>[
      DataCell(Text('${index + 1}')),
      DataCell(Text(person.name)),
      DataCell(Text(person.phone)),
      DataCell(Text(person.email)),
      DataCell(Text(person.address)),
    ]);
  }

  @override
  int get rowCount => persons.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => selectedCount;
}
