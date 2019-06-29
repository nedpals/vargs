# v-args 0.1
V library for parsing arguments from argv-like arrays (like `os.args`). Ported from [this file](https://github.com/nedpals/kuman/blob/master/src/parser.ts) which was originally written on Typescript.

```go
// dummy.v
import args
import os

fn main() {
    args := parse_args(os.args)

    println(args.str())
    println(args.command)
    println(args.unknown[0])
    println('with? ${args[0].value}')
}
```

```bash
./dummy cook chicken --with love
# { command: cook, options: ["{ name: with, value: love }"], unknown: ['chicken'] }
# cook
# chicken
# with? love
```

## Installation
Clone the repo and see [https://vlang.io/docs#modules](https://vlang.io/docs#modules) for instructions.

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
