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
                    ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top15
                },
                [2] = {
                    ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Bottoms.Bottom5
                }
            }
            workspace.Replication.RemoteEvent:FireServer(morphAdd, addClothes)
        end

        function colorMorphs()
            local apply = "ApplyColor"
            local top, bottom = "Top", "Bottom"
            local topColor = Color3.new(0.247058, 0.003921, 0.082352)
            local bottomColor = Color3.new(0, 0, 0)
            workspace.Replication.RemoteEvent:FireServer(apply, top, topColor)
            workspace.Replication.RemoteEvent:FireServer(apply, bottom, bottomColor)
        end

        function addHats()
            local changeFace = "ChangeFace"
            local nullface = 0

            game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(changeFace, nullface)
            local addHat = "AddHat"
            local hatsTable = {6871078433, 6682451716, 7435964657, 4820120408, 5355321395}
            for _, v in pairs(hatsTable) do
                game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(addHat, v)
            end
        end

        function nameSetup()
            local SetName = "SetName"
            local name = "\" Vincent Ashburn \"\n A Middle-aged rough looking man standing at about 5\'8\". The man has very coarse hands along with an irate looking face shrouded with few scars and a thick beard."
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