local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Roact = getrenv().require(CorePackages.Roact)

local Gui =
    Roact.createElement(
    "ScreenGui",
    {
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Global
    },
    {
        Gui = Roact.createElement(
            UIBlox.Core.Style.Provider,
            {
                style = stylePalette
            },
            {
                Toast = Roact.createElement(
                    UIBlox.App.Dialog.Toast,
                    {
                        toastContent = {
                            toastTitle = "toastTitle",
                            toastSubtitle = "toastSubtitle, and yes, it does scale downwards in case you were wondering.",
                            iconImage = Images["icons/status/warning"]
                            
                        }
                    }
                )
            }
        )
    }
)

Roact.mount(Gui, CoreGui, "InternalStuff")
wait(5)
Roact.unmount(Gui, CoreGui, "InternalStuff")