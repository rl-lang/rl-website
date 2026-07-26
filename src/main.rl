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
\t\t\t<a href=\"index.html\" class=\"logo\">RL Lang</a>
\t\t\t<input type=\"checkbox\" id=\"nav-toggle\" class=\"nav-toggle-input\" />
\t\t\t<label for=\"nav-toggle\" class=\"nav-toggle\" aria-label=\"Toggle navigation\">
\t\t\t\t<span></span><span></span><span></span>
\t\t\t</label>
\t\t\t<ul class=\"nav-menu\">
\t\t\t\t<li><a href=\"index.html\" class=\"nav-link\">Home</a></li>
\t\t\t\t<li><a href=\"docs.html\" class=\"nav-link\">Docs</a></li>
\t\t\t\t<li><a href=\"examples.html\" class=\"nav-link\">Examples</a></li>
\t\t\t\t<li><a href=\"https://github.com/rl-lang/rl-lang\" class=\"nav-link\">GitHub</a></li>
\t\t\t</ul>
\t\t</nav>
\t</div>
</header>"

CONST string HERO =
"<section class=\"hero\">
\t<div class=\"container\">
\t\t<h1>Welcome to the RL Programming Language website</h1>
\t\t<p>RL is a small, expressive language designed to stay readable as your project grows.</p>
\t\t<a href=\"docs.html\" class=\"btn\">Get Started</a>
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
\t\t\t\t<p><a href=\"docs.html\" class=\"nav-link\">Read the docs</a></p>
\t\t\t\t<p><a href=\"examples.html\" class=\"nav-link\">Browse examples</a></p>
\t\t\t</div>
\t\t</aside>
\t</div>
</main>"

CONST string FOOTER =
"<footer class=\"site-footer\">
\t<div class=\"container\">
\t\t<p>&copy; 2026 RL Programming Language. All rights reserved.</p>
\t\t<ul class=\"footer-links\">
\t\t\t<li><a href=\"index.html\">Home</a></li>
\t\t\t<li><a href=\"docs.html\">Docs</a></li>
\t\t\t<li><a href=\"examples.html\">Examples</a></li>
\t\t\t<li><a href=\"https://github.com\">GitHub</a></li>
\t\t</ul>
\t</div>
</footer>"

CONST string RL_HIGHLIGHT_JS =
"(function () {
  \"use strict\";

  var KEYWORDS = [
    \"fn\",
    \"for\",
    \"while\",
    \"return\",
    \"continue\",
    \"break\",
    \"get\",
    \"from\",
    \"in\",
    \"or\",
    \"and\",
    \"null\",
    \"dec\",
    \"if\",
    \"else\",
    \"as\",
    \"match\",
    \"CONST\",
    \"loop\",
    \"impl\",
  ];

  var TYPES = [
    \"int\",
    \"float\",
    \"bool\",
    \"string\",
    \"byte\",
    \"char\",
    \"arr\",
    \"error\",
    \"result\",
  ];

  var LITERALS = [\"true\", \"false\", \"ok\", \"err\"];

  var KEYWORD_SET = new Set(KEYWORDS);
  var TYPE_SET = new Set(TYPES);
  var LITERAL_SET = new Set(LITERALS);

  var TOKEN_PATTERNS = [
    { name: \"comment\", regex: /^\\/\\/[^\\n]*/ },
    { name: \"string\", regex: /^\"(?:[^\"\\\\]|\\\\.)*\"/ },
    { name: \"char\", regex: /^'(?:[^'\\\\]|\\\\.)*'/ },
    { name: \"number\", regex: /^\\d+\\.\\d+|^\\d+/ },
    { name: \"word\", regex: /^[A-Za-z_][A-Za-z0-9_]*/ },
    {
      name: \"op\",
      regex:
        /^(==|!=|<=|>=|->|=>|\\+=|-=|\\*=|\\/=|::|\\.\\.|[+\\-*/=<>!?&|.,:;(){}\\[\\]])/,
    },
    { name: \"whitespace\", regex: /^\\s+/ },
  ];

  function classify(word) {
    if (KEYWORD_SET.has(word)) return \"rl-kw\";
    if (TYPE_SET.has(word)) return \"rl-type\";
    if (LITERAL_SET.has(word)) return \"rl-lit\";
    return \"rl-ident\";
  }

  function escapeHtml(s) {
    return s
      .replace(/&/g, \"&amp;\")
      .replace(/</g, \"&lt;\")
      .replace(/>/g, \"&gt;\")
      .replace(/\"/g, \"&quot;\")
      .replace(/'/g, \"&#39;\");
  }

  function highlight(source) {
    var out = [];
    var pos = 0;
    var len = source.length;

    while (pos < len) {
      var rest = source.slice(pos);
      var matched = false;

      for (var i = 0; i < TOKEN_PATTERNS.length; i++) {
        var pat = TOKEN_PATTERNS[i];
        var m = pat.regex.exec(rest);
        if (m && m[0].length > 0) {
          var text = m[0];
          var cls;
          if (pat.name === \"word\") {
            cls = classify(text);
          } else if (pat.name === \"whitespace\") {
            out.push(escapeHtml(text));
            pos += text.length;
            matched = true;
            break;
          } else {
            cls = \"rl-\" + pat.name;
          }
          out.push('<span class=\"' + cls + '\">' + escapeHtml(text) + \"</span>\");
          pos += text.length;
          matched = true;
          break;
        }
      }

      if (!matched) {
        out.push(escapeHtml(source[pos]));
        pos += 1;
      }
    }

    return out.join(\"\");
  }

  function rlHighlightAll() {
    var blocks = document.querySelectorAll(\"pre.rl-code\");
    for (var i = 0; i < blocks.length; i++) {
      var block = blocks[i];
      var source = block.textContent;
      block.innerHTML = highlight(source);
    }
  }

  window.rlHighlightAll = rlHighlightAll;

  if (document.readyState === \"loading\") {
    document.addEventListener(\"DOMContentLoaded\", rlHighlightAll);
  } else {
    rlHighlightAll();
  }
})();"

CONST string DOCS_HEADER =
"<section class=\"page-header\">
\t<div class=\"container\">
\t\t<h1>Documentation</h1>
\t\t<p>A quick tour of the RL language: syntax, core concepts, and the standard library.</p>
\t</div>
</section>"

CONST string DOCS_CONTENT =
"<main class=\"main-layout\">
\t<div class=\"container\">
\t\t<div class=\"prose\">
\t\t\t<h2>Hello, RL</h2>
\t\t\t<p>RL programs run top to bottom. <code>println</code> writes a value followed by a newline, and comments start with <code>//</code> and are ignored by the interpreter.</p>
\t\t\t<pre class=\"rl-code\">
// prints a greeting
println(\"hello, rl\")
// prints 2
println(1 + 1)</pre>

\t\t\t<h2>Variables</h2>
\t\t\t<p>Values are declared with <code>dec</code>, and each one is given an explicit type such as <code>int</code>, <code>float</code>, <code>bool</code>, or <code>string</code>. Use <code>CONST</code> instead for values that never change.</p>
\t\t\t<pre class=\"rl-code\">
dec int score = 0
dec string name = \"ada\"
CONST int MAX_ATTEMPTS = 10</pre>

\t\t\t<h2>Functions</h2>
\t\t\t<p>Functions are declared with <code>fn</code>, take typed parameters, and can return a value using <code>-&gt;</code>.</p>
\t\t\t<pre class=\"rl-code\">
fn add(int a, int b) -&gt; int {
    return a + b
}</pre>

\t\t\t<h2>Control Flow</h2>
\t\t\t<p><code>if</code> / <code>else</code>, <code>while</code>, and <code>for</code> loops behave much like other C-family languages, and <code>match</code> adds pattern-based branching for more complex conditions.</p>
\t\t\t<pre class=\"rl-code\">
for n in [1, 2, 3] {
    if (n % 2 == 0) {
        println(\"even\")
    } else {
        println(\"odd\")
    }
}</pre>

\t\t\t<h2>Standard Library</h2>
\t\t\t<p>RL ships with built-in modules for common tasks &mdash; files and paths, strings, arrays, randomness, time, and more &mdash; brought into scope with <code>get</code>.</p>
\t\t\t<pre class=\"rl-code\">
get read_int, println from std::io
get rand_int_range from std::random</pre>

\t\t\t<p>For the complete reference, see the <a href=\"https://rl-lang.github.io/the-book\" class=\"nav-link\">language book</a> and the <a href=\"https://rl-lang.github.io/rl-lang\" class=\"nav-link\">Rust API docs</a>.</p>
\t\t</div>
\t</div>
</main>"

CONST string EXAMPLES_HEADER =
"<section class=\"page-header\">
\t<div class=\"container\">
\t\t<h1>Examples</h1>
\t\t<p>Complete programs written in RL, taken from the project's <code>examples/</code> directory.</p>
\t</div>
</section>"

CONST string GUESSING_GAME_CODE =
"
get rand_int_range from std::random
get read_int, print, println from std::io
get format, repeat from std::str
get arr_push, arr_min, arr_max, arr_filter, len from std::array
get is_null from std::types

fn print_divider() {
    \"-\".repeat(30).println()
}

fn check_guess(int guess, int secret) -&gt; string {
    if (guess &lt; secret) {
        return \"low\"
    }
    if (guess &gt; secret) {
        return \"high\"
    }
    return \"correct\"
}

fn find_first_correct(arr[int] guesses, int secret) -&gt; int {
    dec int i = 0
    for g in guesses {
        if (g == secret) {
            return i
        }
        i += 1
    }
    return null
}

CONST int MAX_ATTEMPTS = 10

dec int secret = rand_int_range(1, 100)?
dec int left = MAX_ATTEMPTS
dec arr[int] guesses = []
dec bool won = false

print_divider()
println(\"welcome to the guessing game!\")
println(\"i am thinking of a number between 1 and 100\")
print_divider()

while (left &gt; 0) {
    dec int guess = read_int(format(\"guess ({} left): \", left))?
    dec string res = check_guess(guess, secret)
    guesses = arr_push(guesses, guess)?
    left -= 1

    if (res == \"correct\") {
        won = true
        println(\"correct! you got it!\")
        break
    }
    println(format(\"too {}!\", res))
}

if (!won) {
    println(format(\"out of attempts! the number was {}\", secret))
}

dec arr[int] below = arr_filter(guesses, fn (int g) -&gt; bool {
    return g &lt; secret
})?
dec arr[int] above = arr_filter(guesses, fn (int g) -&gt; bool {
    return g &gt; secret
})?
dec int idx = find_first_correct(guesses, secret)

print_divider()
println(\"game summary\")
print_divider()
println(format(\"total guesses: {}\", len(guesses)))
println(format(\"lowest:        {}\", arr_min(guesses)?))
println(format(\"highest:       {}\", arr_max(guesses)?))
println(format(\"guesses below: {}\", len(below)))
println(format(\"guesses above: {}\", len(above)))

if (!is_null(idx)) {
    println(format(\"you got it on attempt {}\", idx + 1))
}"

CONST string TASK_MANAGER_SNIPPET =
"
fn parse_command(string input) -&gt; arr[string] {
    dec int space = index_of(input, \" \")
    if (space == -1) {
        return [trim(input), \"\"]
    }
    dec string cmd = slice(input, 0, space)?
    dec string args = trim(slice(input, space + 1, len(input))?)
    return [cmd, args]
}"

CONST string EXAMPLES_CONTENT =
"<main class=\"main-layout\">
\t<div class=\"container\">
\t\t<div class=\"prose\">
\t\t\t<h2>Guessing Game</h2>
\t\t\t<p>A complete number-guessing game: it reads guesses from the player, tracks every attempt, and prints a summary once the game ends.</p>
\t\t\t<pre class=\"rl-code\">$1</pre>

\t\t\t<h2>Task Manager (excerpt)</h2>
\t\t\t<p>A small command parser from a longer CSV-backed task manager, splitting a line of input into a command and its arguments.</p>
\t\t\t<pre class=\"rl-code\">$2</pre>

\t\t\t<p>Browse the full source for these and other programs (a CSV parser, HTTP and TCP servers) in the project's <code>examples/</code> folder.</p>
\t\t</div>
\t</div>
</main>"


fn build_page(string page_name, string title, string description, arr[string] tags) {
    dec formatted_body = ident(handle_body(BODY, tags))

    dec arr[string] head_values = HEAD_DEFAULT_VALUES
    head_values[0] = title
    head_values[1] = description
    head_values[3] = title
    head_values[13] = "js/rl-highlight.js"

    dec formatted_head = ident(handle_head(HEAD, head_values))

    dec string page_content = HTML.replace("$*1", "en").replace("$*2", "ltr").replace("$1", formatted_head).replace("$2", formatted_body)

    DIR.path_push(page_name)?.write_file(page_content)?
}

fn main() {
    if !DIR.path_exists()? {
        DIR.mkdir()?
    }

    // building the shared style file (used by every page)
    dec string style_location = HEAD_DEFAULT_VALUES[2]
    dec string style = STYLE_TEMPLATE
    style = handle_style(style, STYLE_DEFAULT_VALUES)
    if !DIR.path_push(style_location)?.path_parent()?.path_exists()? {
        DIR.path_push(style_location)?.path_parent()?.mkdir_all()?
    }
    DIR.path_push(style_location)?.write_file(style)?

    // copying the syntax highlighter script used by docs.html and examples.html
    if !DIR.path_push("js")?.path_exists()? {
        DIR.path_push("js")?.mkdir_all()?
    }
    DIR.path_push("js/rl-highlight.js")?.write_file(RL_HIGHLIGHT_JS)?

    // Home page
    dec arr[string] home_tags = []
    home_tags = home_tags.arr_push("<div class=\"site-wrapper\">")?
    home_tags = home_tags.arr_push(HEADER.to_string()?)?
    home_tags = home_tags.arr_push(HERO.to_string()?)?
    home_tags = home_tags.arr_push(MAIN_LAYOUT.to_string()?)?
    home_tags = home_tags.arr_push(FOOTER.to_string()?)?
    home_tags = home_tags.arr_push("</div>")?
    build_page(
        "index.html",
        "RL Programming Language",
        "RL is a small, expressive language for scripting build tools and generating static sites.",
        home_tags
    )?

    // Docs page
    dec arr[string] docs_tags = []
    docs_tags = docs_tags.arr_push("<div class=\"site-wrapper\">")?
    docs_tags = docs_tags.arr_push(HEADER.to_string()?)?
    docs_tags = docs_tags.arr_push(DOCS_HEADER.to_string()?)?
    docs_tags = docs_tags.arr_push(DOCS_CONTENT.to_string()?)?
    docs_tags = docs_tags.arr_push(FOOTER.to_string()?)?
    docs_tags = docs_tags.arr_push("</div>")?
    build_page(
        "docs.html",
        "Docs - RL Programming Language",
        "Syntax, core concepts, and the standard library for the RL programming language.",
        docs_tags
    )?

    // Examples page
    dec string examples_body = EXAMPLES_CONTENT.replace("$1", GUESSING_GAME_CODE).replace("$2", TASK_MANAGER_SNIPPET)
    dec arr[string] examples_tags = []
    examples_tags = examples_tags.arr_push("<div class=\"site-wrapper\">")?
    examples_tags = examples_tags.arr_push(HEADER.to_string()?)?
    examples_tags = examples_tags.arr_push(EXAMPLES_HEADER.to_string()?)?
    examples_tags = examples_tags.arr_push(examples_body)?
    examples_tags = examples_tags.arr_push(FOOTER.to_string()?)?
    examples_tags = examples_tags.arr_push("</div>")?
    build_page(
        "examples.html",
        "Examples - RL Programming Language",
        "Complete example programs written in the RL programming language.",
        examples_tags
    )?
}
