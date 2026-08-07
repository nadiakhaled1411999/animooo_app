import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomSVGImage extends StatelessWidget {
  const CustomSVGImage({
    super.key,
    required this.asset,
    this.matchTextDirection = true,
    this.color,
    this.fit = BoxFit.contain,
    this.onTap,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  final String asset;
  final void Function()? onTap;
  final Color? color;
  final BoxFit fit;
  final bool matchTextDirection;

  @override
  Widget build(BuildContext context) {
    if (asset.contains("http")) {
      return SvgPicture.network(
        asset,
        // fit: BoxFit.fill,
        matchTextDirection: matchTextDirection,
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        asset,
        width: width?.w ?? 0,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        height: height?.h ?? 0,

        //  fit: fit,
        matchTextDirection: matchTextDirection,
      ),
    );
  }
}
