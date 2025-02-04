import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

import '../../../../../core/utlis/functions/launcer_url.dart';

class ContactUsTabBarView extends StatelessWidget {
  const ContactUsTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        children: [
          const Gap(15),
          ContactUsRow(
              onTap: () async {
                await launchCustomUrl(context, 'https://wa.me/963985392515');
                //   launchUrl(whatsapp);
              },
              assetName: Assets.imagesIconsCircleWhatsapp,
              data: 'WhatsApp',
              iconSiza: 27),
          const Gap(20),
          ContactUsRow(
              onTap: () async {
                await launchCustomUrl(
                    context, 'https://www.instagram.com/ramafassi/');
              },
              assetName: Assets.imagesIconsInstagramIcon,
              data: 'instagram',
              iconSiza: 25),
          const Gap(20),
          ContactUsRow(
              onTap: () async {
                await launchCustomUrl(
                    context, 'https://www.facebook.com/rama.fassi');
              },
              assetName: Assets.imagesIconsFacebookIcon,
              data: 'Facebbok',
              iconSiza: 25),
          const Gap(20),
          ContactUsRow(
              onTap: () async {
                await launchCustomUrl(
                    context, 'https://www.youtube.com/watch?v=8gjXvVwe5go');
              },
              assetName: Assets.imagesIconsYoutubeIcon,
              data: 'Youtube',
              iconSiza: 20),
          const Gap(20),
          const ContactUsRow(
              assetName: Assets.imagesIconsTwitter,
              data: 'Twitter',
              iconSiza: 30),
        ],
      ),
    );
  }
}

class ContactUsRow extends StatelessWidget {
  const ContactUsRow({
    super.key,
    required this.assetName,
    required this.data,
    this.onTap,
    this.iconSiza,
  });
  final String assetName;
  final String data;
  final Function()? onTap;
  final double? iconSiza;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green.withOpacity(.2))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                assetName,
                width: iconSiza,
                height: iconSiza,
              ),
              const Gap(15),
              Text(
                data,
                style: AppStyles.styleSourceSemiBold22(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
