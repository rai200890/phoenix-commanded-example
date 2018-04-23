FROM elixir:1.6.4
RUN mkdir app
WORKDIR app
ADD . .
RUN apt-get update && apt-get install -y postgresql-client
RUN mix do \
    local.hex --force, \
    local.rebar --force, \
    deps.unlock --all, \
    deps.get, \
    deps.clean --unused \
