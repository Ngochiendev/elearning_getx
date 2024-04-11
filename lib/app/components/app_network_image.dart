import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/generated/resource.dart';
import 'package:http/http.dart' as http;

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    Key? key,
    this.source,
    this.style = "none",
    this.fit = BoxFit.contain,
    this.decoration,
  }) : super(key: key);

  final String? source;
  final String? style;
  final BoxFit fit;
  final BoxDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    // var url = Uri.parse('https://example.com/whatsit/create');
    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
    return source == null || source!.isEmpty || !source!.startsWith('http')
        ? Image.asset(
            R.ASSETS_PNG_NOIMAGE_PNG,
            fit: BoxFit.fill,
          )
        : CachedNetworkImage(
            imageUrl: source ?? "",
            placeholder: (context, url) => Center(
              widthFactor: 2,
              heightFactor: 2,
              child: Container(
                width: 24,
                height: 24,
                
                child: CircularProgressIndicator(
                  color: colorPrimaryBlue100,
                  strokeWidth: 2.0,
                ),
              ),
            ),
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png",
            ),
          );
  }
}

// class BaseNetworkImage extends StatelessWidget {
//   const BaseNetworkImage({
//     Key? key,
//     this.source,
//     this.style = "none",
//     this.fit = BoxFit.contain,
//   }) : super(key: key);

//   final String? source;
//   final String? style;
//   final BoxFit fit;

//   @override
//   Widget build(BuildContext context) {
//     // var url = Uri.parse('https://example.com/whatsit/create');
//     // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
//     return source == null || source!.isEmpty || !source!.startsWith('http')
//         ? Image.asset(
//             R.ASSETS_PNG_NOIMAGE_PNG,
//             fit: BoxFit.contain,
//           )
//         : CachedNetworkImageProvider(
//             imageUrl: source ?? "",
//             placeholder: (context, url) => Center(
//               widthFactor: 2,
//               heightFactor: 2,
//               child: Container(
//                 width: 24,
//                 height: 24,
//                 child: CircularProgressIndicator(
//                   color: colorPrimaryBlue100,
//                   strokeWidth: 2.0,
//                 ),
//               ),
//             ),
//             fit: BoxFit.contain,
//             errorWidget: (context, url, error) => CachedNetworkImageProvider(
//               imageUrl:
//                   "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png",
//             ),
//           );
//   }
// }
