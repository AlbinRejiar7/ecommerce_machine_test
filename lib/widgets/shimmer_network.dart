import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_machine_test/constants/images.dart';
import 'package:ecommerce_machine_test/utils/is_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final double? width;
  final double? height;

  const ShimmerNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildPlaceholder();
    }

    bool isNetwork = isNetworkImage(imageUrl!);
    bool isAsset = imageUrl!.startsWith('assets');
    bool isFile = Uri.tryParse(imageUrl!)?.isAbsolute == false;

    return ClipRRect(
      borderRadius: borderRadius,
      child: isNetwork
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: fit,
              width: width,
              height: height,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => _buildPlaceholder(),
            )
          : isAsset
              ? Image.asset(
                  imageUrl!,
                  fit: fit,
                  width: width,
                  height: height,
                )
              : isFile
                  ? _loadFileImage()
                  : _buildPlaceholder(),
    );
  }

  Widget _loadFileImage() {
    try {
      final file = File(imageUrl!);

      if (file.existsSync()) {
        return Image.file(
          file,
          fit: fit,
          width: width,
          height: height,
        );
      } else {
        return _buildPlaceholder();
      }
    } catch (e) {
      return _buildPlaceholder();
    }
  }

  Widget _buildPlaceholder() {
    return Image.asset(
      noImageAvailable,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
