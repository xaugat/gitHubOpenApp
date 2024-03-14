import 'package:fgitapp/common/constants/app_colors_constant.dart';
import 'package:fgitapp/common/constants/app_text_style.dart';
import 'package:fgitapp/features/users/business_logic/user_bloc/user_bloc.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/user_detail_page.dart';
import 'package:fgitapp/router/route_paths.dart';

import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  final GetAllUsersSuccessState state;

  const UserListWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: state.usersListResponseModel.length,
          (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.userDetailPage,
                    arguments:
                        state.usersListResponseModel[index].login.toString(),
                  );
                },
                leading: ClipOval(
                  child: Image.network(
                    state.usersListResponseModel[index].avatarUrl.toString(),
                  ),
                ),
                title: Text(
                  state.usersListResponseModel[index].login.toString(),
                  style: AppTextStyle.listTileTitleTextStyle,
                ),
                // ignore: prefer_const_constructors
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.appThemeColor,
                ),
              ),
              const Divider(
                color: AppColors.whiteColor,
              )
            ],
          ),
        );
      }),
    );
  }
}
