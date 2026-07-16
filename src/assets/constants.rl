CONST string HTML =
"<!DOCTYPE html>
<html lang=\"$*1\" dir=\"$*2\">
\t<!-- HEAD -->
$1
\t<!-- END HEAD -->
\n\t<!-- BODY -->
$2
\t<!-- END BODY -->
</html>"

/// @placeholder $^1
/// @description The text displayed in the browser's title bar or tab.
/// @default "My Awesome Website"
/// ---
/// @placeholder $^2
/// @description A short summary of the page (150-160 characters) for search engine results.
/// @default "A modern, highly performant responsive web template built with structural HTML5."
/// ---
/// @placeholder $^3
/// @description Path to the primary CSS stylesheet.
/// @default "css/style.css"
/// ---
/// @placeholder $^4
/// @description The title of your page as it should appear when shared on social media (Facebook, LinkedIn, Discord).
/// @default "My Awesome Website"
/// ---
/// @placeholder $^5
/// @description The type of media object your page represents.
/// @default "website"
/// ---
/// @placeholder $^6
/// @description The canonical/permanent URL of the page used as the main address for social shares.
/// @default "https://example.com"
/// ---
/// @placeholder $^7
/// @description URL of the preview image displayed when the page is shared on social networks (Recommended size: 1200x630px).
/// @default "https://example.com/og-image.png"
/// ---
/// @placeholder $^8
/// @description Alt text describing the Open Graph image for screen readers and accessibility.
/// @default "Preview screenshot of My Awesome Website user interface."
/// ---
/// @placeholder $^9
/// @description Path to the fallback favicon.ico file (typically containing multiple sizes).
/// @default "/favicon.ico"
/// ---
/// @placeholder $^10
/// @description Path to the modern vector SVG favicon for scalable high-density displays.
/// @default "/icon.svg"
/// ---
/// @placeholder $^11
/// @description Path to the icon used when your site is saved to an Apple device home screen.
/// @default "icon.png"
/// ---
/// @placeholder $^12
/// @description Path to the progressive web app (PWA) manifest file.
/// @default "site.webmanifest"
/// ---
/// @placeholder $^13
/// @description The theme color shown in mobile browser address bars and UI headers.
/// @default "#fafafa"
/// ---
/// @placeholder $^14
/// @description Path to your primary JavaScript script (executed after HTML parsing completes).
/// @default "js/app.js"
CONST string HEAD =
"<head>
\t<meta charset=\"utf-8\" />
\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />
\n\t<title>$^1</title>
\n\t<meta name=\"description\" content=\"$^2\" />
\n\t<link rel=\"stylesheet\" href=\"$^3\" />
\n\t<meta property=\"og:title\" content=\"$^4\" />
\t<meta property=\"og:type\" content=\"$^5\" />
\t<meta property=\"og:url\" content=\"$^6\" />
\t<meta property=\"og:image\" content=\"$^7\" />
\t<meta property=\"og:image:alt\" content=\"$^8\" />
\n\t<link rel=\"icon\" href=\"$^9\" sizes=\"any\" />
\t<link rel=\"icon\" href=\"$^10\" type=\"image/svg+xml\" />
\t<link rel=\"apple-touch-icon\" href=\"$^11\" />
\t<link rel=\"manifest\" href=\"$^12\" />
\t<meta name=\"theme-color\" content=\"$^13\" />
\n\t<script src=\"$^14\" defer></script>
</head>"

CONST arr[string] DEFAULT_VALUES = [
  "My Awesome Website",                                                           // $^1  - Title
  "A modern, highly performant responsive web template built with structural HTML5.", // $^2  - Description
  "css/style.css",                                                                // $^3  - CSS URL
  "My Awesome Website",                                                           // $^4  - OG Title
  "website",                                                                      // $^5  - OG Type
  "https://example.com",                                                          // $^6  - OG Canonical URL
  "https://example.com/og-image.png",                                             // $^7  - OG Image URL
  "Preview screenshot of My Awesome Website user interface.",                     // $^8  - OG Image Alt
  "/favicon.ico",                                                                 // $^9  - Favicon .ico
  "/icon.svg",                                                                    // $^10 - SVG Icon
  "icon.png",                                                                     // $^11 - Apple Icon
  "site.webmanifest",                                                             // $^12 - Web Manifest
  "#fafafa",                                                                      // $^13 - Theme Color
  "js/app.js"                                                                     // $^14 - JS URL
]

CONST string BODY =
"<body>
$*&
</body>"
