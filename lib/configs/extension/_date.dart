part of '../configs.dart'; // Or remove if it's a standalone file

final _dateTimeWords = DateFormat('MMM. dd, hh:mma'); // Corrected AM/PM format

extension SuperDate on DateTime {
  String get dateTimeWords => _dateTimeWords.format(toLocal());

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return '1 day ago';
      }
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      if (difference.inHours == 1) {
        return '1 hour ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      if (difference.inMinutes == 1) {
        return '1 minute ago';
      }
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }
}
