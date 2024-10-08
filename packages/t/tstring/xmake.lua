package("tstring")
    set_kind("library")
    set_homepage("https://github.com/yourusername/TString")
    set_description("TString is a custom C++ string implementation designed for efficient memory management.")

    add_urls("https://github.com/yourusername/TString/archive/refs/tags/$(version).tar.gz")
    add_versions("v1.0-Alpha", "44e79eb0787b19e433ef928d5d228bf299e05d20b6dbe38696694b33b5b5511c")

    add_includedirs("include", {public = true})

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:has_cxxtypes("TString", {includes = "TString.hpp"}))
        assert(package:check_cxxsnippets({
            test = [[
                #include <TString.hpp>
                void test() {
                    TString str("Hello");
                    str.append(", World!");
                }
            ]]
        }, {configs = {languages = "cxx20"}}))
    end)
package_end()
