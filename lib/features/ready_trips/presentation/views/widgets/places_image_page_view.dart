import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class PlacesImagePageView extends StatefulWidget {
  const PlacesImagePageView({super.key, required this.images});
  final List<dynamic> images;
  @override
  State<PlacesImagePageView> createState() => _PlacesImagePageViewState();
}

class _PlacesImagePageViewState extends State<PlacesImagePageView> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .6,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Container(
                  width: screenWidth,
                  child: CachedNetworkImage(
                      imageUrl: "$kBaseUrl ${widget.images[index]}",
                      imageBuilder: (context, imageProvider) => Image(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                      errorWidget: (context, url, error) {
                        return Icon(Icons.error_outline);
                      }));
            },
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 40,
                height: 44,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: kPrimaryColor,
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                      '${currentPage + 1} of ${widget.images.length}',
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
      ),
    );
  }
}
