# vargs 0.5
A simple argument parsing library for [V](https://vlang.io). Ported from [this file](https://github.com/nedpals/kuman/blob/master/src/parser.ts) which was originally written on Typescript.

> The version of this module will remain in `0.x.x` unless the language API's are finalized and implemented.

```v
// dummy.v
import vargs // or import nedpals.vargs for vpm users
import os

fn main() {
    // Second argument removes the first argument which contains the path of the executable.
    mut _args := vargs.new(os.args, 1)
    
    // Use the `alias` method if you want to map an option to an existing option.
    _args.alias('W', 'with')

    // Parsing is now a separate step
    _args.parse()

    println(_args.str())
    println(_args.command)
    println(_args.unknown[0])
    println('with? ' + _args.options['with'])
}
```

```bash
./dummy cook chicken --with love -W soul
# { command: "cook", options: {"with" => "love"}, unknown: ["chicken"] }
# cook
# chicken
# with? love,soul
```

## Installation
Via vpm:
```
v install nedpals.vargs
```

Via [vpkg](https://github.com/vpkg-project/vpkg):
```
vpkg get vargs

# or

vpkg get https://github.com/nedpals/vargs
```

## Changes in `0.5`
1. Breaking change on the usage of the library.
2. `alias(orig, dest)` for mapping options to existing ones.
3. Array and the `start` index are now moved into the `Args` struct as internal fields.
4. Default values are now moved inside the declaration of the `Args` struct.

## Changes in `0.4`
1. Use comma-separated values of an option as array of strings with the `array_option(name)` function
2. Fixed unused variable error.
3. Options values are now merged if the name of the option has already existed.
4. Fixed problem when installing module from VPM. #2
5. Final stable release? Hmmm

### `0.4.1`
1. Merge duplicate codes into a function.
2. Fixed another unused variable error.

### `0.4.2`
1. Fixed parsing errors when used in complex scenarios.
2. Add proper tests.
3. Now only works with `0.1.22` and above.
4. Fixed maps formatting when converting `Args` to string.
5. Partial refactoring of code including converting `if` statements to `match`

### `0.4.3`
1. Fix breaking changes when compiling on V `0.1.23`

## Contributing
1. Fork it (<https://github.com/nedpals/vargs/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Testing
To test the module, just type the following command:
```
v test vargs_test.v
```

## License
[MIT](LICENSE)

## Contributors

- [Ned Palacios](https://github.com/nedpals) - creator and maintainer
