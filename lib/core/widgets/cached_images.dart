import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWithCache extends StatelessWidget {
  final String imageUrl;
  final double aspectRatio;
  final BoxFit? fit;
  const ImageWithCache({
    super.key,
    required this.imageUrl,
    this.aspectRatio = 1.0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.broken_image,
          size: 40,
          color: Colors.grey,
        ),
      ),
    );
  }
}
