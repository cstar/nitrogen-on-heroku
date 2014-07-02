%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> 

    #template { file="./templates/bare.html" }.

title() -> "Hello World !".

body() ->
    #panel{id=base, body = [ 
        #h1{text="Hello world !"}]}.
