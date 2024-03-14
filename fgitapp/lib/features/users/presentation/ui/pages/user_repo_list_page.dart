import 'dart:math';

import 'package:fgitapp/common/constants/app_colors_constant.dart';
import 'package:fgitapp/common/constants/app_text_style.dart';
import 'package:fgitapp/common/constants/image_constant.dart';
import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/common/widgets/base_page_widget.dart';
import 'package:fgitapp/features/users/business_logic/user_repo_cubit/user_projects_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRepoListPage extends StatefulWidget {
  String userId;
  UserRepoListPage({super.key, required this.userId});

  @override
  State<UserRepoListPage> createState() => _UserRepoListPageState();
}

class _UserRepoListPageState extends State<UserRepoListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserRepoList();
  }

  getUserRepoList() {
    BlocProvider.of<UserProjectsCubit>(context)
        .getUsersProjectsList(widget.userId);
  }

  Color generateRandomDarkColor() {
    final Random random = Random();
    final int darkColorRange =
        (0.5 * 0xFFFFFF).toInt(); // Half of full brightness

    return Color((random.nextDouble() * darkColorRange).toInt() << 0)
        .withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: const Text(
        'User Repos',
        style: AppTextStyle.appBarTitleStyle,
      ),
      body: BlocBuilder<UserProjectsCubit, UserProjectsState>(
        builder: (context, state) {
          if (state is UserProjectsFetchedSucessState) {
            return Container(
              color: AppColors.appThemeLightColor,
              child: GridView.builder(
                  itemCount: state.usersProjectListResponseModel.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    Color color = generateRandomDarkColor();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Icon(
                                    Icons.folder_open_outlined,
                                    color: color,
                                    size: 60,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      state.usersProjectListResponseModel[index]
                                          .name
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle
                                          .listTileSubTitleTextStyle
                                          .copyWith(
                                              color: AppColors.appThemeColor)),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 1,
                              child: Container(
                                color: AppColors.whiteColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.visibility,
                                            color: AppColors.appThemeColor,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            state
                                                .usersProjectListResponseModel[
                                                    index]
                                                .watchersCount
                                                .toString(),
                                            style: AppTextStyle
                                                .listTileSubTitleTextStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .appThemeColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.fork_right_rounded,
                                            color: AppColors.appThemeColor,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            state
                                                .usersProjectListResponseModel[
                                                    index]
                                                .forksCount
                                                .toString(),
                                            style: AppTextStyle
                                                .listTileSubTitleTextStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .appThemeColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else if (state is UserProjectsFetchedFailureState) {
            return const Center(
              child: Text(ResString.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
