import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/view_product_card_details_page/view_product_card_details_page_cubit.dart';
import '../widgets/responsive_safe_area.dart';

class ViewProductCardDetailsPage extends StatefulWidget {
  const ViewProductCardDetailsPage({
    super.key,
  });

  @override
  _ViewProductCardDetailsPage createState() => _ViewProductCardDetailsPage();
}

class _ViewProductCardDetailsPage extends State<ViewProductCardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestinationPageCubit, ViewProductCardDetailsState>(
      listener: (_, ViewProductCardDetailsState state) {},
      builder: (BuildContext context, ViewProductCardDetailsState state) {
        return BlocBuilder<DestinationPageCubit, ViewProductCardDetailsState>(
          buildWhen: (ViewProductCardDetailsState oldState,
                  ViewProductCardDetailsState newState) =>
              oldState != newState,
          builder: (BuildContext context, ViewProductCardDetailsState state) {
            return ResponsiveSafeArea(
                builder: (BuildContext context, Size size) {
              return const Scaffold();
            });
          },
        );
      },
    );
  }
}
