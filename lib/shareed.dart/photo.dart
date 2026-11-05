import 'dart:ui';
import 'package:flutter/material.dart';

/// شادو بيتبع شكل الصورة الشفافة نفسها (مش مستطيل)
/// بيرسم نسخة سودة مموّهة من نفس الصورة تحتها، وبيكرر الشادو
/// فوق وتحت بإزاحة بسيطة عشان يدّي إحساس عمق من الاتجاهين
class ShapeShadowImage extends StatelessWidget {
  final String assetPath;
  final double width;
  final double? height;
  final Color shadowColor;
  final double blurSigma;
  final double topOffset;
  final double bottomOffset;
  final double shadowOpacity;

  const ShapeShadowImage({
    super.key,
    required this.assetPath,
    this.width = 200,
    this.height,
    this.shadowColor = Colors.black,
    this.blurSigma = 8,
    this.topOffset = 6,
    this.bottomOffset = 10,
    this.shadowOpacity = 0.45,
  });

  Widget _shadowLayer(double dy) {
    return Positioned.fill(
      top: dy,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            shadowColor.withOpacity(shadowOpacity),
            BlendMode.srcIn,
          ),
          child: Image.asset(assetPath, width: width, height: height),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // شادو تحت (أكبر إزاحة)
        _shadowLayer(bottomOffset),
        // شادو فوق (إزاحة عكسية بسيطة)
        _shadowLayer(-topOffset),
        // الصورة الأصلية فوق الاتنين
        Image.asset(assetPath, width: width, height: height),
      ],
    );
  }
}