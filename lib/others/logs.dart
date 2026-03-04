import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

Future<void> showLogViewerDialog() async {
  bool hasLogs = FlutterArtist.logger.hasLogEntries();

  if (hasLogs) {
    await FlutterArtist.showLogViewerDialog();
  }
}

// Docs: [14545].
void printLogInfo() {
  Logger logger = FlutterArtist.logger;

  print("hasRecentLogEntries: ${logger.hasRecentLogEntries}");
  print("recentErrorCount ${logger.recentErrorCount}");
  print("recentWarningCount ${logger.recentWarningCount}");
  print("totalErrorCount ${logger.totalErrorCount}");
  print("totalWarningCount ${logger.totalWarningCount}");

  for (LogEntry logEntry in logger.logEntries) {
    // error, warning,..
    print("logEntry.logEntryType: ${logEntry.logEntryType}");
    if (logEntry.logEntryType == LogEntryType.error) {
      ErrorInfo errorInfo = logEntry.errorInfo as ErrorInfo;
      print("errorInfo.errorMessage: ${errorInfo.errorMessage}");
      print("errorInfo.errorDetails: ${errorInfo.errorDetails}");
      print("StackTrace:\n ${errorInfo.stackTrace}");
    }
    //
    else if (logEntry.logEntryType == LogEntryType.warning) {
      WarningInfo warningInfo = logEntry.warningInfo as WarningInfo;
      print("warningInfo.errorMessage: ${warningInfo.warningMessage}");
    }
  }
}
