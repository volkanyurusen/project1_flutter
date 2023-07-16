import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexOfPageCubit, IndexOfPageState>(
      builder: (context, state) {
        return _createBottomNavigationBar(context, state);
      },
    );
  }

  BottomNavigationBar _createBottomNavigationBar(
    BuildContext context,
    IndexOfPageState state,
  ) =>
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: state.currentIndex,
        onTap: (index) {
          // if (index != context.read<IndexOfPageCubit>().state.currentIndex ||
          //     index == 2) {
          context.read<IndexOfPageCubit>().pageChanged(index);
          index = index;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ScreenOfHome()));
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Discover'),
          BottomNavigationBarItem(
              icon: Icon(Icons.control_point_outlined), label: 'Existence'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_rounded), label: 'Coaching'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      );
}





// class CustomBottomNavigationBar extends StatelessWidget {
//   CustomBottomNavigationBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PageIndexCubit, PageIndexState>(
//       builder: (context, state) {
//         return BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: state.currentIndex,
//           onTap: (index) {
//             context.read<PageIndexCubit>().pageChanged(index);
//             index = index;
//             //
//             // print('page index is: $index');
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (_) => HomeScreen()));
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search_rounded),
//               label: 'Search',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.control_point_outlined),
//               label: 'Existence',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.sports_rounded),
//               label: 'Coaching',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline),
//               label: 'Message',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle_outlined),
//               label: 'Profile',
//             ),
//           ],
//         );
//       },
//     );
//   }
// }