-- reverie theme colors and highlight definitions
local M = {}

-- Color palette
M.colors = {
    background = "#101c38",
    foreground = "#d8e0f2",
    black = "#1f2b4a",
    red = "#e56b6f",
    green = "#6ca994",
    yellow = "#f4a261",
    blue = "#587ea8",
    magenta = "#b479a3",
    cyan = "#6dc2c5",
    white = "#c7cce1",
    bright_black = "#4b5a80",
    bright_red = "#f47c7c",
    bright_green = "#82c3ab",
    bright_yellow = "#ffb77e",
    bright_blue = "#7e9fca",
    bright_magenta = "#d091be",
    bright_cyan = "#85d8da",
    bright_white = "#d8e0f2",
    cursor_cursor = "#a0a8b0",
    cursor_text = "#101c38",
    selection_background = "#2a385b",
    selection_text = "#d8e0f2",

	-- UI colors
	bg_alt = "#2a385b",
	bg_highlight = "#2a385b",
	bg_visual = "#2a385b",
	border = "#4b5a80",

	-- Syntax colors
	comment = "#4b5a80",
	comment_alt = "#4b5a80",

	-- Functions and methods
	func = "#d8e0f2",
	func_builtin = "#d8e0f2",

	-- Strings
	string = "#f4a261",
	string_template = "#f4a261",
	string_escape = "#f4a261",
	string_regex = "#f4a261",

	-- Keywords and control flow
	keyword = "#6dc2c5",

	-- Types and classes
	type = "#6dc2c5",

	-- Constants and numbers
	constant = "#f4a261",
	number = "#f4a261",
	boolean = "#f4a261",

	-- Variables and properties
	variable = "#d8e0f2",
	property = "#d8e0f2",

	-- Operators and punctuation
	operator = "#6dc2c5",
	punctuation = "#4b5a80",

	-- Special colors
	cursor = "#a0a8b0",
	line_number = "#4b5a80",
	line_number_active = "#d8e0f2",

	-- Diagnostic colors
	error = "#e56b6f",
	warning = "#f4a261",
	info = "#6ca994",
	hint = "#6dc2c5",

	-- Git colors
	git_add = "#6ca994",
	git_change = "#f4a261",
	git_delete = "#e56b6f",
	git_ignore = "#4b5a80",

	-- Terminal colors
	terminal_black = "#1f2b4a",
	terminal_red = "#e56b6f",
	terminal_green = "#6ca994",
	terminal_yellow = "#f4a261",
	terminal_blue = "#587ea8",
	terminal_magenta = "#b479a3",
	terminal_cyan = "#6dc2c5",
	terminal_white = "#c7cce1",
	terminal_bright_black = "#4b5a80",
	terminal_bright_red = "#f47c7c",
	terminal_bright_green = "#82c3ab",
	terminal_bright_yellow = "#ffb77e",
	terminal_bright_blue = "#7e9fca",
	terminal_bright_magenta = "#d091be",
	terminal_bright_cyan = "#85d8da",
	terminal_bright_white = "#d8e0f2",

	-- Additional colors
	none = "NONE",
}

-- Helper function to set highlights
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Apply theme with configuration
function M.apply(config)
	local colors = vim.tbl_deep_extend("force", M.colors, config.colors or {})

	-- Apply background override if disabled
	if config.disable.background then
		colors.bg = "NONE"
	end

	-- Editor highlights
	hl("Normal", { fg = colors.fg, bg = colors.bg })
	hl("NormalFloat", { fg = colors.fg, bg = colors.bg })
	hl("FloatBorder", { fg = colors.border, bg = colors.bg })
	hl("ColorColumn", { bg = colors.bg_alt })
	hl("Cursor", { fg = colors.cursor_text, bg = colors.cursor })
	hl("CursorLine", { bg = colors.bg_highlight })
	hl("CursorColumn", { bg = colors.bg_highlight })
	hl("LineNr", { fg = colors.line_number })
	hl("CursorLineNr", { fg = colors.line_number_active, bold = true })
	hl("SignColumn", { bg = colors.bg })
	hl("StatusLine", { fg = colors.fg, bg = colors.bg })
	hl("StatusLineNC", { fg = colors.comment_alt, bg = colors.bg })
	hl("TabLine", { fg = colors.comment_alt, bg = colors.bg })
	hl("TabLineFill", { bg = colors.bg })
	hl("TabLineSel", { fg = colors.fg, bg = colors.bg })
	hl("VertSplit", { fg = colors.border })
	hl("WinSeparator", { fg = colors.border })
	hl("Visual", { bg = colors.selection_background, fg = colors.selection_text })
	hl("VisualNOS", { bg = colors.selection_background, fg = colors.selection_text })
	hl("Search", { fg = colors.bg, bg = colors.func })
	hl("IncSearch", { fg = colors.bg, bg = colors.string_escape })
	hl("CurSearch", { fg = colors.bg, bg = colors.string_escape })
	hl("Substitute", { fg = colors.bg, bg = colors.string_escape })
	hl("MatchParen", { fg = colors.cursor, bg = colors.bg_highlight, bold = true })
	hl("Question", { fg = colors.info })
	hl("ModeMsg", { fg = colors.fg })
	hl("MoreMsg", { fg = colors.info })
	hl("ErrorMsg", { fg = colors.error })
	hl("WarningMsg", { fg = colors.warning })
	hl("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
	hl("PmenuSel", { fg = colors.fg, bg = colors.bg_highlight })
	hl("PmenuSbar", { bg = colors.bg_highlight })
	hl("PmenuThumb", { bg = colors.border })
	hl("WildMenu", { fg = colors.fg, bg = colors.bg_highlight })
	hl("Folded", { fg = colors.comment, bg = colors.bg_alt })
	hl("FoldColumn", { fg = colors.comment, bg = colors.bg })
	hl("Directory", { fg = colors.info })
	hl("Title", { fg = colors.keyword, bold = true })
	hl("NonText", { fg = colors.comment })
	hl("SpecialKey", { fg = colors.comment })
	hl("Whitespace", { fg = colors.comment })
	hl("EndOfBuffer", { fg = colors.bg })

	-- Syntax highlighting
	local comment_style = { fg = colors.comment }
	if not config.disable.italic_comments then
		comment_style.italic = true
	end

	hl("Comment", comment_style)
	hl("Todo", { fg = colors.comment_alt, bold = true })
	hl("Constant", { fg = colors.constant })
	hl("String", { fg = colors.string })
	hl("Character", { fg = colors.string })
	hl("Number", { fg = colors.number })
	hl("Float", { fg = colors.number })
	hl("Boolean", { fg = colors.boolean })
	hl("Identifier", { fg = colors.variable })
	hl("Function", { fg = colors.func })
	hl("Statement", { fg = colors.keyword })
	hl("Conditional", { fg = colors.keyword, bold = true })
	hl("Repeat", { fg = colors.keyword, bold = true })
	hl("Label", { fg = colors.type })
	hl("Operator", { fg = colors.operator })
	hl("Keyword", { fg = colors.keyword })
	hl("Exception", { fg = colors.keyword })
	hl("PreProc", { fg = colors.keyword })
	hl("Include", { fg = colors.keyword, italic = true })
	hl("Define", { fg = colors.keyword })
	hl("Macro", { fg = colors.keyword, bold = true })
	hl("PreCondit", { fg = colors.keyword })
	hl("Type", { fg = colors.type })
	hl("StorageClass", { fg = colors.keyword })
	hl("Structure", { fg = colors.type })
	hl("Typedef", { fg = colors.type })
	hl("Special", { fg = colors.string_escape })
	hl("SpecialChar", { fg = colors.string_escape, bold = true })
	hl("Tag", { fg = colors.keyword })
	hl("Delimiter", { fg = colors.punctuation })
	hl("SpecialComment", { fg = colors.comment_alt, italic = true })
	hl("Debug", { fg = colors.error })
	hl("Underlined", { underline = true })
	hl("Ignore", { fg = colors.comment })
	hl("Error", { fg = colors.error })

	-- Apply plugin-specific highlights based on config
	if config.plugins.treesitter then
		require("reverie.plugins.treesitter").apply(colors, config)
	end

	if config.plugins.lsp then
		require("reverie.plugins.lsp").apply(colors, config)
	end

	if config.plugins.telescope then
		require("reverie.plugins.telescope").apply(colors, config)
	end

	if config.plugins.nvimtree then
		require("reverie.plugins.nvimtree").apply(colors, config)
	end

	if config.plugins.whichkey then
		require("reverie.plugins.whichkey").apply(colors, config)
	end

	if config.plugins.gitsigns then
		require("reverie.plugins.gitsigns").apply(colors, config)
	end

	if config.plugins.indent_blankline then
		require("reverie.plugins.indent_blankline").apply(colors, config)
	end

	if config.plugins.markdown then
		require("reverie.plugins.markdown").apply(colors, config)
	end

	if config.plugins.hlchunk then
		require("reverie.plugins.hlchunk").apply(colors, config)
	end

	-- Apply terminal colors if not disabled
	if not config.disable.terminal_colors then
		vim.g.terminal_color_0 = colors.terminal_black
		vim.g.terminal_color_1 = colors.terminal_red
		vim.g.terminal_color_2 = colors.terminal_green
		vim.g.terminal_color_3 = colors.terminal_yellow
		vim.g.terminal_color_4 = colors.terminal_blue
		vim.g.terminal_color_5 = colors.terminal_magenta
		vim.g.terminal_color_6 = colors.terminal_cyan
		vim.g.terminal_color_7 = colors.terminal_white
		vim.g.terminal_color_8 = colors.terminal_bright_black
		vim.g.terminal_color_9 = colors.terminal_bright_red
		vim.g.terminal_color_10 = colors.terminal_bright_green
		vim.g.terminal_color_11 = colors.terminal_bright_yellow
		vim.g.terminal_color_12 = colors.terminal_bright_blue
		vim.g.terminal_color_13 = colors.terminal_bright_magenta
		vim.g.terminal_color_14 = colors.terminal_bright_cyan
		vim.g.terminal_color_15 = colors.terminal_bright_white
	end

	-- Apply user-defined highlight overrides
	for group, opts in pairs(config.highlights or {}) do
		hl(group, opts)
	end
end

return M