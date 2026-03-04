// =============================================================================
//  APP BASE URL: **************************************************************
// =============================================================================

///
/// Prefix URL for Rest API.
///

const appBaseURL = "http://localhost:8889";

// =============================================================================
// STATIC RESOURCE BASE URL: ***************************************************
// =============================================================================

///
/// Prefix URL for Static Resources (Profile Image, Icon,..)
///
const staticResourceBaseURL = "http://localhost:8889";

// =============================================================================
//
// =============================================================================

String? getStaticResourceURL(String? path) {
  if (path == null || path.isEmpty) {
    return null;
  }
  if (path.startsWith("http://") ||
      path.startsWith("https://") ||
      path.startsWith("data:image")) {
    return path;
  }
  return "$staticResourceBaseURL$path";
}
