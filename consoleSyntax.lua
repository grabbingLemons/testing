-- PLACE CODE HERE TO BE COLORED

local code = [[
local str = "Useless script!!!!"
str = str:split(" ")
for i=1, #str do
 print(str[i] .. "\n")
end
]]



rconsoleprint("@@WHITE@@")
rconsoleclear()
rconsolename("Syntax Highlight")
local printed = {}
local subs = {}
local quoteSubs = {}
local quoted = {}
local alphabet = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
local fontalphabet = {"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?"}
local count = {"0","1","2","3","4","5","6","7","8","9"}
local fontcount = {"?","?","?","?","?","?","?","?","?","?"}

local theme = {"LIGHT_RED","RED","LIGHT_CYAN","CYAN", "LIGHT_BLUE"} --functions, statements, symbols, values, quotes

local functions = {"assert","byte","char","collectgarbage","error","find","format","getfenv","getmetatable","gmatch","gsub","insert","ipairs","len","loadfile","loadstring","lower","match","newproxy","next","pairs","pcall","rconsoleprint","rconsolewarn","rconsoleclear","rconsolename","rconsoleerr","printconsole","print","rawequal","rawget","rawset","rconsoleinput","rep","reverse","select","setfenv","split","sub","setmetatable","tonumber","tostring","type","upper","unpack","xpcall","_G","shared","delay","require","spawn","tick","typeof","wait","warn","game","Enum","script","workspace"}
local statements = {"and","break","do","else","elseif","end","false","for","function","goto","if","in","local","nil","not","or","repeat","return","then","true","until","while"}
local symbols = {"#",":","~","=","<",">","+","-"}
local values = {"true","false","nil","0","1","2","3","4","5","6","7","8","9"}


function isAColorCode(text)
   text = text:upper()
   if text == "BLACK" or text == "BLUE" or text == "GREEN" or text == "CYAN" or text == "RED" or text == "" or text == "BROWN" or text == "WHITE" or text == "DARK_GRAY" or text == "LIGHT_BLUE" or text == "LIGHT_GREEN" or text == "CYAN" or text == "LIGHT_RED" or text == "LIGHT_MAGENTA" or text == "YELLOW" or text == "LIGHT_CYAN" or text == "LIGHT_GRAY" then
       return true
   else
       return false
   end
end

function isLetter(text)
   for i=1, #alphabet do
       if alphabet[i] == text then
           return true
       end
   end
   return false
end

function newFont(text)
   for i=1,52 do
       text = text:gsub(alphabet[i], fontalphabet[i])
   end
   for i=1,10 do
       text = text:gsub(count[i], fontcount[i])
   end
   return text
end

function normalFont(text)
   for i=1,52 do
       text = text:gsub(fontalphabet[i], alphabet[i])
   end
   for i=1,10 do
       text = text:gsub(fontcount[i], count[i])
   end
   return text
end

for i=1, #code:split("\"") do
   table.insert(quoteSubs, code:split("\"")[i])
   if (i+1 <= #code:split("\"")) then
       table.insert(quoteSubs, "\"")
   end
end
for i=1, #quoteSubs do
   if (quoteSubs[i] == "\"" and quoteSubs[i-2] == "\"") then
       if #quoted > 0 then
           if quoted[#quoted][2] ~= i-2 then
               table.insert(quoted, {i-2, i})
           end
       else
           table.insert(quoted, {i-2, i})
       end
   end
end
for quote=1, #quoted do
   for i=1, #quoteSubs do
       if i == quoted[quote][2] then
           quoteSubs[quoted[quote][2]-2] = ""
           quoteSubs[quoted[quote][2]-1] = newFont("@@" .. theme[5] .. "@@\"" .. quoteSubs[quoted[quote][2]-1] .. "\"@@WHITE@@")
           quoteSubs[quoted[quote][2]] = ""
       end
   end
end
code = ""
for i=1, #quoteSubs do
   code = code .. quoteSubs[i]
end

function addSyntax(source, word, color)
   if isAColorCode(color) then
       local a, b = code:gsub(word, newFont("@@" .. color .. "@@" .. word .. "@@WHITE@@"))
       code = a
   end
end

for i=1, #functions do
   addSyntax(code, functions[i], theme[1])
end
for i=1, #statements do
   addSyntax(code, statements[i], theme[2])
end
for i=1, #symbols do
   addSyntax(code, symbols[i], theme[3])
end
for i=1, #values do
   addSyntax(code, values[i], theme[4])
end

code = normalFont(code)

local colorcode = code:split("@@")
for i=1, #colorcode do
   table.insert(subs, colorcode[i])
   code = code .. colorcode[i]
   if (i+1 <= #colorcode) then
       table.insert(subs, "@@")
       code = code .. "@@"
   end
end

for i=1, #subs do
   if (subs[i] == "@@" and isAColorCode(subs[i+1]) and subs[i+2] == "@@" and subs[i+3]) then
       if i+7 <= #subs then
           if not isLetter(subs[i-1]:sub(subs[i-1]:len(),subs[i-1]:len())) then
               rconsoleprint(subs[i] .. subs[i+1]:upper() .. subs[i+2])
               rconsoleprint(subs[i+3])
               rconsoleprint("@@WHITE@@")
               table.insert(printed, subs[i+3])
           elseif not isLetter(subs[i+7]:sub(1,1)) then
               rconsoleprint(subs[i] .. subs[i+1]:upper() .. subs[i+2])
               rconsoleprint(subs[i+3])
               rconsoleprint("@@WHITE@@")
               table.insert(printed, subs[i+3])
           end
       else
           rconsoleprint(subs[i] .. subs[i+1]:upper() .. subs[i+2])
           rconsoleprint(subs[i+3])
           rconsoleprint("@@WHITE@@")
           table.insert(printed, subs[i+3])
       end
   else
       if not table.find(printed, subs[i]) and not isAColorCode(subs[i]) then
           rconsoleprint(subs[i])
           table.insert(printed, subs[i+3])
       end
   end
end