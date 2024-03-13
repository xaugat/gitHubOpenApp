import 'package:fgitapp/common/widgets/app_bar/custom_app_bar.dart';
import 'package:fgitapp/features/users/business_logic/user_bloc/user_bloc.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/widgets/user_list_widget.dart';
import 'package:fgitapp/utils/app_colors_constant.dart';
import 'package:fgitapp/utils/app_text_style.dart';
import 'package:fgitapp/utils/image_constant.dart';
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
    BlocProvider.of<UserBloc>(context).add(const GetAllUsersListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is GetAllUsersSuccessState) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.25,
                  bottom: const CustomAppBar(
                    colors: Colors.white,
                    showBackButton: false,
                    title: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                            hintText: 'Search username',
                            hintStyle:
                                TextStyle(color: AppColors.darkGreyColor)),
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
          return Text('');
        }
      }),
    );
  }
}
