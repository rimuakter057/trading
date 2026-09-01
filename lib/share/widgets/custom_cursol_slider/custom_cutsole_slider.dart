// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

// class CustomCursorSlider extends StatefulWidget {
//   final List<String> imageUrls;
//   final double viewportFraction;
//   final Duration autoScrollDuration;
//   final Curve animationCurve;
//   final double mainImageHeight;
//   final double mainImageWidth;
//   final double minScale;
//   final double maxScale;
//   final double minOpacity;
//   final double maxOpacity;
//   final double imageSpacing;

//   const CustomCursorSlider({
//     super.key,
//     required this.imageUrls,
//     this.viewportFraction = 0.7,
//     this.autoScrollDuration = const Duration(seconds: 3),
//     this.animationCurve = Curves.easeInOutQuint,
//     this.mainImageHeight = 450,
//     this.mainImageWidth = 300,
//     this.minScale = 0.85,
//     this.maxScale = 1.0,
//     this.minOpacity = 0.7,
//     this.maxOpacity = 1.0,
//     this.imageSpacing = 10,
//   });

//   @override
//   State<CustomCursorSlider> createState() => _CustomSliderState();
// }

// class _CustomSliderState extends State<CustomCursorSlider> {
//   late PageController _pageController;
//   late List<String> images;
//   int currentPage = 0;
//   Timer? autoScrollTimer;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: widget.viewportFraction);
//     images = [
//       widget.imageUrls.last,
//       ...widget.imageUrls,
//       widget.imageUrls.first,
//     ];
//     currentPage = 1;
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _pageController.jumpToPage(currentPage);
//       startAutoScroll();
//     });
//   }

//   void startAutoScroll() {
//     autoScrollTimer = Timer.periodic(widget.autoScrollDuration, (timer) {
//       if (_pageController.hasClients) {
//         _pageController.nextPage(
//           duration: const Duration(milliseconds: 800),
//           curve: widget.animationCurve,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     autoScrollTimer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.mainImageHeight,
//       child: PageView.builder(
//         controllers: _pageController,
//         itemCount: images.length,
//         onPageChanged: (index) {
//           setState(() => currentPage = index);
//           _handleInfiniteScroll(index);
//         },
//         itemBuilder: (context, index) {
//           return AnimatedBuilder(
//             animation: _pageController,
//             builder: (context, child) {
//               double value = 0.0;
//               if (_pageController.position.haveDimensions) {
//                 value = _pageController.page! - index;
//               }

//               final double scale = (1 - (0.15 * value.abs())).clamp(
//                 widget.minScale,
//                 widget.maxScale,
//               );
//               final double opacity = (1 - (0.3 * value.abs())).clamp(
//                 widget.minOpacity,
//                 widget.maxOpacity,
//               );
//               final double margin = value.abs() * widget.imageSpacing;

//               return Center(
//                 child: Transform.scale(
//                   scale: scale,
//                   child: Opacity(
//                     opacity: opacity,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: margin),
//                       height: widget.mainImageHeight * scale,
//                       width: widget.mainImageWidth * scale,
//                       child: child,
//                     ),
//                   ),
//                 ),
//               );
//             },
//             child: _buildImageCard(images[index]),
//           );
//         },
//       ),
//     );
//   }

//   void _handleInfiniteScroll(int index) {
//     if (index == images.length - 1) {
//       Future.delayed(const Duration(milliseconds: 300), () {
//         _pageController.jumpToPage(1);
//       });
//     } else if (index == 0) {
//       Future.delayed(const Duration(milliseconds: 300), () {
//         _pageController.jumpToPage(images.length - 2);
//       });
//     }
//   }

//   Widget _buildImageCard(String imageUrl) {
//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 blurRadius: 10,
//                 spreadRadius: 5,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//             color: Colors.white,
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: CustomNetworkImage(
//               imageUrl: imageUrl,
//               height: widget.mainImageHeight,
//               width: widget.mainImageWidth,
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//         // Positioned(
//         //   bottom: 20,
//         //   left: 20,
//         //   right: 20,
//         //   child: ElevatedButton(
//         //     style: ElevatedButton.styleFrom(
//         //       backgroundColor: Colors.black.withOpacity(0.7),
//         //       shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.circular(30),
//         //       ),
//         //     ),
//         //     onPressed: () {},
//         //     child: const Text('SHOP THE LOOK'),
//         //   ),
//         // ),
//       ],
//     );
//   }
// }

// class CustomNetworkImage extends StatelessWidget {
//   final String imageUrl;
//   final double height;
//   final double width;
//   final BorderRadius? borderRadius;

//   const CustomNetworkImage({
//     super.key,
//     required this.imageUrl,
//     required this.height,
//     required this.width,
//     this.borderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: imageUrl,
//       imageBuilder:
//           (context, imageProvider) => Container(
//             height: height,
//             width: width,
//             decoration: BoxDecoration(
//               borderRadius: borderRadius,
//               image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
//             ),
//           ),
//       placeholder:
//           (context, url) => Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Container(
//               height: height,
//               width: width,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: borderRadius,
//               ),
//             ),
//           ),
//       errorWidget:
//           (context, url, error) => Container(
//             height: height,
//             width: width,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: borderRadius,
//             ),
//             child: const Icon(Icons.error),
//           ),
//     );
//   }
// }

class CustomCursorSlider extends StatefulWidget {
  final List<String> imageUrls;
  final double viewportFraction;
  final Duration autoScrollDuration;
  final Curve animationCurve;
  final double mainImageHeight;
  final double mainImageWidth;
  final double minScale;
  final double maxScale;
  final double minOpacity;
  final double maxOpacity;
  final double imageSpacing;
  final Color activeDotColor;
  final Color inactiveDotColor;
  final double activeDotSize;
  final double inactiveDotSize;
  final double dotSpacing;

  const CustomCursorSlider({
    super.key,
    required this.imageUrls,
    this.viewportFraction = 0.7,
    this.autoScrollDuration = const Duration(seconds: 3),
    this.animationCurve = Curves.easeInOutQuint,
    this.mainImageHeight = 450,
    this.mainImageWidth = 300,
    this.minScale = 0.85,
    this.maxScale = 1.0,
    this.minOpacity = 0.7,
    this.maxOpacity = 1.0,
    this.imageSpacing = 10,
    this.activeDotColor = Colors.blue,
    this.inactiveDotColor = Colors.grey,
    this.activeDotSize = 12,
    this.inactiveDotSize = 8,
    this.dotSpacing = 6,
  });

  @override
  State<CustomCursorSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomCursorSlider> {
  late PageController _pageController;
  late List<String> images;
  int currentPage = 0;
  Timer? autoScrollTimer;

  @override
  void initState() {
    super.initState();
    images = [
      widget.imageUrls.last,
      ...widget.imageUrls,
      widget.imageUrls.first,
    ];
    currentPage = 1;
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: currentPage,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoScroll();
    });
  }

  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: widget.animationCurve,
        );
      }
    });
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The Image Slider
        SizedBox(
          height: widget.mainImageHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() => currentPage = index);
              _handleInfiniteScroll(index);
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 0.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                  }

                  final double scale = (1 - (0.15 * value.abs())).clamp(
                    widget.minScale,
                    widget.maxScale,
                  );
                  final double opacity = (1 - (0.3 * value.abs())).clamp(
                    widget.minOpacity,
                    widget.maxOpacity,
                  );
                  final double margin = value.abs() * widget.imageSpacing;

                  return Center(
                    child: Transform.scale(
                      scale: scale,
                      child: Opacity(
                        opacity: opacity,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: margin),
                          height: widget.mainImageHeight * scale,
                          width: widget.mainImageWidth * scale,
                          child: child,
                        ),
                      ),
                    ),
                  );
                },
                child: _buildImageCard(images[index]),
              );
            },
          ),
        ),

        // Dot Indicators
        const SizedBox(height: 20),
        _buildDotIndicators(),
      ],
    );
  }

  Widget _buildDotIndicators() {
    // Convert infinite scroll index (1-5) to original index (0-4)
    int activeIndex;
    if (currentPage == 0) {
      activeIndex =
          widget.imageUrls.length - 1; // Last item when looping to start
    } else if (currentPage == images.length - 1) {
      activeIndex = 0; // First item when looping to end
    } else {
      activeIndex =
          currentPage - 1; // Normal case (-1 because of the prepended item)
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.imageUrls.length, // Always use original image count
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: widget.dotSpacing / 2),
            width:
                activeIndex == index
                    ? widget.activeDotSize
                    : widget.inactiveDotSize,
            height: 10.h,
            // activeIndex == index
            //     ? widget.activeDotSize
            //     : widget.inactiveDotSize,
            decoration: BoxDecoration(
              color:
                  activeIndex == index
                      ? widget.activeDotColor
                      : widget.inactiveDotColor,
              borderRadius: BorderRadius.circular(10.r),
              //shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }

  // ignore: unused_element
  void _jumpToPage(int index) {
    final page = index + 1; // +1 because of our infinite loop padding
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _handleInfiniteScroll(int index) {
    if (index == images.length - 1) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _pageController.jumpToPage(1);
      });
    } else if (index == 0) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _pageController.jumpToPage(images.length - 2);
      });
    }
  }

  Widget _buildImageCard(String imageUrl) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomNetworkImage2(
              imageUrl: imageUrl,
              height: widget.mainImageHeight,
              width: widget.mainImageWidth,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomNetworkImage2 extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const CustomNetworkImage2({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder:
          (context, imageProvider) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: borderRadius,
              ),
            ),
          ),
      errorWidget:
          (context, url, error) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: borderRadius,
            ),
            child: const Icon(Icons.error),
          ),
    );
  }
}
