import 'package:fgitapp/common/constants/app_colors_constant.dart';
import 'package:fgitapp/common/constants/app_text_style.dart';
import 'package:fgitapp/common/constants/image_constant.dart';
import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/features/users/presentation/business_logic/user_bloc/user_bloc.dart';

import 'package:fgitapp/features/users/presentation/ui/pages/widgets/user_list_widget.dart';
import 'package:fgitapp/helpers.dart/toast.dart';
import 'package:fgitapp/config/router/route_paths.dart';
import 'package:fgitapp/core/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUsersList();
  }

  getUsersList() {
    BlocProvider.of<UserBloc>(context).add(GetAllUsersListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appThemeLightColor,
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is GetAllUsersSuccessState) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: RefreshIndicator(
              onRefresh: () async {
                SharedPref.setStringValue(ResString.dashboardSavedData, '');
                getUsersList();
                showSuccessToast(ResString.refreshSuccess);
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: AppColors.appThemeColor,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    centerTitle: true,
                    title: Text(
                      'GitApp',
                      style: AppTextStyle.heading
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    expandedHeight: MediaQuery.of(context).size.height * 0.30,
                    bottom: AppBar(
                      backgroundColor: AppColors.appThemeLightColor,
                      // showBackButton: false,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),

                      centerTitle: true,

                      // ignore: prefer_const_constructors
                      title: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutePaths.searchPage);
                        },
                        child: SizedBox(
                          height: 55,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all()),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Search',
                                      style: AppTextStyle.subtitle,
                                    ),
                                    Icon(Icons.search),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        AppImages.background,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  UserListWidget(state: state),
                ],
              ),
            ),
          );
        } else if (state is GetAllUsersLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllUsersFailureState) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(state.errorModel.message.toString()),
          ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  searchUser() {}
}
