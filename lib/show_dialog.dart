// import 'package:flutter/material.dart';
//
// class ShowDialog extends StatefulWidget {
//   const ShowDialog({super.key});
//
//   @override
//   State<ShowDialog> createState() => _ShowDialogState();
// }
//
// class _ShowDialogState extends State<ShowDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//       child: ElevatedButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: const Text(
//                 'My Text',
//               ),
//               content: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: SizedBox(
//                           width: 150,
//                           height: 30,
//                           child: TextField(
//                             controller: myControllerDayPercent,
//                             obscureText: false,
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'Day Percent',
//                             ),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: _percentDay,
//                         child:
//                         const Icon(Icons.add, color: Colors.indigo),
//                       ),
//                       SizedBox(
//                         child: Text(dayPercent.toString()),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: SizedBox(
//                           width: 150,
//                           height: 30,
//                           child: TextField(
//                             controller: myControllerNightPercent,
//                             obscureText: false,
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'Night Percent',
//                             ),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: _percentNight,
//                         child:
//                         const Icon(Icons.add, color: Colors.indigo),
//                       ),
//                       SizedBox(
//                         child: Text(nightPercent.toString()),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: SizedBox(
//                           width: 150,
//                           height: 30,
//                           child: TextField(
//                             controller: myControllerPremiumPercent,
//                             obscureText: false,
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'Premium Percent',
//                             ),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: _percentPremium,
//                         child:
//                         const Icon(Icons.add, color: Colors.indigo),
//                       ),
//                       SizedBox(
//                         child: Text(premiumPercent.toString()),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: SizedBox(
//                           width: 150,
//                           height: 30,
//                           child: TextField(
//                             controller: myControllerPartJobPercent,
//                             obscureText: false,
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'Part-Job Percent',
//                             ),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: _percentPartJob,
//                         child:
//                         const Icon(Icons.add, color: Colors.indigo),
//                       ),
//                       SizedBox(
//                         child: Text(partJobPercent.toString()),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   child: const Text('CANCEL'),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 TextButton(
//                   child: const Text('Ok'),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//
//           );
//         },
//         child: const Text('Settings'),
//       ),
//     );
//   }
// }
