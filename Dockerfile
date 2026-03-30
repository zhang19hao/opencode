# 换用官方Debian版bun镜像，从根源解决libc兼容问题
FROM oven/bun:1-debian

# 安装所需依赖（Debian使用apt包管理器）
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

# 全局安装opencode-ai
RUN bun install -g opencode-ai@latest

# 【关键修复】将bun全局二进制目录永久加入系统PATH
ENV PATH="/root/.bun/bin:$PATH"

# 可选：构建时验证安装，提前排查问题
RUN which opencode && opencode --version

WORKDIR /workspace

# 此时PATH已正确配置，exec格式可正常识别opencode命令
ENTRYPOINT ["opencode"]
