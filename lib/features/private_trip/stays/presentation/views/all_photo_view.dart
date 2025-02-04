import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class AllPhotosView extends StatelessWidget {
  const AllPhotosView({super.key, required this.hotel});
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              backgroundColor: kPrimaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.custom(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 2),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: hotel.images!.length,
                  (context, index) => CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: '$kBaseUrl${hotel.images![index]}'),
                ),
              ),
            )));
  }
}
