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

CONST string DIR = "web"

fn main() {
    // building body
    dec arr[string] tags = []
    tags = tags.arr_push(make_tag("h1", "Welcome to RL-Programming language website", "", []))?
    dec formatted_body = ident(handle_body(BODY, tags))

    // main page name
    dec string main_page = "index.html"

    // building head
    dec arr[string] head_values = HEAD_DEFAULT_VALUES
    dec formatted_head = ident(handle_head(HEAD, head_values))

    // building page
    dec string main_page_content = HTML.replace("$1", formatted_head).replace("$2", formatted_body)

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
