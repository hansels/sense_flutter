import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/functions/place_holder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PictureFactory {
  static Widget build(
    String imageUrl, {
    BoxFit fit = BoxFit.cover,
    double placeholderRatioX = 16,
    double placeholderRatioY = 9,
    Widget placeholder,
    double placeholderHeight,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      fadeInCurve: Curves.fastOutSlowIn,
      alignment: Alignment.center,
      placeholder: (context, url) => placeholder == null
          ? Center(
              child: AspectRatio(
                aspectRatio: placeholderRatioX / placeholderRatioY,
                child: SpinKitFadingCircle(color: Configs.secondaryColor),
              ),
            )
          : placeholder,
      errorWidget: (context, url, error) => placeholder == null
          ? PlaceHolder(
              ratioX: placeholderRatioX,
              ratioY: placeholderRatioY,
              height: placeholderHeight,
            )
          : placeholder,
    );
  }
}
