rconsolename("Rblx Core")


local CorePackages = game:GetService("CorePackages")
local i = 0

while i < 10 do
rconsoleprint('\n')
i = i+1
end


for i, v in pairs((CorePackages.Packages._Index.UIBlox.UIBlox.App.Menu:GetChildren())) do
    rconsolewarn(v:GetFullName() .. '\n')
end