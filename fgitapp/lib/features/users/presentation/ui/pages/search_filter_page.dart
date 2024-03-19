import 'dart:async';

import 'package:fgitapp/common/constants/app_colors_constant.dart';
import 'package:fgitapp/common/constants/app_text_style.dart';
import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/common/widgets/base_page_widget.dart';
import 'package:fgitapp/features/users/data/models/user_models/user_list_response_model.dart';
import 'package:fgitapp/config/router/route_paths.dart';
import 'package:fgitapp/features/users/domain/entity/user_entity.dart';
import 'package:fgitapp/features/users/presentation/business_logic/search_anything_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({super.key});

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  List<UsersListModel> userData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: const Text(
        ResString.search,
        style: AppTextStyle.appBarTitleStyle,
      ),
      appBarHeight: 150,
      bottom: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            autofocus: true,
            decoration: const InputDecoration(
              labelStyle: TextStyle(color: AppColors.whiteColor),
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.whiteColor,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.whiteColor)),
              hintText: 'Enter your query here...',
              counterStyle: TextStyle(color: AppColors.whiteColor),
              hintStyle: TextStyle(color: AppColors.whiteColor),
            ),
            onChanged: (val) {
              searchUser(val);
            },
          ),
        ),
      ),
      body: Center(child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchDetailsFetchedSucessState) {
            return ListView.builder(
                itemCount: state.searchDetailsResponseModel.length,
                itemBuilder: (context, index) {
                  userData = state.searchDetailsResponseModel;
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutePaths.userDetailPage,
                            arguments: userData[index].login.toString(),
                          );
                        },
                        leading: ClipOval(
                          child: Image.network(
                            userData[index].avatarUrl.toString(),
                          ),
                        ),
                        title: Text(
                          userData[index].login.toString(),
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
                  );
                });
          }
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.manage_search,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Enter anything to search such as username, repos'),
            ],
          );
        },
      )),
    );
  }

  Timer? _debounce;

  searchUser(query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<SearchCubit>(context).searchDatafromQuery(query);
    });
  }
}
