if not game:IsLoaded() then
game.Loaded:Wait()
end
local Part = game:GetService("Lighting").DayAtmosphere
Part:Destroy()
Part.Parent = game:GetService("Lighting")