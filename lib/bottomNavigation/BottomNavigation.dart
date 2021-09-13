// import 'package:flutter/material.dart';

// class BottomNavigationComponent extends StatefulWidget {
//   const BottomNavigationComponent({Key? key}) : super(key: key);

//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];

//   @override
//   _BottomNavigationComponentState createState() =>
//       _BottomNavigationComponentState();
// }

// class _BottomNavigationComponentState extends State<BottomNavigationComponent> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         canvasColor: Color(0xFFECECEC),
//       ),
//       child: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.format_list_bulleted_outlined),
//             label: 'Lista',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.done),
//             label: 'Concluídas',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xFFEEB868),
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//         unselectedItemColor: Colors.grey.shade600,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
