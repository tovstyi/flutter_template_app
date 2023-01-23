import '../repositories/repository.dart';

class LoadPostsUseCase {
  final Repository repository;

  LoadPostsUseCase(this.repository);

  // Future<Either<Failure, List<ProductEntity>>> call() async {
  //   return await repository.loadGalleryPosts();
  // }
}
