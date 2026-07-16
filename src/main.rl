get println, write_file from std::io
get path_push, path_exists, path_is_dir from std::path
get mkdir from std::fs
get replace from std::str
get assets::constants
get utils::html_format
get utils::placeholder_replacer
get arr_reverse from std::array

CONST string DIR = "web"

fn main() {
    dec string main_page = "index.html"
    dec arr[string] head_values = HEAD_DEFAULT_VALUES.arr_reverse()?.arr_reverse()?
    dec string main_page_content = HTML.replace("$1", ident(handle_head(HEAD, ["", "2","", "", "", "", "","","", "", "11"]))).replace("$2", ident(BODY))
    if DIR.path_exists()? {
        DIR.path_push(main_page)?.write_file(main_page_content)?
    } else {
        DIR.mkdir()?
    }
}
