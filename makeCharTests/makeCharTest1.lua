-- TEST WORKS

local player = game.Players.LocalPlayer.Name 
local character = game:GetService("Workspace")[player]

function findMorphs()
    for  x, y in pairs(character:GetChildren()) do
        if y:IsA("Model") then
            local strFormat1, strFormat2, strFormat3 = "%.3s", "%.6s", "%.4s"
            local strFormatted1 = string.format(strFormat1, tostring(y))
            local strFormatted2 = string.format(strFormat2, tostring(y))
            local strFormatted3 = string.format(strFormat3, tostring(y))
            if strFormatted1 == "Top" or strFormatted2 == "Bottom" or strFormatted3 == "Hair" then
                deleteTop(y)
            end
        end
    end
end
function deleteTop(item)
    local morphRemove = "RemoveMorphs"
    local itemTable = {
        [1] = item
    }

    for i, v in pairs(itemTable) do
        rconsoleprint(tostring(v) .. "\n")
    end
    workspace.Replication.RemoteEvent:FireServer(morphRemove, itemTable)
end

findMorphs()

