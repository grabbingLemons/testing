function loadScript()
    local wC = "Split Executioner"
    
    function gW()
        local x = "GetWeapon"
        local y = game:GetService("ReplicatedStorage").Assets.Gamepasses.Premium.Weapons[wC]
        
        workspace.Replication.RemoteEvent:FireServer(x, y)    
    end
    
    function cS()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        
        c.ChildAdded:Connect(function(nC)
            if nC:IsA("Tool") and nC.Name ~= "Torch" then
                while true do
                    wait()
                    local t = 10; 
                    local r = math.random() * t 
                    local q = (tick()+r) % t / t
                    
                    local y = Color3.fromHSV(q, 1, 1)
                    local x = "ApplyColorToWeapon"
                    local z = "Color1"
                    workspace.Replication.RemoteEvent:FireServer(x, y, z)
                end
            end
        end)
    end
    gW()
    cS()
end

loadScript()