local cmdp = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
repeat
    wait()
until(cmdp.LocalPlayer)
while true do
    if UserInputService:IsKeyDown(Enum.KeyCode.V) then
        cmdp.LocalPlayer.DevCameraOcclusionMode = 1
    else
        cmdp.LocalPlayer.DevCameraOcclusionMode = 0
    end
    cmdp.LocalPlayer.CameraMaxZoomDistance = 10000000
    cmdp.LocalPlayer.CameraMinZoomDistance = 0
    cmdp.LocalPlayer.CameraMode = 'Classic'
    wait()
end