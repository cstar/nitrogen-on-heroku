-module(nitrogen_app).
-behaviour(application).
-export([start/2, stop/1]).
-export([start/0]).
%% ===================================================================
%% Application callbacks
%% ===================================================================


start()->
  application:ensure_all_started(nitrogen).

start(_StartType, _StartArgs) ->
  case os:getenv("PORT") of
    false ->
      ok;
    P ->
        {Pi, _} = string:to_integer(P),
        application:set_env(simple_bridge, port, Pi)
  end,
    nitrogen_sup:start_link().

stop(_State) ->
    ok.
