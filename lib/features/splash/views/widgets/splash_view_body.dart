import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/splash/views/widgets/sliding_slogan.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToAuth();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imagesTouristaLogoWhite),
        const SizedBox(
          height: 8,
        ),
        SlidingSlogan(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigateToAuth() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        //  GoRouter.of(context).pushReplacement(AppRouter.kSignIN);
        Hive.box(kOnboarding).get('bool') == null || false
            ? GoRouter.of(context).pushReplacement(AppRouter.kOnboarduingView)
            : Hive.box(kTokenBox).get(kTokenRef) == null
                ? GoRouter.of(context).pushReplacement(AppRouter.kSignIN)
                : GoRouter.of(context).pushReplacement(AppRouter.kHomeView);

        // Get.to(() => const HomeView(),
        //     transition: Transition.fade, duration: kTransitionDuration);
      },
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
