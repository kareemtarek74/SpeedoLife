import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        activeImage: Assets.imagesActiveImagesHome,
        inActiveImage: Assets.imagesInActiveImagesHome,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesActiveImagesCart,
        inActiveImage: Assets.imagesInActiveImagesCart,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesActiveImagesSale,
        inActiveImage: Assets.imagesInActiveImagesSale,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesActiveImagesFavourite,
        inActiveImage: Assets.imagesInActiveImagesFavourite,
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesActiveImagesUser,
        inActiveImage: Assets.imagesInActiveImagesUser,
      ),
    ];
