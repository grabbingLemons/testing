local cGui = game:GetService("CoreGui")
local cPackages = game:GetService("CorePackages")
local UIBlox= getrenv().require(cPackages.UIBlox)


UIBlox.init()
    local sPalette  = getrenv().require(cPackages.AppTempCommon.LuaApp.Style.StylePalette)
    local palette = new sPalette()
    palette:updateTheme("dark")
    palette:updateFont("gotham")

    local roact = getrenv().require(cPackages.Roact)
    local imgs = getrenv().require(cPackages.Packages._Index.UIBlox.UIBlox.App.ImageSet.Images)

    local main = roact.createElement("ScreenGui", {
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Global
    },{
        main = roact.createElement(UIBlox.Core.Style.Provider, {
            style = palette
        },{
            Toast = roact.createElement(UIBlox.App.Dialog.Toast, {
                toastContent{
                    toastTitle = "toastTitle",
                    toastSubtitle = "toastSubtitle",
                    iconImage = imgs['icons/status/warning']
                }
            })
        })
    })

roact.mount(main, cGui, "InternalStuff")