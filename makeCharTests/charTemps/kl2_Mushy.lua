local s,e = pcall(function()
    function MakeChar()
        function removeMorphs()
            local player = game.Players.LocalPlayer.Name
            local morphRemove = "RemoveMorphs"
            local hairRemove = {
                [1] = game:GetService("Workspace")[player].Hair2
            }
            local topRemove = {
                [1] = game:GetService("Workspace")[player].Top1 
            }
            local bottomRemove = {
                [1] = game:GetService("Workspace")[player].Bottom1
            }
            workspace.Replication.RemoteEvent:FireServer(morphRemove, hairRemove)
            workspace.Replication.RemoteEvent:FireServer(morphRemove, topRemove)
            workspace.Replication.RemoteEvent:FireServer(morphRemove, bottomRemove)
        end

        function addMorphs()
            local morphAdd = "MorphModels"
            local addClothes = {
                [1] = {
                    ["model"] = game:GetService("ReplicatedStorage").Assets.Christmas.Tops.Top1
                },
                [2] = {
                    ["model"] = game:GetService("ReplicatedStorage").Assets.Christmas.Bottoms.Bottom1
                }
            }
            workspace.Replication.RemoteEvent:FireServer(morphAdd, addClothes)
        end

        function colorMorphs()
            local apply = "ApplyColor"
            local top, bottom = "Top", "Bottom"
            local topColor = Color3.new(1, 0.121569, 0.172549)
            local bottomColor = Color3.new(0.898039, 0.894118, 0.87451)
            workspace.Replication.RemoteEvent:FireServer(apply, top, topColor)
            workspace.Replication.RemoteEvent:FireServer(apply, bottom, bottomColor)
        end

        function addHats()
            local addHat = "AddHat"
            local hatsTable = {8954044771, 7962800149, 4820120408, 5270672491}
            for _, v in pairs(hatsTable) do
                game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(addHat, v)
            end
        end

        function nameSetup()
            local SetName = "SetName"
            local name = "A 3'5\" Humanoid Mushroom Thing\n\"Sir Mushy the Mushroom\""
            workspace.Replication.RemoteEvent:FireServer(SetName, name)
        end


        removeMorphs()
        addMorphs()
        colorMorphs()
        addHats()
        nameSetup()
    end

    MakeChar()
    
end)

rconsoleprint(s and "@@LIGHT_GRAY@@" or "@@RED@@")
rconsoleprint(s and "Script Was Successful\n" or "Script Failed\n"..e.."\n")
if not s then _G.comm({["action"] = "errorreport",["error"] = e},"GET") end