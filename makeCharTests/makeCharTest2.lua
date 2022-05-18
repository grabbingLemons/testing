-- NEW TEST
branch = "revision"
--[[
    Does not include race switching
]]

--[[ Name Template:
    Place anything in between the quotation marks, for special characters like single quotes, quotation marks, or if you want to make a new line do:
        \" - Use quotes inside of string, you have to use the \ behind every quote you use
        \' -  Same as quotes.
        \n - Separates with a new line
]]
name = ""

--[[ Hat Template:
    0000, 0001, 0002 ... so on and so forth; add them between the curcly brackets 
]]
hats = {

}

-- Colors for your shirt and pants
-- Uses HSV
topColor = Color3.new(0, 0, 0)
bottomColor = Color3.new(0, 0, 0)

--[[
    Choices are:
    newChar,
    mushy,
    vincent,
    
]]
function pickTemplate(choice)
    if tostring(choice) == "newChar" then
         newChar()
    else
        return loadstring((game:HttpGetAsync(("https://raw.githubusercontent.com/archiveHub/makeChar/%s/%s.lua")):format(branch, choice)), choice .. '.lua')()
    end
end


function newChar()

end