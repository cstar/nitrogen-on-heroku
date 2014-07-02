all: get-deps compile copy-static

get-deps:
	./rebar get-deps

update-deps:
	./rebar update-deps

compile:
	./rebar compile

copy-static:
	(cd static; rm -rf nitrogen; mkdir nitrogen; cp -r ../deps/nitrogen_core/www/* nitrogen)
	(cd static; rm -rf doc; mkdir doc; cp -r ../deps/nitrogen_core/doc/html/* doc)

clean:
	./rebar clean

upgrade: update-deps compile copy-static

DEPS_PLT=$(CURDIR)/.deps_plt
DEPS=erts kernel stdlib sasl

$(DEPS_PLT):
	@echo Building local plt at $(DEPS_PLT)
	@echo 
	@(dialyzer --output_plt $(DEPS_PLT) --build_plt --apps $(DEPS) -r ./deps/)

dialyzer: get-deps compile $(DEPS_PLT)
	@(dialyzer --fullpath --plt $(DEPS_PLT) -Wrace_conditions -r ./ebin)

travis: dialyzer

run:
	erl -pa ebin ./deps/*/ebin ./deps/*/include \
	-config "app.config" \
	-name nitrogen@127.0.0.1 \
	-env ERL_FULLSWEEP_AFTER 0 \
	-eval "application:start(nitrogen), sync:go()."