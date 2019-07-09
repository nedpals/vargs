/**
 * V-Args 0.1.2
 * https://github.com/nedpals/v-args
 * 
 * (c) 2019 Ned Palacios and its contributors.
 */

import args

fn parse_test() {
    test_arr := ['hello', '-f', 'bar', '--foo', 'baz', '--lol=yey', '-t=test', '123', '-n']

    assert args.parse(test_arr, 0) == Args{
        command: 'hello', 
        options: {
            'f': 'bar',
            'foo': 'baz',
            'lol': 'yey',
            't': 'test',
            'n': ''
        },
        unknown: ['123']
    }
}