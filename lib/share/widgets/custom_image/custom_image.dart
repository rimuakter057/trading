// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// enum ImageType { png, svg }

// class CustomImage extends StatefulWidget {
//   final String imageSrc;
//   final Color? imageColor;
//   final double? height;
//   final double? scale;
//   final double? width;
//   final double? sizeWidth;
//   final ImageType imageType;
//   final BoxFit? fit;
//   final double horizontal;
//   final double vertical;
//   final BoxFit? boxFit;

//   const CustomImage({
//     required this.imageSrc,
//     this.imageColor,
//     this.sizeWidth,
//     this.imageType = ImageType.svg,
//     super.key,
//     this.fit,
//     this.scale,
//     this.horizontal = 0.0,
//     this.vertical = 0.0,
//     this.boxFit,
//     this.height,
//     this.width,
//   });

//   @override
//   State<CustomImage> createState() => _CustomImageState();
// }

// class _CustomImageState extends State<CustomImage> {
//   late Widget imageWidget;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.imageSrc.endsWith('svg')) {
//       imageWidget = SvgPicture.asset(
//         widget.imageSrc,
//         // ignore: deprecated_member_use
//         color: widget.imageColor,
//         height: widget.height,
//         width: widget.width,
//         fit: widget.boxFit ?? BoxFit.cover,
//       );
//     }

//     if (widget.imageSrc.endsWith('png')) {
//       imageWidget = Image.asset(
//         fit: widget.fit,
//         widget.imageSrc,
//         color: widget.imageColor,
//         height: widget.height,
//         width: widget.width,
//         scale: widget.scale ?? 1,
//       );
//     }

//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: widget.horizontal,
//         vertical: widget.vertical,
//       ),
//       width: widget.sizeWidth,
//       child: imageWidget,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// StatelessWidget: Child and Alignment support er jonno erup poriborton kora holo
class CustomImage extends StatelessWidget {
  final String imageSrc;
  final Color? imageColor;
  final double? height;
  final double? scale;
  final double? width;
  final double? sizeWidth;
  // final ImageType imageType; // Removed as requested
  final BoxFit? fit;
  final double horizontal;
  final double vertical;
  final BoxFit? boxFit;

  // Child er jonno notun properties:
  final AlignmentGeometry alignment; // Child-ke align korar jonno
  final EdgeInsetsGeometry? padding;
  final Widget? child; // Image er opore rakhar jonno child widget

  const CustomImage({
    super.key,
    required this.imageSrc,
    this.imageColor,
    this.sizeWidth,
    this.fit,
    this.scale,
    this.horizontal = 0.0,
    this.vertical = 0.0,
    this.boxFit,
    this.height,
    this.width,
    this.alignment = Alignment.center, // Default: Center
    this.padding,
    this.child,
  });

  // Image rendering logic (Helper function for SRP)
  Widget _buildImageWidget() {
    // SVG handling: URL-er sheshe '.svg' thakle SvgPicture bebohar hobe
    if (imageSrc.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        imageSrc,
        // ignore: deprecated_member_use
        color: imageColor,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.contain,
      );
    }

    // PNG/other asset formats handling (Default Image.asset)
    return Image.asset(
      imageSrc,
      color: imageColor,
      height: height,
      width: width,
      scale: scale ?? 1,
      fit: fit ?? BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Container size, margin, and padding set kora hoche
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      padding: padding,
      // Container ekhon nijer width/height set korbe jodi pass kora hoy
      width: sizeWidth ?? width,
      height: height,

      // Stack byabohar kora hoche jate image (layer 1) er opore child (layer 2) thakte pare.
      child: Stack(
        // Alignment controls where the 'child' is positioned within the Stack
        alignment: alignment as Alignment,
        children: [
          // 1. Image/SVG (Base Layer): Ekhon _buildImageWidget() directly Stack-er child.
          // Positioned.fill remove kora holo jate "size.isFinite" error na ashe
          // jokhon Stack unconstrained thake. Image-er 'height' o 'width' property-gulo
          // image-er size control korbe, jeta Stack-ke size debe.
          _buildImageWidget(),

          // 2. Child Widget (Top Layer): Only rendered if provided
          if (child != null) child!,
        ],
      ),
    );
  }
}
