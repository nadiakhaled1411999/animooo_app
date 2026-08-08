mixin PngAssets {
  static const String pngAssets = "assets/images/";
}

mixin SvgAssets {
  static const String svgAssets = "assets/icons/";
}

class AppAssets with PngAssets, SvgAssets {
  // Image PNG
  // static const String animalPlaceholder =
  //     "${PngAssets.pngAssets}animal_placeholder.png";

  // Icons SVG
  static const String logoApp = "${SvgAssets.svgAssets}logo_app.svg";
}
