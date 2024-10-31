package("tstring")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/TabNahida/TString")
    set_description("TString is a custom C++ string implementation designed for efficient memory management.")

    add_urls("https://github.com/TabNahida/TString/archive/refs/tags/$(version).tar.gz",
             "https://github.com/TabNahida/TString.git")
    add_versions("v0.1.4", "d98cd8e4ad186ffb9c53a0320edcda667406f1b88e5ce912467aca44b8b50da9")
    add_versions("v0.1.6", "e8ef1b6f426943d8b7c9c42e192b507cf2f14eff7ca4c825204b75970b1f4cf8")
    add_versions("v0.1.7", "db7e713da560aff0832d88b44f56c5a86187574287ecf693076da192912da46f")
    add_versions("v0.1.8", "1c5c5f9d2c7c0debc6ad0bf62d3108b5342c41e4a49c08498eba4807aca8a41a")
    add_versions("v0.1.11", "97d079b18b0e80ebd7c04131b516f74a5ab086a0c211d3fea462d7dbb9fe5dcf")
    add_versions("v0.1.13", "01150958d6b60e9ea501b6aa20b960ea092e2ae54aae4b8d6bf9c4db0e1e5b9b")
    add_versions("v0.1.14", "2d45726148c2ea209cd1996358d73d3161eb267d7d938155d5b38193067a7d24")
    add_versions("v0.1.15", "d265293550e485d7240f5c5f5b87164838e1c72829a985a905afd5d6fac7b836")
    add_versions("v0.1.16", "dbd508690822cde7161fee83bc05abbf9281f96e3501e1cab515022139e043b2")
    add_versions("v0.1.17", "2eef4a33be3ba37525de7379f18b5b8fa3f409184a1176e7ef7321002e7e52af")
    add_versions("v0.1.18", "27853503731d807f2bf53cc458c3f0c02d1a5a1f2492148a5fc33ab07a5d43d4")
    add_versions("v0.1.19", "5a919b9ec83929e5691bcf708600a7d0959b4362d50aa8291f1debeea737996c")
    add_versions("v0.1.20", "5b69cd174d69404163c06c7a5b0f35a09e487f11d52fd7df2b7923ad5cee51c1")

    add_includedirs("include", {public = true})

    add_configs("tcstring", {default = true, description = "Enable TCString Support"})
    add_configs("stl", {default = true, description = "Enable STL Functions Support"})

    on_load(function (package)
        if package:config("tcstring") then
            package:add("defines", "TCSTRING_SUPPORT")
            package:add("deps", "tcstring >0.1.3")
        end
        if package:config("stl") then
            package:add("defines", "STL_SUPPORT")
        end
    end)

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
        }, {configs = {languages = "c++20"}}))
    end)
