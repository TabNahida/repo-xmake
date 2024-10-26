package("tcstring")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/TabNahida/TCString")
    set_description("TCString is a custom C string implementation designed for efficient memory management.")

    add_urls("https://github.com/TabNahida/TCString/archive/refs/tags/$(version).tar.gz",
             "https://github.com/TabNahida/TCString.git")
    add_versions("v0.1.0", "448d4ea429a24b9dfe6f79f6b3608326bcf9cdc65af37b3e9bfac0a8d3c83f98")

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
