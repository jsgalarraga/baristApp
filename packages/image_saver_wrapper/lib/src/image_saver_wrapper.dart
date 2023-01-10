import 'package:gallery_saver/gallery_saver.dart';

class ImageSaverWrapper {
  ImageSaverWrapper();

  Future<bool?> saveImageFromUrl(String imageUrl) {
    return GallerySaver.saveImage(imageUrl);
  }
}
