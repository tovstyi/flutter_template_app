import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post_entity.dart';
import '../bloc/home_page/home_page_cubit.dart';
import '../widgets/loading_failure.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_skeleton.dart';
import '../widgets/responsive_safe_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late List<ProductEntity> posts = [];

  @override
  void initState() {
    super.initState();

    // TODO: add loading data for entities
    // context.read<HomePageCubit>().loadGalleryPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (_, state) {
        if (state is GalleryPostsLoaded) {
          posts = state.galleryPosts;
        }
      },
      builder: (context, state) {
        return BlocBuilder<HomePageCubit, HomePageState>(
          buildWhen: (oldState, newState) => oldState != newState,
          builder: (context, state) {
            return ResponsiveSafeArea(
              builder: (BuildContext context, Size size) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.width > 412
                              ? size.height * 0.01
                              : size.height * 0.015),
                      child: RefreshIndicator(
                        color: Colors.green,
                        // TODO: add onRefresh
                        // onRefresh: () async =>
                        // context.read<HomePageCubit>().loadGalleryPosts(),
                        onRefresh: () async => {},
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: state is LoadingGalleryPosts
                                ? 6
                                : state is GalleryPostsLoaded
                                    ? state.galleryPosts.length
                                    : 0,
                            itemBuilder: (BuildContext context, int index) =>
                                state is! LoadingGalleryPosts
                                    ? ProductCard(
                                        productData: posts[index],
                                        size: size,
                                      )
                                    : const GalleryPostSkeleton()),
                      ),
                    ),

                    // TODO: show error widget when handle errors and exceptions
                    Visibility(
                        visible: state is HomePageServerFailure,
                        child: const LoadingFailure(
                          errorText: "Failed to load posts from server",
                        )),
                    Visibility(
                        visible: state is LoadingCachedGalleryPostsFailure,
                        child: const LoadingFailure(
                          errorText: "Failed to load posts from cache",
                        )),
                    Visibility(
                        visible: state is HomePageUnauthorized,
                        child: const LoadingFailure(
                          errorText: "Authorise to load posts",
                        )),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
