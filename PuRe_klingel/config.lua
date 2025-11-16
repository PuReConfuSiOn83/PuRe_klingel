Config = {}

--------------------------------------------------
-- ⚙️ Grundeinstellungen
--------------------------------------------------
Config.Options = {
	NotificationSystem = "ox", -- 'ox', 'esx', 'both'
	CooldownTime = 10, -- Sekunden zwischen Klingelversuchen
	HearingDistance = 3.0, -- Radius, in dem andere die Klingel hören

	EnableWebhook = true,
	WebhookURL = "your_webhook_here",
	WebhookName = "Klingel-System",
	WebhookAvatar = "https://i.imgur.com/4M34hi2.png",

	Debug = false,
}

--------------------------------------------------
-- 🔔 Klingeln (alle Jobs nutzen jetzt "jobs = {}")
--------------------------------------------------
Config.Klingeln = {
	{
		name = "Rathaus",
		jobs = { "rathaus" },
		label = "Rathaus",
		pos = vector3(-550.1043, -190.2172, 38.4233),
		blip = { sprite = 280, color = 38, label = "Rathaus-Klingel" },
	},
	{
		name = "police_station",
		jobs = { "police" },
		label = "Polizeistation",
		pos = vector3(444.0749, -982.0001, 31.7786),
		blip = { sprite = 280, color = 38, label = "Polizei-Klingel" },
	},
	{
		name = "hospital",
		jobs = { "ambulance" },
		label = "Krankenhaus",
		pos = vector3(-676.1520, 327.8408, 83.4532),
		blip = { sprite = 153, color = 1, label = "Krankenhaus-Klingel" },
	},
	{
		name = "lssd_station",
		jobs = { "sheriff" },
		label = "Sheriffstation",
		pos = vector3(-472.6920, 7089.0815, 22.3837),
		blip = { sprite = 280, color = 38, label = "Sheriff-Klingel" },
	},
	{
		name = "LS Customs",
		jobs = { "ls_customs", "off_ls_customs" },
		label = "Werkstatt",
		pos = vector3(-360.7840, -98.9882, 39.5467),
		blip = { sprite = 280, color = 38, label = "Werkstatt-Klingel" },
	},
	{
		name = "LS Customs Verwahrhof",
		jobs = { "ls_customs" },
		label = "Verwahrhof",
		pos = vector3(-1611.9110, -814.9314, 10.2435),
		blip = { sprite = 280, color = 38, label = "Verwahrhof-Klingel" },
	},
	{
		name = "Blood Brothers",
		jobs = { "bloodbrothers" },
		label = "Blood Brothers Anwesen",
		pos = vector3(-75.7612, 6474.8247, 31.4538),
		blip = { sprite = 280, color = 38, label = "Blood Brothers Klingel" },
	},
	{
		name = "Royal Mafia",
		jobs = { "royal_mafia" },
		label = "Royal Mafia Anwesen",
		pos = vector3(-865.0780, 7219.7290, 99.6215),
		blip = { sprite = 280, color = 38, label = "Royal Mafia Klingel" },
	},
	-- {
	--     name = "Bratwa",
	--     jobs = { "bratwa" },
	--     label = "Anwesen",
	--     pos = vector3(-1804.1847, 451.5729, 128.2804),
	--     blip = { sprite = 280, color = 38, label = "Bratwa Klingel" }
	-- },
	-- {
	--     name = "Bratwa Club",
	--     jobs = { "bratwa" },
	--     label = "Club",
	--     pos = vector3(377.6589, 268.4229, 95.3915),
	--     blip = { sprite = 280, color = 38, label = "Club Klingel" }
	-- },
	{
		name = "Sons of Metal",
		jobs = { "reapers" },
		label = "Sons of Metal Club",
		pos = vector3(-418.2102, 266.9402, 83.1953),
		blip = { sprite = 280, color = 38, label = "Sons of Metal Club Klingel" },
	},
	{
		name = "Winged Reapers",
		jobs = { "reapers" },
		label = "Winged Reapers Anwesen",
		pos = vector3(87.0973, -2564.0510, 6.0049),
		blip = { sprite = 280, color = 38, label = "Winged Reapers Klingel" },
	},
	{
		name = "White Cars",
		jobs = { "whitecars" },
		label = "Autohändler",
		pos = vector3(110.0251, -151.6957, 55.0541),
		blip = { sprite = 280, color = 38, label = "White Cars Klingel" },
	},
}
