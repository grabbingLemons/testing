if not game:IsLoaded() then
    game.Loaded:Wait()
end
local LP = game:GetService("Players").LocalPlayer
while wait(.1) do
    local ui = LP.PlayerGui:FindFirstChild("NotificationsUI")
    if ui then
        ui.Enabled = false
    end
    local ui2 = LP.PlayerGui:FindFirstChild("StarterTip")
    if ui2 then
        ui2.Enabled = false
    end
    local ui3 = LP.PlayerGui:FindFirstChild("Tutorial")
    if ui3 then
        ui3:Destroy()
    end
    local ui4 = game:GetService("Lighting"):FindFirstChild("Blur")
    if ui4 then
        ui4:Destroy()
    end
    local ui5 = LP.PlayerGui:FindFirstChild("PopUp")
    if ui5 then
        if ui5.Enabled then
            LP.PlayerGui.Loader.MainScreen.RaceChooser.Visible = true
            ui5.Enabled = false
        end
    end
end
