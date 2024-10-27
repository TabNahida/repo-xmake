package("tcstring")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/TabNahida/TCString")
    set_description("TCString is a custom C string implementation designed for efficient memory management.")

    add_urls("https://github.com/TabNahida/TCString/archive/refs/tags/$(version).tar.gz",
             "https://github.com/TabNahida/TCString.git")
    add_versions("v0.1.0", "448d4ea429a24b9dfe6f79f6b3608326bcf9cdc65af37b3e9bfac0a8d3c83f98")
    add_versions("v0.1.1", "4448485f5a91db8b3846b1d3d119fa7ce543f0238919074bd924ca3b74c5a95b")
    add_versions("v0.1.2", "485200123ef5c32161807eca91959f8d60b20668a72eee1350d5385266a5fb4b")
    add_versions("v0.1.3", "a8e308bc7ae947ac3f861f7847638e961361224ee6ee01cb30121e94d8bd38ac")
    add_versions("v0.1.4", "0e5ed7d5611df71802b35421adf76f9d3cb53bbf83319d94bbedee1307931137")

    add_includedirs("include", {public = true})

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:has_ctypes("TCString", {includes = "TCString.h"}))
        assert(package:check_csnippets({
            test = [[
                #include <TCString.h>
                void test() {
                    TCString(str, "Hello");
                    appendTCString(str, ", World!");
                }
            ]]
        }, {configs = {languages = "c17"}}))
    end)
