# Repo Xmake
My own xmake repo

## Use this repo

Run this command on your shell
```sh
xmake repo --add tab-repo https://github.com/TabNahida/repo-xmake.git
```
or Add this line to your xmake.lua
```lua
add_repositories("tab-repo https://github.com/TabNahida/repo-xmake.git")
```

## PACE

[PACE](https://github.com/TabNahida/PACE) is a C++20 coroutine networking library.
Versions `0.1.0`, `0.1.1`, `0.3.0`, `0.3.1`, `0.4.0`, `0.5.0`, `0.6.0` and `0.6.1` are available as static library packages.
Use xmake 2.9.8 or newer and a C++20 compiler:

```lua
add_repositories("tab-repo https://github.com/TabNahida/repo-xmake.git")
add_requires("pace 0.6.1")

target("app")
    set_kind("binary")
    set_languages("c++20")
    add_files("src/*.cpp")
    add_packages("pace")
```

HTTP/1.0, HTTP/1.1 and WebSocket are enabled by default. TLS, DNS, QUIC, HTTP/2
and HTTP/3 are optional:

```lua
add_requires("pace 0.6.1", {configs = {tls = true, dns = true, http2 = true}})
```

For only the runtime, TCP and UDP, disable the default application modules:

```lua
add_requires("pace 0.6.1", {configs = {http1 = false, websocket = false}})
```

The `quic` and `http3` options require a POSIX platform; enabling `http3` also
enables QUIC. HTTP/2 over HTTPS requires `tls = true`. The package propagates
the enabled protocol definitions and dependencies to consumers. Set
`profiling = true` only when collecting diagnostic stage timings.

PACE 0.6.0 selects ngtcp2 for QUIC/HTTP3. Use `quic_backend = "openssl"` for the native OpenSSL transport, or `modules = true` with a module-capable compiler to enable `import pace;`. For a consumer with only ordinary .cpp files, add `set_policy("build.c++.modules", true)` to the target so xmake scans imports.

PACE 0.5.0 adds static mounts, reverse proxies, bounded response caches and an
optional Linux io_uring readiness backend (`uring = true`). Direct HTTP/TCP/UDP clients, structured task
groups, local cancellation and shared deadlines remain available. HTTP coroutine functions use the `async_` prefix.
[Start with the guided tutorial](https://github.com/TabNahida/PACE/blob/v0.6.1/docs/tutorial/00-quick-start.md).
Hostname URLs require `dns = true`; HTTPS URLs require `tls = true`.
Windows ARM64 core/HTTP/WebSocket are supported, but the package rejects TLS on
that target because the public OpenSSL package lacks the correction used by the
[PACE source build](https://github.com/TabNahida/PACE/blob/v0.6.1/docs/diagnostics/windows-arm64-openssl.md).
