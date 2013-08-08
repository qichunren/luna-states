-module(states_manager).
-export([start/0]).

start() ->
        spawn(fun() -> server(8080) end).

server(Port) ->
        {ok, Socket} = gen_udp:open(Port, [binary, {active, false}]),
        io:format("server opened socket:~p~n",[Socket]),
        loop(Socket, []).

loop(Socket, OnlineHosts) ->
        displayOnlineHosts(OnlineHosts),
        inet:setopts(Socket, [{active, once}]),
        receive
                {udp, Socket, Host, Port, Bin} ->
                        io:format("server ~p received:~p from ~w~n",[Port, Bin, Host]),
                        %gen_udp:send(Socket, Host, Port, Bin),
                        loop(Socket, insertHosts(Host, OnlineHosts))
        end.

insertHosts(Host, OnlineHosts) ->
        case lists:member(Host, OnlineHosts) of
                true -> OnlineHosts;
                false -> lists:append([Host], OnlineHosts)
        end.

displayOnlineHosts(Hosts) ->
        io:format("There are online hosts ~p~n",[Hosts]).