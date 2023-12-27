import 'package:fitness_app/components/button.dart';
import 'package:fitness_app/components/tool_bar.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/pages/profile/widgets/personal_card.dart';
import 'package:fitness_app/providers/userProviders.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final getProfileProvider = ProfileProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProfileProvider.setData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final user = getProfileProvider.user;
        return Scaffold(
          appBar: const ToolBar(title: "Profile", isBackHome: true),
          body: Padding(
            padding: const EdgeInsets.only(
                top: AppStyles.paddingBothSidesPage,
                right: AppStyles.paddingBothSidesPage,
                left: AppStyles.paddingBothSidesPage),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: user != null && user.avatar != ''
                                  ? Image.network(user.avatar!)
                                  : SvgPicture.asset(
                                      AppIcons.im_avatar_default)),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? '',
                          style: AppText.medium
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Lose a Fat Program',
                          style:
                              AppText.small.copyWith(color: AppColors.gray_1),
                        )
                      ],
                    ),
                    const Spacer(),
                    Button(
                      text: 'Edit',
                      size: Size.medium,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    PersonalCard(
                        title: '${user?.height.toString()}cm', desc: 'Height'),
                    const SizedBox(
                      width: 15,
                    ),
                    PersonalCard(
                      title: '${user?.weight.toString()}kg',
                      desc: 'Weight',
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    PersonalCard(
                        title:
                            '${DateTime.now().year - DateTime.parse((user?.dateOfBirth.toString() ?? '1990-01-01T00:00:00.000Z')).year}ayo',
                        desc: 'Age'),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
