# v-args 0.2
V library for parsing arguments from argv-like arrays (like `os.args`). Ported from [this file](https://github.com/nedpals/kuman/blob/master/src/parser.ts) which was originally written on Typescript.

```go
// dummy.v
import args
import os

fn main() {
    // Second argument removes the first argument which contains the path of the executable.
    _args := args.parse(os.args, 1)

    println(_args.str())
    println(_args.command)
    println(_args.unknown[0])
    println('with? ${_args.options['with']}')
}
```

```bash
./dummy cook chicken --with love
# { command: cook, options: { "with" => "love" }, unknown: ["chicken"] }
# cook
# chicken
# with? love
```

## Installation
1. Clone the repo. (`git clone https://github.com/nedpals/v-args args`)
2. Copy the folder inside the `vlib` folder.*

**\*Note: The `vlib` folder is located where your V compiler is also located.**

## Changes in `0.2`
1. `Flag` structs and it's related functions (such as `get_flag()` and `get()`) are removed. Replaced with `maps`.
2. The `parse` function now accepts a second argument that removes the first `n` elements in the array. Helpful if you want to only parse arguments after the name of the app/executable. Otherwise, set it to 0.
3. Major refactoring and fixing of the library.

## Notes
1. The version of this module will remain in `0.x.x` unless the language API's are finalized and implemented.
2. ~~Options will turn into `maps` in the future once `maps` will be fully implemented in V.~~
3. ~~`args.options.get_flag()` returns the full Flag struct while `args.options.get()` returns the value of the specified option.~~

## Contributing
1. Fork it (<https://github.com/nedpals/v-args/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
[MIT](LICENSE)

## Contributors

- [Ned Palacios](https://github.com/nedpals) - creator and maintainer
