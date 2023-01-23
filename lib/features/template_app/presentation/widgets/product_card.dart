import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/post_entity.dart';
import '../bloc/view_product_card_details_page/view_product_card_details_page_cubit.dart';
import '../screens/view_product_card_details_page.dart';

class ProductCard extends StatefulWidget {
  final ProductEntity productData; // TODO: pass product data
  final Size size; // TODO: pass size from ResponsiveSafeArea widget builder

  const ProductCard({super.key, required this.productData, required this.size});

  @override
  _ProductCard createState() => _ProductCard();
}

class _ProductCard extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(PageTransition(
        child: BlocProvider<DestinationPageCubit>(
            create: (_) => sl<DestinationPageCubit>(),
            child:
                const ViewProductCardDetailsPage()), // TODO: change destination page
        type: PageTransitionType.fade, // TODO: change transition type
        alignment: Alignment.center,
      )),
    );
  }
}
