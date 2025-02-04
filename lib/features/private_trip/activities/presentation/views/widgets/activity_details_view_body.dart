import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/data/models/tourism_activities/activity_model.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activities_button.dart';

import '../../manager/activity_card_cubit/activity_card_cubit.dart';
import 'activity_texts_details.dart';

class ActivityDetailsViewBody extends StatefulWidget {
  const ActivityDetailsViewBody({
    super.key,
    required this.activityModel,
    required this.dayDate,
    required this.dayIndex,
  });
  final ActivityModel activityModel;
  final String dayDate;
  final int dayIndex;
  @override
  State<ActivityDetailsViewBody> createState() =>
      _ActivityDetailsViewBodyState();
}

class _ActivityDetailsViewBodyState extends State<ActivityDetailsViewBody> {
  final PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    DateTime theDate = DateFormat('yyyy-MM-dd').parse(widget.dayDate);

    final cubit = context.read<ActivityCardCubit>();

    List<Widget> images =
        (widget.activityModel.images as List<dynamic>).map((imageData) {
      return CachedNetworkImage(
        imageUrl: '$kBaseUrl$imageData',
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 200),
      );
    }).toList();

    return Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                child: imagesPageViewWithCounter(images, screenWidth, context),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ActivityTextsDetails(
                  activityName: widget.activityModel.name,
                  activityOpeningHours: widget.activityModel.openingHours,
                  activityRecmmendTime: widget.activityModel.recommendedTime,
                  activityTybe: widget.activityModel.type,
                  activityAbout: widget.activityModel.description,
                ),
              ),
              const Gap(80),
            ],
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: CustomAddButton(
          theplan: false,
          screenWidth: screenWidth,
          onTap: () {
            cubit.setactivitiesCardData(widget.dayIndex, {
              'id': widget.activityModel.id,
              'name': widget.activityModel.name,
              'description': widget.activityModel.description,
              'images': widget.activityModel.images![0],
            });

            Navigator.pop(context);
          },
          text: 'Add To ${DateFormat('EEEE d MMMM ').format(theDate)}',
        ),
      ),
    ]);
  }

  Stack imagesPageViewWithCounter(
      List<Widget> images, double screenWidth, BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return images[index];
          },
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
        Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 20,
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //  Gap(10),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    color: Colors.white,
                    onPressed: () {
                      pageController.animateToPage(currentPage - 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease);
                    },
                  ),
                  Text(
                    '${currentPage + 1} of ${images.length}',
                    style: AppStyles.styleInterBold20(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    color: Colors.white,
                    onPressed: () {
                      pageController.animateToPage(currentPage + 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease);
                    },
                  ),
                  //   Gap(5),
                ]),
          ),
        ),
      ],
    );
  }
}
