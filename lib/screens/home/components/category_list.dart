// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class CategoryList extends StatefulWidget {
//   const CategoryList({super.key});

//   @override
//   State<CategoryList> createState() => _CategoryListState();
// }

// class _CategoryListState extends State<CategoryList> {
//   int SelectedCategory = 0;
//   List<String> categories = ['Popular', 'Top Rated', 'Now Playing', 'Upcoming',];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) => buildCategory(index, context),
//       ),
//     );
//   }

//   Padding buildCategory(int index, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             SelectedCategory = index;
//           });
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               categories[index],
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w600,
//                 color: index == SelectedCategory
//                     ? Colors.black
//                     : Colors.black.withOpacity(0.4),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 6),
//               height: 6,
//               width: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: index == SelectedCategory
//                     ? Color.fromARGB(255, 236, 26, 57)
//                     : Colors.transparent,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
