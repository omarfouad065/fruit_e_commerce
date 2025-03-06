import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/helper_functions/get_user.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/core/widgets/notification_widget.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('صباح الخير!..',
          style: TextStyles.regular16.copyWith(color: Color(0xff949D9E))),
      subtitle: Text(getUser().name,
          style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D))),
      leading: Image.asset(Assets.assetsImagesProfileImage),
      trailing: NotificationWidget(),
    );
  }
}
