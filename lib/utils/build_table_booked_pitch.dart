// import 'package:flutter/material.dart';
//
// class TablePitch extends StatelessWidget {
//   const TablePitch({
//     Key key,
//     @required this.namePitch,
//     @required this.time,
//     @required this.price,
//     this.function,
//   }) : super(key: key);
//
//   final Function function;
//   final String namePitch;
//   final String time;
//   final int price;
//
//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//         child: DataTable(
//       columns: <DataColumn>[
//         DataColumn(
//           label: Text('Name'),
//         ),
//         DataColumn(
//           label: Text('A'),
//         ),
//         DataColumn(
//           label: Text('B'),
//         ),
//         DataColumn(
//           label: Text('C'),
//         ),
//         DataColumn(
//           label: Text('D'),
//         ),
//       ],
//       rows: <DataRow>[
//         DataRow(cells: [
//           DataCell(Text('1 Boston')),
//           DataCell(Text('3')),
//           DataCell(Text('3')),
//           DataCell(Text('7')),
//           DataCell(Text('1')),
//         ]),
//         DataRow(cells: [
//           DataCell(Text('2 London')),
//           DataCell(Text('3')),
//           DataCell(Text('4')),
//           DataCell(Text('12')),
//           DataCell(Text('44')),
//         ]),
//         DataRow(cells: [
//           DataCell(Text('3 Rome')),
//           DataCell(Text('10')),
//           DataCell(Text('50')),
//           DataCell(Text('90')),
//           DataCell(Text('4')),
//         ]),
//       ],
//     ));
//   }
// }
