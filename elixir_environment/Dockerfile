ARG ELIXIR_VERSION=1.16.3
ARG OTP_VERSION=26
ARG DEV_IMAGE="elixir:${ELIXIR_VERSION}-otp-${OTP_VERSION}-alpine"

FROM ${DEV_IMAGE} AS dev

ARG MIX_ENV
ARG NODE_NAME
ARG ERLANG_COOKIE
ARG APP_VERSION
ARG API_PORT
ARG EPMD_PORT
ARG DIST_ERL_PORT_RANGE
ARG BUILD_ENVIRONMENT=${MIX_ENV}

ENV APP_PATH=/app
ENV NODE_NAME=${NODE_NAME}
ENV ERLANG_COOKIE=${ERLANG_COOKIE}
ENV MIX_ENV=${MIX_ENV}
ENV APP_VERSION=${APP_VERSION}
ENV API_PORT=${API_PORT}
ENV EPMD_PORT=${EPMD_PORT}
ENV DIST_ERL_PORT_RANGE=${DIST_ERL_PORT_RANGE}
ENV BUILD_ENVIRONMENT=${BUILD_ENVIRONMENT}

RUN echo $ERLANG_COOKIE

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix archive.install hex phx_new --force
RUN apk add --no-cache \
    bash curl git gcc g++ perl make \
    autoconf automake ncurses ncurses-dev \
    ncurses-libs openssl-dev \
    unixodbc-dev readline-dev coreutils \
    gnupg tar xz openssl inotify-tools \
    libstdc++ postgresql-client \
    neovim neovim-doc neovim-lang \
    zsh lua5.4 unzip ripgrep fzf

RUN git clone --depth=1 https://github.com/ricardopadua/dotfiles.git /tmp/dotfiles \
    && mkdir -p ~/.config/nvim \
    && cp -r /tmp/dotfiles/nvim/* ~/.config/nvim/ \
    && chmod +x /tmp/dotfiles/zsh/install.sh \
    && /tmp/dotfiles/zsh/install.sh \
    && chmod +x /tmp/dotfiles/asdf/install.sh \
    && /tmp/dotfiles/asdf/install.sh \
    && rm -rf /tmp/dotfiles

RUN mkdir -p /opt/data
RUN ln -s /opt/data /data    

RUN curl -fsSL https://raw.githubusercontent.com/ricardopadua/dotfiles/main/elixir_environment/.tool-versions -o /opt/data/.tool-versions 
RUN curl -fsSL https://raw.githubusercontent.com/ricardopadua/dotfiles/main/zsh/.zshrc.bkp -o /root/.zshrc \
    && sed -i 's/plugins=(.*/plugins=(git zsh-syntax-highlighting fzf zsh-autosuggestions zsh-completions)/' /root/.zshrc \
    && echo "export EDITOR='nvim'" >> /root/.zshrc \
    && echo "source ~/.p10k.zsh" >> /root/.zshrc

RUN curl -fsSL https://raw.githubusercontent.com/ricardopadua/dotfiles/main/zsh/.p10k.zsh.bkp -o /root/.p10k.zsh

EXPOSE ${API_PORT}
EXPOSE ${EPMD_PORT}
EXPOSE ${DIST_ERL_PORT_RANGE}

CMD sh -c "iex --sname ${NODE_NAME}@${HOSTNAME} --cookie $ERLANG_COOKIE"

