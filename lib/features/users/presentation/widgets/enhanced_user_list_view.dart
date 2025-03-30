// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';
import 'package:sites_management/features/users/presentation/widgets/list_item_animation.dart';
import 'package:sites_management/features/users/presentation/widgets/user_card.dart';

class EnhancedUserListView extends StatelessWidget {
  final List<UserEntity> users;

  const EnhancedUserListView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListItemAnimation(
          index: index,
          child: UserCard(user: user), //todo
        );
      },
    );
  }
}

// Add this shimmering loading effect for better UX
// class ShimmerLoading extends StatelessWidget {
//   const ShimmerLoading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ShimmerContainer(
//                 width: 50,
//                 height: 50,
//                 isCircle: true,
//               ),
//               SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ShimmerContainer(
//                       width: double.infinity,
//                       height: 16,
//                     ),
//                     SizedBox(height: 8),
//                     ShimmerContainer(
//                       width: 100,
//                       height: 14,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class ShimmerContainer extends StatelessWidget {
//   final double width;
//   final double height;
//   final bool isCircle;

//   const ShimmerContainer({
//     super.key,
//     required this.width,
//     required this.height,
//     this.isCircle = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surfaceContainerHighest,
//         borderRadius: isCircle ? BorderRadius.circular(height / 2) : BorderRadius.circular(8),
//       ),
//     );
//   }
// }
