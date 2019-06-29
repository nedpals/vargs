/**
 * V-Args 0.1.2
 * https://github.com/nedpals/v-args
 * 
 * (c) 2019 Ned Palacios and its contributors.
 */

module args

struct Flag {
    name string
    value string
}

struct Args {
pub mut:
    command string
    options []Flag
    unknown []string
}

fn parse_hypen_args(v string) []string {
    mut delimitter := '-'

    if v.starts_with('--') {
        delimitter = '--'
    } else {
        delimitter = '-'
    }

    val := v.replace(delimitter, '')

    return val.split('=')
}

fn detect_hypen_args(v string) bool {
    return v.starts_with('-')
}

pub fn parse(a []string) Args {
    args := a.slice(1, a.len)

    mut parsed := Args{'', []Flag, []string}

    for i := 0; i < args.len; i++ {

        prev := if i-1 <= 0 { '' } else { args[i-1] }
        current := args[i]
        noHypens := !detect_hypen_args(prev) && !detect_hypen_args(current)
        
        if !detect_hypen_args(current) {
            if i == 0 {
                parsed.command = current
            }

            if i != 0 && detect_hypen_args(prev) {
                prevArg := parse_hypen_args(string(prev))
                option := Flag{prevArg[0], current}

                parsed.options << option
            }
        }

        if i != 0 && noHypens {
            parsed.unknown << current
        }

        if detect_hypen_args(current) {
            arg := parse_hypen_args(string(current))
            mut val := ''

            if (arg.len == 2) {
                val = arg[1]
                parsed.options << Flag{arg[0], val}
            }
        }
    }

    return parsed
}

pub fn (v Flag) str() string {
    return '\{ name: ${v.name}, value: ${v.value} \}'
}


pub fn (a []Flag) str() string {
    mut arr := []string

    for i := 0; i < a.len; i++ {
        arr << a[i].str()
    }

    return arr.str()
}

pub fn (a []Flag) get(name string) ?string {
    for option in a {
        if option.name == name {
            return option.value
        }
    }

    return error('Option ${name} not found.')
}

pub fn (a []Flag) get_flag(name string) ?Flag {
    for option in a {
        if option.name == name {
            return option
        }
    }

    return error('Option ${name} not found.')
}

pub fn (v Args) str() string {
    return '\{ command: ${v.command}, options: ${v.options.str()}, unknown: ${v.unknown.str()} \}'
}