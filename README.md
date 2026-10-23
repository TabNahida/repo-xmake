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
Version `0.1.0` is available as a static library package. Use xmake 2.9.8 or newer
and a C++20 compiler:

```lua
add_repositories("tab-repo https://github.com/TabNahida/repo-xmake.git")
add_requires("pace 0.1.0")

target("app")
    set_kind("binary")
    set_languages("c++20")
    add_files("src/*.cpp")
    add_packages("pace")
```

HTTP/1.0, HTTP/1.1 and WebSocket are enabled by default. TLS, DNS, QUIC, HTTP/2
and HTTP/3 are optional:

```lua
add_requires("pace 0.1.0", {configs = {tls = true, dns = true, http2 = true}})
```

For only the runtime, TCP and UDP, disable the default application modules:

```lua
add_requires("pace 0.1.0", {configs = {http1 = false, websocket = false}})
```

The `quic` and `http3` options require a POSIX platform; enabling `http3` also
enables QUIC. HTTP/2 over HTTPS requires `tls = true`. The package propagates
the enabled protocol definitions and dependencies to consumers. Set
`profiling = true` only when collecting diagnostic stage timings.
