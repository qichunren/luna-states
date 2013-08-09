# Luna States manager

## Knownedge

[erlang](http://www.erlang.org/)
[rebar](https://github.com/basho/rebar/wiki)


## Get started

```
./rebar compile
erl -pa ./ebin
lunastates_app:start(a,b).
lunastates_app:stop(a).

```


## Log
```
➜  luna-states git:(master) ✗ erl -pa ./ebin
Erlang R15B03 (erts-5.9.3.1) [source] [64-bit] [smp:8:8] [async-threads:0] [hipe] [kernel-poll:false] [dtrace]

Eshell V5.9.3.1  (abort with ^G)
1> lunastates_app:start(a,b).
server opened socket:#Port<0.726>
There are online hosts []
** exception exit: shutdown
2> q().
ok
3> %
```