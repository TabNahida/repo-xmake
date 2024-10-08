package("tstring")
    set_kind("library")
    set_homepage("https://github.com/yourusername/TString")
    set_description("TString is a custom C++ string implementation designed for efficient memory management.")

    add_urls("https://github.com/yourusername/TString/archive/refs/tags/$(version).tar.gz")
    add_versions("v1.0-Delta", "c55552e7c8347cc179f54788a7a52f15554af8caeb925647a6e8dda7993939b0")
    add_versions("v1.0-Zeta", "9eb3e77770ea308a953aa3979a700a73626abbde79a774d4ed376e2e2134320a")

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
