import 'dart:io';

import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

/// Profile picture uploader with a dashed rounded placeholder.
///
/// Tapping the box opens a bottom sheet with Photo Gallery, Camera and Cancel
/// options. Once an image is picked it replaces the placeholder.
class ProfileImageUpload extends StatefulWidget {
  const ProfileImageUpload({super.key});

  @override
  State<ProfileImageUpload> createState() => _ProfileImageUploadState();
}

class _ProfileImageUploadState extends State<ProfileImageUpload> {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picked = await _imagePicker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (picked == null || !mounted) return;
    setState(() {
      _image = picked;
    });
  }

  void _showPickerSheet() {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: AppColors.primary,
                ),
                title: Text(
                  'Photo Gallery',
                  style: AppTextStyles.font12RegularTextPrimary,
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: AppColors.primary,
                ),
                title: Text(
                  'Camera',
                  style: AppTextStyles.font12RegularTextPrimary,
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.close,
                  color: AppColors.iconSecondary,
                ),
                title: Text(
                  'Cancel',
                  style: AppTextStyles.font12RegularTextPrimary,
                ),
                onTap: () => Navigator.pop(context),
              ),
              verticalSpace(8),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showPickerSheet,
      child: SizedBox(
        width: double.infinity,
        height: 180.h,
        child: _image == null
            ? const _UploadPlaceholder()
            : _ImagePreview(file: File(_image!.path)),
      ),
    );
  }
}

class _UploadPlaceholder extends StatelessWidget {
  const _UploadPlaceholder();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _DashedBorderPainter(
        color: AppColors.primary,
        backgroundColor: AppColors.uploadBackground,
        borderRadius: 12,
      ),
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo,
              size: 32.sp,
              color: AppColors.primary,
            ),
            verticalSpace(12),
            Text(
              'Select file',
              style: AppTextStyles.font12RegularPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        file,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

/// Paints the upload background fill and a dashed rounded border around it.
class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({
    required this.color,
    required this.backgroundColor,
    required this.borderRadius,
  });

  final Color color;
  final Color backgroundColor;
  final double borderRadius;

  static const double _dashWidth = 6;
  static const double _dashSpace = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rrect, Paint()..color = backgroundColor);

    final borderPath = Path()..addRRect(rrect);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    for (final metric in borderPath.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + _dashWidth).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + _dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.borderRadius != borderRadius;
  }
}
