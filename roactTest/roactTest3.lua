--[[
  Error:
   "Unable to create an Instance of type \"Textbutton\""
]]

local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Roact = getrenv().require(CorePackages.Roact)
local player =  game.Players.LocalPlayer
local branch = "master"

local charGUI =
    Roact.createElement("ScreenGui", {
            IgnoreGuiInset = true,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        },
        {
            charGUI = Roact.createElement("Frame", {
                    BackgroundColor3 = Color3.fromHSV(0.667, 0.391, 0.251),
                    ClipsDescendants = true,
                    Position = UDim2.fromScale(0.0252, 0.598),
                    Size = UDim2.fromOffset(499, 206),
                }, {
                    uICorner = Roact.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0),
                    }),

                    _topBar = Roact.createElement("Frame", {
                        BackgroundColor3 = Color3.fromHSV(0.667, 0.409, 0.173),
                        Size = UDim2.fromOffset(499, 31),  
                    }, {
                        _header = Roact.createElement("TextLabel", {
                            Font = Enum.Font.Highway,
                            RichText = true,
                            Text = "Client: <u>" .. player.Name .."</u>",
                            TextColor3 = Color3.fromHSV(0,0,1),
                            TextScaled = true,
                            TextSize = 14,
                            TextWrapped = true,
                            BackgroundColor3 = Color3.fromHSV(0,0,0),
                            BackgroundTransparency = 1,
                            BorderColor3 = Color3.fromHSV(0.571, 0.491, 0.208),
                            Position = UDim2.fromScale(0.374, 0.129),
                            Size  = UDim2.fromOffset(125, 23),
                        }),
                        uICorner1 = Roact.createElement("UICorner", {
                            CornerRadius = UDim.new(0.9, 0),
                        }),
                    }),
                    _holder = Roact.createElement("Frame", {
                        BackgroundColor3 = Color3.fromHSV(0,0,1),
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                    }, {
                        _button = Roact.createElement("TextButton", {
                            Font = Enum.Font.Highway,
                            Text = "Execute",
                            TextColor3 = Color3.fromHSV(0,0,1),
                            TextSize = 14,
                            BackgroundColor3 = Color3.fromHSV(0.667, 0.408, 0.192),
                            Position = UDim2.fromScale(0.0686, 0.754),
                            Size = UDim2.fromOffset(77, 31),

                            [Roact.Event.MouseButton1Click] = function()
                                local choice = tostring(CoreGui._internalMakeChar.charGUI._holder.choiceText.Text)
                                loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/grabbingLemons/makeChar/%s/characters/%s.lua"):format(branch, choice)), choice .. '.lua')()
                            end
                        }, {
                            uiCorner2 = Roact.createElement("UICorner", {
                                CornerRadius = UDim.new(0.35, 0),
                            }),
                        }),

                        choiceText = Roact.createElement("TextLabel", {
                            Font = Enum.Font.Highway,
                            RichText = true,
                            Text = "What <b>character</b> will you load?",
                            TextColor3 = Color3.fromHSV(0,0,1),
                            TextScaled = true,
                            TextSize = 14,
                            TextWrapped = true,
                            BackgroundColor3 = Color3.fromHSV(0,0,1),
                            BackgroundTransparency = 1,
                            Position = UDim2.fromScale(0.0701, 0.277),
                            Size = UDim2.fromOffset(165, 19),
                        }),
                        _choiceBox = Roact.createElement("TextBox", {
                            CursorPosition = -1,
                            Font = Enum.Font.Highway,
                            Text = ". . .",
                            TextColor3 = Color3.fromHSV(0,0,1),
                            TextSize = 14,
                            BackgroundColor3 = Color3.fromHSV(0.667, 0.4, 0.314),
                            BorderColor3 = Color3.fromHSV(0.667, 0.396, 0.188),
                            Position = UDim2.fromScale(0.0701, 0.379),
                            Size = UDim2.fromOffset(165, 26),
                        }),
                        _choicesList = Roact.createElement("Frame", {
                            BackgroundColor3 = Color3.fromHSV(0.667, 0.4, 0.314),
                            Position = UDim2.fromScale(0.455, 0.277),
                            Size = UDim2.fromOffset(242, 129),
                        }, {
                            uiCorner3 = Roact.createElement("UICorner", {
                                CornerRadius = UDim.new(0.1, 0),
                            }),
                            _listText = Roact.createElement("TextBox", {
                                ClearTextOnFocus = false,
                                CursorPosition = -1,
                                Font = Enum.Font.Highway,
                                MultiLine = true,
                                RichText = true,
                                Text = "<b>Choices:</b>\nMushy\nVincent\nGuard",
                                TextColor3 = Color3.fromHSV(0,0,1),
                                TextEditable = false,
                                TextSize = 12,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextYAlignment = Enum.TextYAlignment.Top,
                                BackgroundColor3 = Color3.fromHSV(0,0,1),
                                BackgroundTransparency = 1,
                                Position = UDim2.fromScale(0.0248, 0.0465),
                                Size = UDim2.fromScale(0.96, 0.9),
                            }),
                        }),
                    }),
                }
            )
        })

Roact.mount(charGUI, CoreGui, "_internalMakeChar")