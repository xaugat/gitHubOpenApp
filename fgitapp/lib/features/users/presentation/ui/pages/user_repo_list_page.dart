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

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
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
            return GridView.builder(
                itemCount: state.usersProjectListResponseModel.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final color = _generateRandomColor();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      // color: color,
                      child: Stack(
                        children: [
                          // Image.asset(
                          //   AppImages.background,
                          //   fit: BoxFit.cover,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.folder),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    state.usersProjectListResponseModel[index]
                                        .name
                                        .toString(),
                                    textAlign: TextAlign.left,
                                    style:
                                        AppTextStyle.listTileSubTitleTextStyle),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.visibility,
                                        color: AppColors.darkGreyColor,
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
                                            .listTileSubTitleTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.file_copy,
                                        color: AppColors.darkGreyColor,
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
                                            .listTileSubTitleTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (state is UserProjectsFetchedFailureState) {
            return const Center(
              child: Text(ResString.error),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
