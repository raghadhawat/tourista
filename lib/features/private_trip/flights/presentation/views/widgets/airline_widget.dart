import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';

class AirlineWidget extends StatelessWidget {
  const AirlineWidget({
    super.key,
    required this.ticket,
  });
  final Ticket ticket;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          width: 20,
          height: 20,

          imageUrl: '$kBaseUrl${ticket.airLine?.image}',
          // placeholder: (context, url) => Center(
          //   child: CircularProgressIndicator(),
          // ),
          errorWidget: (context, url, error) {
            return Icon(Icons.error_outline);
          },
        ),
        Gap(10),
        Text(
          ticket.airLine!.name!,
          style: AppStyles.styleInterRegular14(context),
        )
      ],
    );
  }
}
