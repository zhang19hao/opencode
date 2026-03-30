FROM oven/bun:1-alpine

RUN apk add --no-cache git ripgrep
RUN bun install -g opencode-ai@latest

WORKDIR /workspace
ENTRYPOINT ["opencode"]
