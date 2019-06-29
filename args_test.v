fn parse_test() {
    test_arr := ['hello', '-f', 'bar', '--foo', 'baz', '--lol=yey', '-t=test', '123']

    assert parse_args(test_arr) == Args{
        command: 'hello', 
        options: [
            Flag{name: 'f', value: 'bar'},
            Flag{name: 'foo', value: 'baz'},
            Flag{name: 'lol', value: 'yey'},
            Flag{name: 't', value: 'test'}
        ],
        unknown: ['123']
    }
}