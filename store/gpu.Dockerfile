ARG ELIXIR_VERSION=1.17.3
ARG OTP_VERSION=27.1.2
ARG DEBIAN_VERSION=bookworm-20241111-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} as builder

# install build dependencies
RUN apt-get update -y && apt-get install -y build-essential git curl wget \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*


RUN echo "Nvidfia"
# Add the repository for the Nvidia CUDA
# Import the Nvidia repository GPG key
RUN apt update -q && apt install -y ca-certificates wget && \
    wget -qO /cuda-keyring.deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i /cuda-keyring.deb && apt update -q


# Install nvidia GPU support
RUN apt-get install -y cuda-nvcc-12-2 libcublas-12-2 libcudnn8


WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV="gpu"
ENV XLA_TARGET="cuda12"
ENV BUMBLEBEE_CACHE_DIR="/data/cache/bumblebee"
ENV XLA_CACHE_DIR="/data/cache/xla"

COPY mix.exs mix.lock ./
# RUN mix deps.get --only $MIX_ENV
RUN mix deps.get --all
RUN mkdir config

# RUN echo "deb http://security.ubuntu.com/ubuntu focal-security main universe" > /etc/apt/sources.list.d/ubuntu-focal-sources.list
# RUN apt update -yq

RUN apt-get update -y && apt-get install -yq tree libstdc++6 openssl libncurses5 build-essential apt-transport-https apt-utils nano locales postgresql-client imagemagick inotify-tools

# RUN apt-get install erlang-dev elixir erlang-runtime-tools -yq

# RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 && \
#     echo ". /root/.asdf/asdf.sh" >> /root/.bashrc
# RUN source /root/.bashrc
# RUN bash -c 'echo -e which asdf'
# RUN asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
# RUN asdf install rust 1.81.0
# RUN asdf global rust 1.81.0

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs \
    build-essential

COPY assets assets
RUN npm --prefix assets install -G

RUN echo "Rust"
SHELL ["/bin/bash", "-lc"]
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN /bin/bash -c "source ~/.cargo/env"

ENV MIX_ENV="gpu"
RUN echo "Config"
COPY config/config.exs config/badwords.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

COPY priv priv
COPY lib lib
COPY gpu.sh gpu.sh

RUN mix assets.deploy

COPY assets/convert test/convert
COPY assets/fonts priv/static/fonts
COPY assets/vendor priv/static/vendor
COPY assets/vendor/favicon.ico priv/static/favicon.ico

RUN echo "Compile the release"
RUN mix compile

COPY config/runtime.exs config/

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV DATABASE_URL="ecto://admin:unfairVoyage5Serene@pgvector/folkbot_prod"

CMD ["/app/gpu.sh"]