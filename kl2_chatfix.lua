if not game:IsLoaded() then
game.Loaded:Wait()
end
while true do
    game:GetService("StarterGui"):SetCore("TopbarEnabled", true)    
    wait(.1)
end