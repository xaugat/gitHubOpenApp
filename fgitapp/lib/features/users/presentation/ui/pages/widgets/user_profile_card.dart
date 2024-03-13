import 'package:cached_network_image/cached_network_image.dart';
import 'package:fgitapp/features/users/business_logic/user_bloc/user_bloc.dart';
import 'package:fgitapp/features/users/business_logic/user_detail_bloc/user_detail_bloc.dart';
import 'package:fgitapp/utils/app_colors_constant.dart';
import 'package:fgitapp/utils/app_text_style.dart';
import 'package:fgitapp/utils/image_constant.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key, required this.state}) : super(key: key);

  final GetUserDetailsSuccessState state;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  dynamic imageFile;
  bool? changedImage;
  bool localImage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.28,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.background,
                  ),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.centerRight),
              color: AppColors.appThemeColor,
            ),
          ),
          Positioned(
            bottom: 10,
            child: checkAvailableImageForProfile(
                imageFile:
                    widget.state.userDetailsResponseModel.avatarUrl.toString()),
          ),
        ],
      ),
    );
  }

  Widget checkAvailableImageForProfile({dynamic imageFile, var profileImg}) {
    return CircleAvatar(
      radius: 96,
      backgroundColor: AppColors.whiteColor,
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          width: 180.0,
          height: 180.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        imageUrl: imageFile,
        height: 180,
        placeholder: (context, url) => const CircleAvatar(
          radius: 80,
          backgroundColor: AppColors.whiteColor,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.appThemeColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.fill,
      ),
    );
  }
}
