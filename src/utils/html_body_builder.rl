get replace, is_empty, format from std::str
get is_null from std::types
get arr_is_empty, len from std::array

CONST string TAG = "<$*&1$*&3>$*&2</$*&1>"

fn make_tag(string tag_type, string content, string id, arr[string] class) -> string {
    dec constructed_tag = TAG

    if content.is_empty() or tag_type.is_empty() {
        return null
    }
    if id.is_empty() and class.arr_is_empty()? {
        constructed_tag = constructed_tag.replace("$*&3", "")?
    } else if !id.is_empty() and class.arr_is_empty()?  {
        constructed_tag = constructed_tag.replace("$*&3", " id=\"{}\"".format(id))?
    } else if id.is_empty() and !class.arr_is_empty()? {
        dec length = class.len()
        dec i = 1
        dec classes = ""
        for item in class {
            if i < length {
                classes = "{}{} ".format(classes, item)
            } else {
                classes = "{}{}".format(classes, item)
            }
        }
        constructed_tag = constructed_tag.replace("$*&3", " class=\"{}\"".format(classes))?
    } else {
        dec temp = " id=\"{}\"".format(id)
        dec length = class.len()
        dec i = 1
        dec classes = ""
        for item in class {
            if i < length {
                classes = "{}{} ".format(classes, item)
            } else {
                classes = "{}{}".format(classes, item)
            }
            i += 1
        }
        temp = "{} class=\"{}\"".format(temp, classes)
        constructed_tag = constructed_tag.replace("$*&3", temp)?
    }

    constructed_tag = constructed_tag.replace("$*&1", tag_type)?
    constructed_tag = constructed_tag.replace("$*&2", content)?

    return constructed_tag
}
