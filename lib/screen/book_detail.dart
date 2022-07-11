// import 'package:flutter/material.dart';
//
// import '../theme/app_text_theme.dart';
// class BookDetails extends StatefulWidget {
//   const BookDetails({Key? key}) : super(key: key);
//
//   @override
//   State<BookDetails> createState() => _BookDetailsState();
// }
//
// class _BookDetailsState extends State<BookDetails> {
//   @override
//   Widget build(BuildContext context) {
//     dynamic data = ModalRoute.of(context)!.settings.arguments;
//     print(data);
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         toolbarHeight: 70,
//         title: Text(
//           "Book Detail",
//           style: TextStyle(fontSize: 25),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: data,
//           itemBuilder: (context,index){
//         return Column(
//           children: [
//             // Text("${data}")
//           ],
//         );
//       })
//     );
//   }
// }
