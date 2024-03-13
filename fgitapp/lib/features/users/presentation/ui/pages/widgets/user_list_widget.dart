import 'package:fgitapp/features/users/business_logic/user_bloc/user_bloc.dart';
import 'package:fgitapp/features/users/presentation/ui/pages/user_detail_page.dart';
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetailPage(
                              userId: state.usersListResponseModel[index].login
                                  .toString(),
                            )),
                  );
                },
                leading: ClipOval(
                  child: Image.network(
                    state.usersListResponseModel[index].avatarUrl.toString(),
                  ),
                ),
                title:
                    Text(state.usersListResponseModel[index].login.toString()),
                subtitle:
                    Text(state.usersListResponseModel[index].nodeId.toString()),
              ),
              const Divider()
            ],
          ),
        );
      }),
    );
  }
}
