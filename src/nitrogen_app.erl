-module(nitrogen_app).
-behaviour(application).
-export([start/0,start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start()->
  application:start(nitrogen).

start(_StartType, _StartArgs) ->
    nitrogen_sup:start_link().

stop(_State) ->
    ok.
