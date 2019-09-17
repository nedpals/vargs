/**
 * vargs 0.4
 * https://github.com/nedpals/vargs
 * 
 * (c) 2019 Ned Palacios and its contributors.
 */
import vargs

fn parse_test() {
    test_arr := ['hello', '-f', 'bar', '--foo', 'baz', '--lol=yey', '-t=test', '123', '-n', '--foo', 'bal']

    assert vargs.parse(test_arr, 0) == Args{
        command: 'hello', 
        options: {
            'f': 'bar',
            'foo': 'baz,bal',
            'lol': 'yey',
            't': 'test',
            'n': ''
        },
        unknown: ['123']
    }
}