FROM alpine:3.23.3

RUN apk add --no-cache curl git zip bash
RUN curl -fsSL https://mise.run | sh
ENV PATH="/root/.local/bin:/root/.local/share/mise/shims:${PATH}"

WORKDIR /mise
COPY mise.toml ./
RUN mise trust && mise install
