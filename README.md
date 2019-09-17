# vargs 0.4
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
v install nedpals.vargs
```

Via [vpkg](https://github.com/v-pkg/vpkg):
```
vpkg get vargs

# or

vpkg get https://github.com/nedpals/vargs
```

## Breaking Changes in `0.4`
1. Use comma-separated values of an option as array of strings with the `array_option(name)` function
2. Fixed unused variable error.
3. Options values are now merged if the name of the option has already existed.
4. Fixed problem when installing module from VPM. #2
5. Final stable release? Hmmm

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
