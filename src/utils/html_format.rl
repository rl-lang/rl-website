get split, format, is_empty, join from std::str
get arr_push from std::array

fn ident(string content) -> string {
    dec arr[string] lines = content.split("\n")
    dec arr[string] formatted_lines = []
    for line in lines {
        if line.is_empty() {
            formatted_lines = formatted_lines.arr_push(line)?
            continue
        }
        formatted_lines = formatted_lines.arr_push("\t{}".format(line))?
    }
    return formatted_lines.join("\n")?
}
