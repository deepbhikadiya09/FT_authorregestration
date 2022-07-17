import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'common_function.dart';

CachedNetworkImage getImageView(
    {String? finalUrl,
    double errorHeight = 100.0,
    double errorWidth = 100.0,
    double? height,
    double? width,
    fit: BoxFit.none,
    Decoration? shape,
    Color? color}) {
  // String imageUrl = !isNullEmptyOrFalse(finalUrl) ? finalUrl! : "";
  return new CachedNetworkImage(
    imageUrl: finalUrl!,
    fit: fit,
    height: height,
    width: width,
    placeholder: (context, url) => Container(
      margin: EdgeInsets.all(20),
      // height: 50,
      // width: 50,
      child: Center(
        child: circularLoader()
      ),
    ),
    errorWidget: (context, url, error) => Container()//new Icon(Icons.error),
  );
}
