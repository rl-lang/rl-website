get replace, contains, split, format, join, trim from std::str
get is_null from std::types
get len, arr_push from std::array

fn replace_this(string content, string target, string replacement) -> string {
    if content.is_empty() or replacement.is_empty() {
        return null
    }
    return replace(content, target, replacement)
}

fn handle_head(string head, arr[string] replacements) -> string {
    while replacements.len() < 14 {
        replacements = replacements.arr_push("")?
    }

    dec arr[string] lines = head.split("\n")
    dec arr[bool] originally_empty = []
    for line in lines {
        originally_empty = originally_empty.arr_push(line.trim().is_empty())?
    }

    dec int placeholder = 0

    for [int i = 0, i < lines.len(), i += 1] {
        dec string token = "$^{}".format(placeholder + 1)?

        if lines[i].contains(token) {
            dec string formatted = replace_this(lines[i], token, replacements[placeholder])
            if !formatted.is_null() {
                lines[i] = formatted
            } else {
                lines[i] = ""
            }
            placeholder += 1
        }
    }

    dec arr[string] cleaned_lines = []
    dec bool last_was_empty = false

    for [int i = 0, i < lines.len(), i += 1] {
        dec string line = lines[i]
        dec bool is_empty = line.trim().is_empty()

        if !is_empty {
            cleaned_lines = cleaned_lines.arr_push(line)?
            last_was_empty = false
        } else {
            dec bool next_is_closing = false
            for [int j = i + 1, j < lines.len(), j += 1] {
                if !lines[j].trim().is_empty() {
                    if lines[j].contains("</head>") {
                        next_is_closing = true
                    }
                    break
                }
            }

            if originally_empty[i] and !last_was_empty and !next_is_closing {
                cleaned_lines = cleaned_lines.arr_push("")?
                last_was_empty = true
            }
        }
    }

    return cleaned_lines.join("\n")?
}
