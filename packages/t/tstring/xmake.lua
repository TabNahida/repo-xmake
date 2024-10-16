package("tstring")
    set_kind("library")
    set_homepage("https://github.com/TabNahida/TString")
    set_description("TString is a custom C++ string implementation designed for efficient memory management.")

    add_urls("https://github.com/TabNahida/TString/archive/refs/tags/$(version).tar.gz")
    add_versions("v0.1.4", "d98cd8e4ad186ffb9c53a0320edcda667406f1b88e5ce912467aca44b8b50da9")
    add_versions("v0.1.6", "e8ef1b6f426943d8b7c9c42e192b507cf2f14eff7ca4c825204b75970b1f4cf8")
    add_versions("v0.1.7", "db7e713da560aff0832d88b44f56c5a86187574287ecf693076da192912da46f")
    add_versions("v0.1.8", "1c5c5f9d2c7c0debc6ad0bf62d3108b5342c41e4a49c08498eba4807aca8a41a")
    add_versions("v0.1.10", "d3f2246c2ecbe5c3245bb5b986be3362f85fa2028db6b20fff7ec4ef09ebd5b0")

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
