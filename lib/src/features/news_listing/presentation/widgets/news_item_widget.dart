import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import 'package:news_app/src/features/news_listing/presentation/widgets/inline_image.dart';
import 'package:news_app/src/features/news_listing/presentation/widgets/news_item_footer.dart';

/// {@template post_medium_description_layout}
/// A reusable post medium news block widget showing post description.
/// {@endtemplate}
class NewsItemWidget extends StatelessWidget {
  /// {@macro post_medium_description_layout}
  const NewsItemWidget({
    required this.title,
    required this.imageUrl,
    required this.publishedAt,
    this.description,
    this.author,
    this.onShare,
    super.key,
  });

  /// Title of post.
  final String title;

  /// Description of post.
  final String? description;

  /// The date when this post was published.
  final DateTime publishedAt;

  /// The author of this post.
  final String? author;

  /// Called when the share button is tapped.
  final VoidCallback? onShare;

  /// The url of this post image.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleLarge
                      ?.copyWith(color: AppColors.highEmphasisSurface),
                  maxLines: 6,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: InlineImage(imageUrl: imageUrl),
              ),
            ],
          ),
          Text(
            description ?? '',
            style: textTheme.bodyMedium
                ?.copyWith(color: AppColors.mediumEmphasisSurface),
          ),
          const SizedBox(height: AppSpacing.sm),
          PostFooter(
            publishedAt: publishedAt,
            author: author,
            onShare: onShare,
          ),
        ],
      ),
    );
  }
}
