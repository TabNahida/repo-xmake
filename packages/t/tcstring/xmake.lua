package("tcstring")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/TabNahida/TCString")
    set_description("TCString is a custom C string implementation designed for efficient memory management.")

    add_urls("https://github.com/TabNahida/TCString/archive/refs/tags/$(version).tar.gz",
             "https://github.com/TabNahida/TCString.git")
    add_versions("v0.1.0", "14d81d1bacbedf65423d84082fae7af6fc009d801a1c1e63ed5530d249de2015")

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
                    TString str("Hello");
                    str.append(", World!");
                }
            ]]
        }, {configs = {languages = "c17"}}))
    end)
