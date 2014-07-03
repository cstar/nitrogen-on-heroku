##Template project for deploying a Nitrogen app on Heroku

This is skeleton project, [cstar/nitrogen-on-heroku](https://github.com/cstar/nitrogen-on-heroku) with Cowboy as the webserver.

##How to use

1. Pull [cstar/nitrogen-on-heroku](https://github.com/cstar/nitrogen-on-heroku)
2. Write your awesome Nitrogen app
2. Create the Heroku app `heroku create --buildpack git://github.com/archaelus/heroku-buildpack-erlang.git`
3. Push your app to Heroku `git push heroku master`
4. [ET VOILA!](http://fathomless-citadel-5420.herokuapp.com)

## What is remarkable about [cstar/nitrogen-on-heroku](https://github.com/cstar/nitrogen-on-heroku)?

I generated the template from Nitrogen with `make rel_cowboy`, took the generated `site` directory and :

- Added [rebar.config](https://github.com/cstar/nitrogen-on-heroku/blob/master/rebar.config)
- Added [Procfile](https://github.com/cstar/nitrogen-on-heroku/blob/master/Procfile)
- Added [.preferred_otp_version](https://github.com/cstar/nitrogen-on-heroku/blob/master/.preferred_otp_version)
- Changed the supervisor to get HTTP port value from the [environment](https://github.com/cstar/nitrogen-on-heroku/blob/master/src/nitrogen_sup.erl#L33)