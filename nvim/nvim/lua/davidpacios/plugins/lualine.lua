local andromeda_lualine = require("andromeda.plugins.lualine")

andromeda_lualine.theme.normal.a.bg = "#e9997d"
andromeda_lualine.theme.normal.b.fg = andromeda_lualine.theme.normal.a.bg
andromeda_lualine.theme.insert.b.fg = andromeda_lualine.theme.insert.a.bg
andromeda_lualine.theme.visual.b.fg = andromeda_lualine.theme.visual.a.bg
andromeda_lualine.theme.replace.b.fg = andromeda_lualine.theme.replace.a.bg
andromeda_lualine.theme.command.b.fg = andromeda_lualine.theme.command.a.bg
andromeda_lualine.theme.terminal.b.fg = andromeda_lualine.theme.terminal.a.bg
andromeda_lualine.theme.inactive.b.fg = andromeda_lualine.theme.inactive.a.bg

require("lualine").setup({
	options = {
		theme = andromeda_lualine.theme,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	--sections = andromeda_lualine.sections,
	--inactive_sections = andromeda_lualine.inactive_sections,
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filename" },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})
