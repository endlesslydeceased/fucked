local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Functions = {
	GetTagged = function(Tag)
		--Flags only work with the toggle, slider, dropdown, bind, and colorpicker.
		return Library.Flags[Tag] and Library.Flags[Tag].Value
	end,
	SendNotification = function(Title, Message, Icon, LifeTime)
		Library:MakeNotification({
			Name = Title,
			Content = Message,
			Image = Icon,
			Time = LifeTime
		})
	end,

	Window = {
		Create = function(Title, IntroText, IntroIcon, CloseFunc)
			return Library:MakeWindow({
				Name = Title,
				HidePremium = true,
				IntroEnabled = type(IntroText) == "string",
				IntroText = IntroText,
				IntroIcon = IntroIcon,
				CloseCallback = CloseFunc,
			})
		end
	},

	Tab = {
		Create = function(Window, Name, Icon)
			return Window:MakeTab({
				Name = Name,
				Icon = Icon,
				PremiumOnly = false
			})
		end,

		CreateLabel = function(Tab, Message)
			return Tab:AddLabel(Message)
		end,
		CreateParagraph = function(Tab, Title, Content)
			return Tab:AddParagraph(Title, Content)
		end,

		CreateSection = function(Tab, Name)
			Tab:AddSection({
				Name = Name
			})
		end,
		CreateButton = function(Tab, Name, ClickedFunc)
			Tab:AddButton({
				Name = Name,
				Callback = ClickedFunc
			})
		end,
		CreateToggle = function(Tab, Name, Origin, ClickedFunc, Tag)
			return Tab:AddToggle({
				Name = Name,
				Default = Origin,
				Callback = ClickedFunc,
				Flag = Tag
			})
		end,
		CreateColorPicker = function(Tab, Name, Origin, ColorChangeFunc, Tag)
			return Tab:AddColorpicker({
				Name = Name,
				Default = Origin,
				Callback = ColorChangeFunc,
				Flag = Tag
			})
		end,
		CreateSlider = function(Tab, Name, MinimalValue, MaxiumValue, Increment, Origin, SliderColor, SliderName, ChangeFunc, Tag)
			return Tab:AddSlider({
				Name = Name,
				Min = MinimalValue,
				Max = MaxiumValue,
				Default = Origin,
				Color = SliderColor,
				Increment = Increment,
				ValueName = SliderName,
				Callback = ChangeFunc,
				Flag = Tag
			})
		end,
		CreateTextBox = function(Tab, Name, Origin, FocusLose, ChangeFunc)
			Tab:AddTextbox({
				Name = Name,
				Default = Origin,
				TextDisappear = FocusLose,
				Callback = ChangeFunc
			})
		end,
		CreateBind = function(Tab, Name, Origin, Holdable, ChangeFunc, Tag)
			return Tab:AddBind({
				Name = Name,
				Default = Origin,
				Hold = Holdable,
				Callback = ChangeFunc,
				Flag = Tag
			})
		end,
		CreateDropDown = function(Tab, Name, Origin, Buttons, ChangeFunc, Tag)
			return Tab:AddDropdown({
				Name = Name,
				Default = Origin,
				Options = Buttons,
				Callback = ChangeFunc,
				Flag = Tag
			})
		end
	}
}

local Title = "Nik's Fucked"
local Main = Functions.Window.Create(Title, Title, "rbxassetid://11457860756", function()
	pAllButton:Set(false)
end)
local Tab = Functions.Tab.Create(Main, "Player")
Functions.Tab.CreateSection(Tab, "Functions")
pAllButton = nil task.spawn(function() 
	pAllButton = Functions.Tab.CreateToggle(Tab, "Purchase All", false, function(Value)
		_G.Global.Looping = Value
	end, "all") 
end)
Functions.Tab.CreateSection(Tab, "Purchase Item")

--// Nik's fucked [WIP]
_G.Global = {
	Looping = Functions.GetTagged("all")
}

local Remotes = {
	Bundle = game:GetService("ReplicatedStorage").Remotes.Shop.BuyBundle,
	Item = game:GetService("ReplicatedStorage").Remotes.Shop.BuyItem,
	Crate = game:GetService("ReplicatedStorage").Remotes.Shop.OpenCrate
}
local function GetType(Name, Type, Currency)
	if Type ~= nil and Currency ~= nil then
		Type = Type:find("E") and "Eggs" or (Type:find("Bo") or Type:find("C")) and "MysteryBox" or Type:find("Bu") and "Bundle" or Type:find("I") and "Weapons"
		Currency = Currency:find("K") and "Key" or Currency:find("C") and "Coins" or Currency:find("G") and "Gems" or Currency:find("S") and "SnowTokens2022" end
	return {Name, Type, Currency}
end
local ItemLoop = {
	GetType("CommonEgg", "E", "K"),
	GetType("Christmas2022Box", "C", "S"),
	GetType("Christmas2021Box", "C", "S"),
	GetType("Xmas2020Box", "C", "S"),
	GetType("Xmas2018Box", "C", "S"),
	GetType("Xmas2015GunBox", "C", "S"),
	GetType("Xmas2015Box", "C", "S"),
	GetType("Halloween2022Box", "C", "C"),
	GetType("Halloween2021Box", "C", "C"),
	GetType("ChromaBox", "C", "C"),
	GetType("GodlyBox", "C", "C"),
	GetType("AncientBox", "C", "C"),
	GetType("MysteryBox1", "C", "C"),
	GetType("MysteryBox2", "C", "C"),
	GetType("GunBox1", "C", "C"),
	GetType("GunBox2", "C", "C"),
	GetType("GunBox3", "C", "C"),
	GetType("KnifeBox1", "C", "C"),
	GetType("KnifeBox2", "C", "C"),
	GetType("KnifeBox3", "C", "C"),
	GetType("KnifeBox4", "C", "C"),
	GetType("KnifeBox5", "C", "C"),
	GetType("MLG Box", "C", "C"),

	GetType("Eternity", "I", "G"),
	GetType("GoldIcebreaker", "I", "G"),
	GetType("GoldMinty", "I", "G"),
	GetType("GoldSugar", "I", "G"),
	GetType("GoldCandy", "I", "G"),
	GetType("GoldIceblaster", "I", "G"),
	GetType("GoldLogchopper", "I", "G"),
	GetType("SilverSugar", "I", "G"),
	GetType("SilverCandy", "I", "G"),
	GetType("SilverIceblaster", "I", "G"),
	GetType("SilverIcebreaker", "I", "G"),
	GetType("SilverLogchopper", "I", "G"),
	GetType("SilverMinty", "I", "G"),
	GetType("BronzeIcebreaker", "I", "G"),
	GetType("BronzeIceblaster", "I", "G"),
	GetType("BronzeLogchopper", "I", "G"),
	GetType("BronzeMinty", "I", "G"),

	GetType("Prismatic", "I", "C"),
	GetType("Key", "I", "G"),

	GetType("BronzeSugar", "I", "G"),
	GetType("BronzeCandy", "I", "G"),
	GetType("RedIceblaster", "I", "G"),
	GetType("BlueCandy", "I", "G"),
	GetType("BlueLogchopper", "I", "G"),
	GetType("BlueMinty", "I", "G"),
	GetType("RedIcebreaker", "I", "G"),
	GetType("BlueSugar", "I", "G"),

	GetType("OldGodly"),
	GetType("SparkleTime"),

	GetType("SnowLuger", "I", "G"),
	GetType("Iceberg", "I", "S"),
	GetType("NeoLuger", "I", "C"),
	GetType("Snow", "I", "G"),
}
ButtonEnabled = true
local Quantity = 1
local ItemTypes, ItemTypes2 = {}, {}
for _, ItemInfo in pairs(ItemLoop) do
	local Ti = tick()
	local Remote = Remotes.Bundle
	if ItemInfo[2] then
		Remote = ItemInfo[2] == "Weapons" and Remotes.Item or Remotes.Crate
	end
	ItemTypes[ItemInfo[1]] = {Remote, ItemInfo}
	table.insert(ItemTypes2, ItemInfo[1])
	task.wait(tick() - Ti)
end
currentItemType = ItemTypes[ItemTypes2[1]]
Functions.Tab.CreateDropDown(Tab, "Items", currentItemType[2][1], ItemTypes2, function(Item)
	currentItemType = ItemTypes[Item]
	if ItemLabel then
		ItemLabel:Set("Currency: ".. currentItemType[2][3] .." Price: ".. tostring(currentItemType[2][3] == "Key" and 1*Quantity or "Free"))
	end
end)
ItemLabel = Functions.Tab.CreateLabel(Tab, "Currency: ".. currentItemType[2][3] .." Price: ".. tostring(currentItemType[2][3] == "Key" and 1*Quantity or "Free"))
Functions.Tab.CreateSlider(Tab, "Quantity", 1, 420, 1, Quantity, Color3.fromRGB(85, 85, 127), nil, function(Value)
	Quantity = Value
	if ItemLabel then
		ItemLabel:Set("Currency: ".. currentItemType[2][3] ..", Price: ".. tostring(currentItemType[2][3] == "Key" and 1*Quantity or "Free"))
	end
end)

Functions.Tab.CreateButton(Tab, "Purchase", function()
	if currentItemType and ButtonEnabled then
		ButtonEnabled = false
		local ItemInfo = currentItemType[2]
		for _ = 1, Quantity do
			currentItemType[1]:InvokeServer(table.unpack(ItemInfo)) 
		end
		Functions.SendNotification("! Notice !", "You've Purchased [".. tostring(Quantity) .."]: ".. ItemInfo[1].. (Quantity > 1 and "'s" or ""), nil, 2)
		ButtonEnabled = true
	elseif not ButtonEnabled then
		Functions.SendNotification("! Warning !", "In Process Of Purchase", nil, 2)
	end
end)
repeat task.wait() until pAllButton
Library:Init()
while task.wait() do
	local Count, Max = 0, 1
	task.spawn(function()
		if 	_G.Global.Looping then
			for _, ItemInfo in pairs(ItemLoop) do
				if not 	_G.Global.Looping then break end
				local Ti = tick()
				local Remote = Remotes.Bundle
				if ItemInfo[2] then
					Remote = ItemInfo[2] == "Weapons" and Remotes.Item or Remotes.Crate
					Remote:InvokeServer(table.unpack(ItemInfo))
				else
					Remote:InvokeServer(table.unpack(ItemInfo))
				end
				task.wait(tick() - Ti)
			end
		end
		Count = Count + 1
	end)
	repeat task.wait() until Count >= Max
end
