-module(qrcode_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link(?MODULE, []).

init([]) ->
    {ok, {{one_for_one, 1, 60},
        [
            {qrcode, {qrcode, start, []}, permanent, brutal_kill, worker, [qrcode]}
        ]
    }}.
