ARG ELIXIR_VERSION=1.16.3
ARG OTP_VERSION=26

# Definindo as imagens base
ARG DEV_IMAGE="elixir:${ELIXIR_VERSION}-otp-${OTP_VERSION}-alpine"

FROM ${DEV_IMAGE} AS dev

ARG MIX_ENV
ARG VERSION_HASH
ARG APP_VERSION
ARG API_PORT
ARG EPMD_PORT
ARG DIST_ERL_PORT_RANGE

ARG BUILD_ENVIRONMENT=${MIX_ENV}

ENV APP_PATH=/app
ENV MIX_ENV=${MIX_ENV}
ENV VERSION_HASH=${VERSION_HASH}
ENV APP_VERSION=${APP_VERSION}
ENV API_PORT=${API_PORT}
ENV EPMD_PORT=${EPMD_PORT}
ENV DIST_ERL_PORT_RANGE=${DIST_ERL_PORT_RANGE}
ENV BUILD_ENVIRONMENT=${BUILD_ENVIRONMENT}

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix archive.install hex phx_new --force
RUN apk add --no-cache bash libstdc++ openssl ncurses-libs curl postgresql-client inotify-tools
RUN apk add neovim neovim-doc neovim-lang
RUN apk add zsh lua5.4 git unzip ripgrep fzf gcc g++ make

RUN git clone --depth=1 https://github.com/ricardopadua/dotfiles.git /tmp/dotfiles \
    && mkdir -p ~/.config/nvim \
    && cp -r /tmp/dotfiles/nvim/* ~/.config/nvim/ \
    && rm -rf /tmp/dotfiles

CMD ["iex"]
