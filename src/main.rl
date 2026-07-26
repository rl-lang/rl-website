get println, write_file from std::io
get path_push, path_exists, path_is_dir, path_parent from std::path
get mkdir, mkdir_all from std::fs
get replace from std::str
get assets::constants
get assets::styles
get utils::html_format
get utils::placeholder_replacer
get utils::html_body_builder
get arr_reverse, arr_push from std::array
get to_string from std::types

CONST string DIR = "web"

CONST string HEADER =
"<header class=\"site-header\">
\t<div class=\"container\">
\t\t<nav class=\"nav-container\">
\t\t\t<a href=\"#\" class=\"logo\">RL Lang</a>
\t\t\t<input type=\"checkbox\" id=\"nav-toggle\" class=\"nav-toggle-input\" />
\t\t\t<label for=\"nav-toggle\" class=\"nav-toggle\" aria-label=\"Toggle navigation\">
\t\t\t\t<span></span><span></span><span></span>
\t\t\t</label>
\t\t\t<ul class=\"nav-menu\">
\t\t\t\t<li><a href=\"#features\" class=\"nav-link\">Features</a></li>
\t\t\t\t<li><a href=\"#docs\" class=\"nav-link\">Docs</a></li>
\t\t\t\t<li><a href=\"https://github.com\" class=\"nav-link\">GitHub</a></li>
\t\t\t</ul>
\t\t</nav>
\t</div>
</header>"

CONST string HERO =
"<section class=\"hero\">
\t<div class=\"container\">
\t\t<h1>Welcome to the RL Programming Language website</h1>
\t\t<p>RL is a small, expressive language for scripting build tools and generating static sites, designed to stay readable as your project grows.</p>
\t\t<a href=\"#features\" class=\"btn\">Get Started</a>
\t</div>
</section>"

CONST string MAIN_LAYOUT =
"<main class=\"main-layout\">
\t<div class=\"container\">
\t\t<section id=\"features\" class=\"card-grid\">
\t\t\t<div class=\"card\">
\t\t\t\t<h2>Simple Syntax</h2>
\t\t\t\t<p>Clear, readable syntax that gets out of your way so you can focus on solving problems.</p>
\t\t\t</div>
\t\t\t<div class=\"card\">
\t\t\t\t<h2>Fast Builds</h2>
\t\t\t\t<p>A lightweight toolchain designed to compile and run scripts quickly.</p>
\t\t\t</div>
\t\t\t<div class=\"card\">
\t\t\t\t<h2>Standard Library</h2>
\t\t\t\t<p>Built-in modules for files, paths, strings, and arrays keep common tasks simple.</p>
\t\t\t</div>
\t\t</section>
\t\t<aside>
\t\t\t<div class=\"card\">
\t\t\t\t<h2>Quick Links</h2>
\t\t\t\t<p><a href=\"https://github.com/rl-lang/rl-lang\" class=\"nav-link\">Source on GitHub</a></p>
\t\t\t</div>
\t\t</aside>
\t</div>
</main>"

CONST string FOOTER =
"<footer class=\"site-footer\">
\t<div class=\"container\">
\t\t<p>&copy; 2026 RL Programming Language. All rights reserved.</p>
\t\t<ul class=\"footer-links\">
\t\t\t<li><a href=\"#features\">Features</a></li>
\t\t\t<li><a href=\"#docs\">Docs</a></li>
\t\t\t<li><a href=\"https://github.com/rl-lang/rl-lang\">GitHub</a></li>
\t\t</ul>
\t</div>
</footer>"

fn main() {
    // building body
    dec arr[string] tags = []
    tags = tags.arr_push("<div class=\"site-wrapper\">")?
    tags = tags.arr_push(HEADER.to_string()?)?
    tags = tags.arr_push(HERO.to_string()?)?
    tags = tags.arr_push(MAIN_LAYOUT.to_string()?)?
    tags = tags.arr_push(FOOTER.to_string()?)?
    tags = tags.arr_push("</div>")?
    dec formatted_body = ident(handle_body(BODY, tags))

    // main page name
    dec string main_page = "index.html"

    // building head
    dec arr[string] head_values = HEAD_DEFAULT_VALUES
    head_values[0] = "RL Programming Language"
    head_values[1] = "RL is a small, expressive language for scripting build tools and generating static sites."
    head_values[3] = "RL Programming Language"

    dec formatted_head = ident(handle_head(HEAD, head_values))

    // building page
    dec string main_page_content = HTML.replace("$*1", "en").replace("$*2", "ltr").replace("$1", formatted_head).replace("$2", formatted_body)

    // building styles file
    dec string style_location = head_values[2]
    dec string style = STYLE_TEMPLATE
    style = handle_style(style, STYLE_DEFAULT_VALUES)

    // saving page
    if !DIR.path_exists()? {
        DIR.mkdir()?
    }
    if !DIR.path_push(style_location)?.path_parent()?.path_exists()? {
        DIR.path_push(style_location)?.path_parent()?.mkdir_all()?
    }
    DIR.path_push(main_page)?.write_file(main_page_content)?
    DIR.path_push(style_location)?.write_file(style)?
}
