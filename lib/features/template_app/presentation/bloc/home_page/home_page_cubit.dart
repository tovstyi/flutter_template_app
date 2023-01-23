import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/load_posts_usecase.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final LoadPostsUseCase loadPostsUseCase;

  HomePageCubit({required this.loadPostsUseCase}) : super(HomePageInitial());

  // loadGalleryPosts() async {
  //   emit(LoadingGalleryPosts());
  //   final response = await loadGalleryPostsUseCase();
  //   return response.fold((failure) {
  //     if (failure is UnauthorizedFailure) {
  //       return emit(HomePageUnauthorized());
  //     } else if (failure is ServerFailure || failure is SocketFailure) {
  //       return emit(HomePageServerFailure());
  //     } else {
  //       return emit(LoadingCachedGalleryPostsFailure());
  //     }
  //   }, (response) => emit(GalleryPostsLoaded(galleryPosts: response)));
  // }
}
