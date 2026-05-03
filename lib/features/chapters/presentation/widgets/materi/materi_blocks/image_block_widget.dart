import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

class ImageBlockWidget extends StatelessWidget {
  final ImageBlock block;
  
  const ImageBlockWidget({
    super.key,
    required this.block,
  });
  
  @override
  Widget build(BuildContext context) {
    final img = Image.asset(
      block.assetPath, 
      width: block.width, 
      fit: BoxFit.contain,
    );
    
    return GestureDetector(
      onTap: () => _showZoomedImage(context, block.assetPath),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (block.border)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange.shade200, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: img,
            )
          else
            img,
          if (block.caption != null) ...[
            const SizedBox(height: 6),
            Text(
              block.caption!,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
  
  void _showZoomedImage(BuildContext context, String assetPath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.95),
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: PhotoView(
                imageProvider: AssetImage(assetPath),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,
                backgroundDecoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}