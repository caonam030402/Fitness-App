import 'package:fitness_app/components/intro_page.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/utils/app_clippart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:fitness_app/configs/app_icons.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listIntroPageItem.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          final item = listIntroPageItem[index];
          return IntroPage(
            image: item.image,
            indexPage: index + 1,
            title: item.title,
            desc: item.desc,
            controller: _controller,
          );
        },
      ),
    );
  }
}

class IntroPageItem {
  Widget image;
  String title;
  String desc;
  IntroPageItem({required this.desc, required this.title, required this.image});
}

List<IntroPageItem> listIntroPageItem = [
  IntroPageItem(
      image: ClipPath(
        clipper: CustomClipPathIntro1(),
        child: WidgetMask(
          childSaveLayer: true,
          mask: SvgPicture.asset(
            alignment: Alignment.bottomCenter,
            AppIcons.vt_woman,
            fit: BoxFit.none,
          ),
          child: Container(
              height: 370,
              width: double.infinity,
              decoration:
                  const BoxDecoration(gradient: AppColors.primaryGradiant),
              child: const Text('')),
        ),
      ),
      title: 'Track Your Goal',
      desc:
          'Dont worry if you have trouble determining your goals, We can help you determine your goals and track your goals'),
  IntroPageItem(
      image: Stack(
        children: [
          ClipPath(
              clipper: CustomClipPathIntro2(),
              child: Container(
                height: 370,
                width: double.infinity,
                decoration:
                    const BoxDecoration(gradient: AppColors.primaryGradiant),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(AppIcons.vt_runner_2)),
        ],
      ),
      title: 'Get Burn',
      desc:
          'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever'),
  IntroPageItem(
      image: Stack(
        children: [
          ClipPath(
              clipper: CustomClipPathIntro3(),
              child: Container(
                height: 370,
                width: double.infinity,
                decoration:
                    const BoxDecoration(gradient: AppColors.primaryGradiant),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(AppIcons.vt_sit)),
        ],
      ),
      title: 'Improve Sleep  Quality',
      desc:
          'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning'),
  IntroPageItem(
      image: ClipPath(
        clipper: CustomClipPathIntro4(),
        child: WidgetMask(
          childSaveLayer: true,
          mask: SvgPicture.asset(
            alignment: Alignment.bottomCenter,
            AppIcons.vt_man,
            fit: BoxFit.none,
          ),
          child: Container(
              height: 370,
              width: double.infinity,
              decoration:
                  const BoxDecoration(gradient: AppColors.primaryGradiant),
              child: const Text('')),
        ),
      ),
      title: 'Eat Well',
      desc:
          'Lets start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun')
];
