import 'package:app_ui/app_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PostFooter extends StatelessWidget {
  //
  const PostFooter({
    super.key,
    this.publishedAt,
    this.author,
    this.onTapAuthor,
    this.onShare,
    this.isContentOverlaid = false,
  });

  /// The author of this post.
  final String? author;

  /// The date when this post was published.
  final DateTime? publishedAt;

  /// Called when the author text is tapped.
  final VoidCallback? onTapAuthor;

  /// Called when the share button is tapped.
  final VoidCallback? onShare;

  /// Whether footer is displayed in reversed color theme.
  ///
  /// Defaults to false.
  final bool isContentOverlaid;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textColor = isContentOverlaid
        ? AppColors.mediumHighEmphasisPrimary
        : AppColors.mediumEmphasisSurface;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: textTheme.bodySmall?.copyWith(color: textColor),
            children: <InlineSpan>[
              if (author != null) ...[
                TextSpan(
                  text: author,
                  style: textTheme.bodySmall?.copyWith(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Define the action to be taken when the TextSpan is clicked.
                      // For example, you can navigate to another screen or open a URL.
                      debugPrint('Author clicked: $author');
                      onTapAuthor?.call();
                    },
                ),
                const WidgetSpan(child: SizedBox(width: AppSpacing.sm)),
                TextSpan(
                  text: '•',
                  style: textTheme.bodySmall,
                ),
                const WidgetSpan(child: SizedBox(width: AppSpacing.sm)),
              ],
              if (publishedAt != null)
                TextSpan(
                  text: publishedAt!.mDY,
                  style: textTheme.bodySmall,
                ),
            ],
          ),
        ),
        if (onShare != null)
          IconButton(
            icon: Icon(
              Icons.share,
              color: textColor,
            ),
            onPressed: onShare,
          ),
      ],
    );
  }
}
