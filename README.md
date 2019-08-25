# vargs 0.3
A simple argument parsing library for [V](https://vlang.io). Ported from [this file](https://github.com/nedpals/kuman/blob/master/src/parser.ts) which was originally written on Typescript.

> The version of this module will remain in `0.x.x` unless the language API's are finalized and implemented.

```go
// dummy.v
import vargs
import os

fn main() {
    // Second argument removes the first argument which contains the path of the executable.
    _args := vargs.parse(os.args, 1)

    println(_args.str())
    println(_args.command)
    println(_args.unknown[0])
    println('with? ' + _args.options['with'])
}
```

```bash
./dummy cook chicken --with love
# { command: "cook", options: {"with" => "love"}, unknown: ["chicken"] }
# cook
# chicken
# with? love
```

## Installation
Via vpm:
```
v install nedpals.args
```

Via [vpkg](https://github.com/v-pkg/vpkg):
```
vpkg get vargs

# or

vpkg get https://github.com/nedpals/vargs
```

## Breaking Changes in `0.3`
1. Module name renamed from `args` to `vargs` to avoid conflicts.
2. `0.3` now requires V `0.1.18` and above because of the revised initialization of maps.
3. Renaming of internal functions and better formatting when converting `Args` struct to string.
4. Final stable release? Hmmm

## Contributing
1. Fork it (<https://github.com/nedpals/vargs/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
[MIT](LICENSE)

## Contributors

- [Ned Palacios](https://github.com/nedpals) - creator and maintainer
