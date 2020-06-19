import 'package:lopstructuretest/common/imagelib/extend_image_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GalleryItem {
  GalleryItem({this.id, this.resource, this.isSvg = false});
  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail(
      {Key key, this.galleryExampleItem, this.onTap})
      : super(key: key);

  final GalleryItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image(

            image: ExtendedNetworkImageProvider(galleryExampleItem.resource,cache: true),
          ),

        ),
      ),
    );
  }
}



