import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gsmpay_interview/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBoxWidget extends StatefulWidget {
  final String label;
  final ValueChanged<XFile>? onPick;
  final VoidCallback? onDelete;
  final XFile? selectedImage;
  final bool isLoading;
  final bool required;

  const ImagePickerBoxWidget({
    super.key,
    required this.label,
    this.onPick,
    this.selectedImage,
    this.onDelete,
    this.isLoading = false,
    this.required = false,
  });

  @override
  State<ImagePickerBoxWidget> createState() => _ImagePickerBoxWidgetState();
}

class _ImagePickerBoxWidgetState extends State<ImagePickerBoxWidget> {
  XFile? _selectedImage;

  @override
  void initState() {
    _selectedImage = widget.selectedImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Builder(
            builder: (context) {
              if (widget.isLoading) {
                return DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  dashPattern: [6, 6],
                  strokeWidth: 1,
                  padding: const EdgeInsets.all(10),
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (_selectedImage == null) {
                return InkWell(
                  onTap: _onTap,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(16),
                    padding: const EdgeInsets.all(10),
                    dashPattern: [6, 6],
                    strokeWidth: 1,
                    child: Center(child: Text(S.of(context).pick_image)),
                  ),
                );
              } else {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FutureBuilder<Uint8List>(
                        future: _selectedImage!.readAsBytes(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError || !snapshot.hasData) {
                            return Center(
                              child: Text(S.of(context).error_viewing_image),
                            );
                          }
                          return Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                            width: 130,
                            height: 130,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.clear_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _selectedImage = null;
                          setState(() {});
                          widget.onDelete?.call();
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
        const SizedBox(height: 10),
        Text('${widget.label}${widget.required ? '*' : ''}'),
      ],
    );
  }

  _onTap() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage = image;
      setState(() {});
      widget.onPick?.call(image);
    }
  }
}
