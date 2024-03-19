// import 'package:fgitapp/common/constants/app_colors_constant.dart';
// import 'package:fgitapp/common/constants/app_text_style.dart';
// import 'package:fgitapp/common/constants/string_constants.dart';
// import 'package:fgitapp/common/widgets/base_page_widget.dart';
// import 'package:fgitapp/features/users/presentation/business_logic/user_detail_bloc/user_detail_bloc.dart';
// import 'package:fgitapp/features/users/presentation/ui/pages/user_repo_list_page.dart';
// import 'package:fgitapp/features/users/presentation/ui/pages/widgets/user_profile_card.dart';
// import 'package:fgitapp/config/router/route_paths.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UserDetailPage extends StatefulWidget {
//   final String userId;
//   const UserDetailPage({super.key, required this.userId});

//   @override
//   State<UserDetailPage> createState() => _UserDetailPageState();
// }

// class _UserDetailPageState extends State<UserDetailPage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     getUserDetails(widget.userId);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   getUserDetails(String userId) {
//     BlocProvider.of<UserDetailBloc>(context)
//         .add(GetUserDetailsEvent(userId: userId));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BasePage(
//         title: Text(
//           widget.userId,
//           style: AppTextStyle.title,
//         ),
//         body: BlocBuilder<UserDetailBloc, UserDetailState>(
//           builder: (context, state) {
//             if (state is GetUserDetailsSuccessState) {
//               return Container(
//                 color: AppColors.appThemeLightColor,
//                 child: Column(
//                   children: [
//                     ProfileCard(
//                       state: state,
//                     ),
//                     Text(
//                       state.userDetailsResponseModel.name.toString(),
//                       style: AppTextStyle.heading
//                           .copyWith(color: AppColors.appThemeColor),
//                     ),
//                     Text(
//                       state.userDetailsResponseModel.bio ?? '',
//                       style: AppTextStyle.subtitle,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         showCardDetail(
//                             title: 'Followers',
//                             subTitle: state.userDetailsResponseModel.followers
//                                 .toString()),
//                         showCardDetail(
//                             title: 'Following',
//                             subTitle: state.userDetailsResponseModel.following
//                                 .toString()),
//                         showCardDetail(
//                             title: 'Repositories',
//                             subTitle: state.userDetailsResponseModel.publicRepos
//                                 .toString()),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     showProfileDetailList(state: state),
//                   ],
//                 ),
//               );
//             } else if (state is GetUserDetailsFailureState) {
//               return Center(
//                 child: Text(ResString.error),
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ));
//   }

//   showProfileDetailList({required GetUserDetailsSuccessState state}) {
//     List<UserProfileDetail> profileDetailCardItems = [
//       UserProfileDetail(
//           title: 'Repositories',
//           subTitle: 'View all repositories details',
//           url: state.userDetailsResponseModel.reposUrl,
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => UserRepoListPage(
//                         userId: widget.userId.toString(),
//                       )),
//             );
//           }),
//       UserProfileDetail(
//           title: 'Events',
//           subTitle: 'View all event details',
//           url: state.userDetailsResponseModel.reposUrl,
//           onTap: () {
//             Navigator.pushNamed(context, RoutePaths.userRepoPage,
//                 arguments: widget.userId.toString());
//           }),
//     ];

//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: profileDetailCardItems.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 8),
//             child: Card(
//               elevation: 0,
//               color: AppColors.whiteColor,
//               child: ListTile(
//                 onTap: profileDetailCardItems[index].onTap,
//                 title: Text(profileDetailCardItems[index].title.toString()),
//                 subtitle:
//                     Text(profileDetailCardItems[index].subTitle.toString()),
//                 trailing: const Icon(Icons.arrow_forward_ios),
//               ),
//             ),
//           );
//         });
//   }

//   showCardDetail({required String title, required String subTitle}) {
//     return Card(
//       elevation: 0,
//       color: AppColors.whiteColor,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(children: [
//           Text(
//             title,
//             style: AppTextStyle.listTileTitleTextStyle,
//           ),
//           Text(
//             subTitle,
//             style: AppTextStyle.listTileSubTitleTextStyle,
//           )
//         ]),
//       ),
//     );
//   }
// }

// class UserProfileDetail {
//   String? title;
//   String? subTitle;
//   String? url;
//   VoidCallback? onTap;

//   UserProfileDetail(
//       {required this.title,
//       required this.subTitle,
//       required this.url,
//       required this.onTap});
// }
