/**
 * vargs 0.3
 * https://github.com/nedpals/vargs
 * 
 * (c) 2019 Ned Palacios and its contributors.
 */

module vargs

struct Args {
pub mut:
    command string
    options map[string]string
    unknown []string
}

fn parse_option(v string) []string {
    delimitter := if v.starts_with('--') { '--' } else { '-' } 
    val := v.replace(delimitter, '')

    return val.split('=')
}

fn starts_with_hypen(v string) bool {
    return v.starts_with('-')
}

pub fn parse(a []string, start int) Args {
    args := a.slice(start, a.len)
    mut parsed := Args{'', map[string]string, []string}

    for i := 0; i < args.len; i++ {
        curr := args[i]
        next := if i+1 > args.len-1 { '' } else { args[i+1] }
        prev := if i-1 <= 0 { '' } else { args[i-1] }
        
        if i == 0 && !starts_with_hypen(curr) {
            parsed.command = curr
        }

        if starts_with_hypen(prev) {
            prev_opt := parse_option(prev)

            if prev_opt[0] in parsed.options {
                existing_opt_val := parsed.options[prev_opt[0]]
                parsed.options[prev_opt[0]] = '${existing_opt_val},${curr}'
            } else {
            parsed.options[prev_opt[0]] = curr
        }
        }

        if i != 0 && (!starts_with_hypen(prev) && !starts_with_hypen(curr)) {
            parsed.unknown << curr
        }

        if starts_with_hypen(curr) {
            opt := parse_option(curr)

            if opt.len == 2 {
                opt_val := opt[1]

                if opt[0] in parsed.options {
                    existing_opt_val := parsed.options[opt[0]]
                    parsed.options[opt[0]] = '${existing_opt_val},${curr}'
                } else {
                parsed.options[opt[0]] = opt[1]
            }
            }

            if opt.len == 1 && next.len == 0 {
                parsed.options[opt[0]] = ''
            }
        }
    }

    return parsed
}

pub fn (v Args) array_option(name string) []string {
    opt_values := v.options[name].split(',')

    return opt_values
}

pub fn (v Args) str() string {
    mut opts := v.options.str().split_into_lines()
    for i, el in opts { opts[i] = el.trim_space() }
    opts_str := opts.join('')

    return '\{ command: "${v.command}", options: ${opts_str}, unknown: ${v.unknown.str()} \}'
}
