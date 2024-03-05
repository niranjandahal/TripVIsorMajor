// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// Widget navcomponent(String? label, int index) {
//   if (label == '') {
//     return IconButton(
//       onPressed: () {
//         if (index == 1) {
//           return DestinationPage();
//         } else if (index == 2) {
//           return PackagesPage(index);
//         } else {
//           launch("#");
//         }
//       },
//       icon: FaIcon(
//         index == 3
//             ? FontAwesomeIcons.linkedin
//             : index == 4
//                 ? FontAwesomeIcons.youtube
//                 : index == 5
//                     ? FontAwesomeIcons.github
//                     : index == 6
//                         ? FontAwesomeIcons.facebook
//                         : FontAwesomeIcons.twitter,
//         color: Colors.white,
//         size: 18,
//       ),
//     );
//   } else {
//     return TextButton(
//       onPressed: () {
//         if (index == 1) {
//           launch("https://niranjandahal.com.np");
//         } else {
//           launch("https://dahalniranjan.com.np");
//         }
//       },
//       child: Text(
//         label!,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }
// }
