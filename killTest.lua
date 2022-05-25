while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui do wait() end 
local s,e = pcall(function() 
    local lps = game:GetService("Players") 
    local lpc = lps.LocalPlayer

    if not firetouchinterest then 
        rconsolewarn("Unable to use firetouchinterest") 
        return
    end
    
    local target = game:GetService("Players")[""]

    if not target then
        rconsolewarn("Player does not exist!") 
        return
    end
    lpc.Character.Humanoid.Name = 1
    local l = lpc.Character["1"]:Clone() 
    l.Parent = lpc.Character
    l.Name = "Humanoid"
    wait(.2)
    lpc.Character["1"]:Destroy()
    workspace.CurrentCamera.CameraSubject = lpc.Character
    lpc.Character.Humanoid.DisplayDistanceType = "None" 
    lpc.Character.Humanoid:UnequipTools()
    local v = lpc.Backpack:FindFirstChildOfClass("Tool")
    if not v then
        rconsolewarn("Tool not found!") 
        return
    end
 v.Parent = lpc.Character
    v.Parent = lpc.Character.HumanoidRootPart
    firetouchinterest(target.Character.HumanoidRootPart, v.Handle, 0) 
    firetouchinterest(target.Character.HumanoidRootPart, v.Handle, 1) 
    pcall(function() lpc.Character.HumanoidRootPart.CFrame = CFrame.new(0, workspace.FallenPartsDestroyHeight + 2, 0) end) 
    wait(.3)
    v:Destroy() 
    lpc.Character:Remove()
    lpc.CharacterAdded:Wait()

end)


rconsoleprint(s and "@@LIGHT_GRAY@@" or "@@WHITE@@")
rconsoleprint(s and "\nScript Ran!\n" or "\nSCRIPT ERRORRED\n"..e) 
if not s then _G.comm({["action"] = "errorreport",["error"] = e},"GET") end