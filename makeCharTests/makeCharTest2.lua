-- NEW TEST
branch = "main"
--[[
    Does not include race switching
    Does not include use of in-game hats
        # will add soon
]]

--[[ Name Template:
    Place anything in between the quotation marks, for special characters like single quotes, quotation marks, or if you want to make a new line do:
        \" - Use quotes inside of string, you have to use the \ behind every quote you use
        \' -  Same as quotes.
        \n - Separates with a new line
]]
name = ""

--[[ 
    !! You must own donor to use it !!
    Hat Template:
     0000, 0001, 0002 ... so on and so forth; add them between the curcly brackets 
]]
hats = {

}

--[[
    !! YOU MUST OWN THE  GAMEPASSES TO USE THE CLOTHES FROM !!

    Clothes are a little iffy since there's no real easy way to change them without going...
     through each and picking them out, but the table will be placed up here for convenience

     syntax will be:
      game:GetService("ReplicatedStorage").Assets[Gamepasses].Tops.Top#
      game:GetService("ReplicatedStorage").Assets[Gamepasses].Bottoms.Bottom#

      Available sections will be: 
       Base Game
       Christmas
       Halloween

       and using the Gamepasses extension to assets, the list is expanded to:
         Eastern
         Hreinngar
         Premium
         Town
         Fantasy+
        
    Path to tops I would use:
        brigandine vest - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top6
        suit-ish kind of top - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top15
        top with straps and bags - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top22
        santa top - game:GetService("ReplicatedStorage").Assets.Christmas.Tops.Top1
        blacksmith top - game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Tops.Top5

    Path to pants I would use:
        basic pants - game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Bottoms.Bottom5
        formal-ish pants - game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Bottoms.Bottom2
        homeless dude 11s - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Bottoms.Bottom2
        santa pants - game:GetService("ReplicatedStorage").Assets.Christmas.Bottoms.Bottom1
        gambeson skirt thing - game:GetService("ReplicatedStorage").Assets.Gamepasses.Premium.Bottoms.Bottom2
]]

clothes = {
    [1] = {
        ["model"] = top
    },
    [2] = {
        ["model"] = bottom
    }
}


-- Colors for your shirt and pants
-- Uses HSV
topColor = Color3.new(0, 0, 0)
bottomColor = Color3.new(0, 0, 0)

--[[
    Choices are:
    newChar,
    mushy,
    vincent

    put choice between parenthesis
]]
pickTemplate(newChar)


function pickTemplate(choice)
    if tostring(choice) == "newChar" then
        makeNewChar()
    else
        return loadstring((game:HttpGetAsync(("https://raw.githubusercontent.com/grabbingLemons/makeChar/%s/templates/%s.lua")):format(branch, choice)), choice .. '.lua')()
    end
end


function makeNewChar()
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
                    deleteMorphs(y)
                end
            end
        end
    end
    function deleteMorphs(item)
        local morphRemove = "RemoveMorphs"
        local itemTable = {
            [1] = item
        }

        for i, v in pairs(itemTable) do
            rconsoleprint(tostring(v) .. "\n")
        end
        workspace.Replication.RemoteEvent:FireServer(morphRemove, itemTable)
    end

    
    function addClothes()
        -- add the clothes
        local morphAdd = "MorphModels"   
        local apply = "ApplyColor"
        local top, bottom = "Top", "Bottom"

        workspace.Replication.RemoteEvent:FireServer(morphAdd, clothes)

        -- color the clothes
        workspace.Replication.RemoteEvent:FireServer(apply, top, topColor)
        workspace.Replication.RemoteEvent:FireServer(apply, bottom, bottomColor)
    end

    function addHats()
        local addHat = "AddHat"
        for _, v in pairs(hats) do
            game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(addHat, v)
        end
    end
    
    function setupName()
        local setName = "SetName"

        workspace.ReplicatedStorage.RemoteEvent:FireServer(setName, name)
    end

    findMorphs()
    wait()
    addClothes()
    addHats()
    setupName()
end