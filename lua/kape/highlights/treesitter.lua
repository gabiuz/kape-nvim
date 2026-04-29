-- lua/kape/highlights/treesitter.lua
-- Layer 2: Treesitter highlight groups
-- Requires Neovim 0.8+ with nvim-treesitter installed

local M = function(p)
	local highlights = {

		-- Variables
		["@variable"] = { fg = p.yellow },
		["@variable.builtin"] = { fg = p.yellow, italic = true },
		["@variable.parameter"] = { fg = p.yellow },
		["@variable.member"] = { fg = p.yellow },

		-- Constants
		["@constant"] = { fg = p.yellow },
		["@constant.builtin"] = { fg = p.yellow, bold = true },
		["@constant.macro"] = { fg = p.violet },

		-- Strings
		["@string"] = { fg = p.green },
		["@string.escape"] = { fg = p.bright_green },
		["@string.special"] = { fg = p.bright_green },
		["@string.regexp"] = { fg = p.bright_green },
		["@string.special.url"] = { fg = p.blue, underline = true },

		-- Numbers & Booleans
		["@number"] = { fg = p.yellow },
		["@number.float"] = { fg = p.yellow },
		["@boolean"] = { fg = p.yellow, bold = true },

		-- Functions
		["@function"] = { fg = p.green },
		["@function.builtin"] = { fg = p.green, italic = true },
		["@function.call"] = { fg = p.green },
		["@function.macro"] = { fg = p.violet },
		["@function.method"] = { fg = p.green },
		["@function.method.call"] = { fg = p.green },
		["@constructor"] = { fg = p.bright_cyan },

		-- Keywords
		["@keyword"] = { fg = p.red, bold = true },
		["@keyword.function"] = { fg = p.red, bold = true },
		["@keyword.operator"] = { fg = p.red },
		["@keyword.return"] = { fg = p.red, italic = true },
		["@keyword.import"] = { fg = p.violet },
		["@keyword.conditional"] = { fg = p.red },
		["@keyword.conditional.ternary"] = { fg = p.red },
		["@keyword.repeat"] = { fg = p.red },
		["@keyword.exception"] = { fg = p.red },
		["@keyword.modifier"] = { fg = p.red },

		-- Types
		["@type"] = { fg = p.bright_cyan },
		["@type.builtin"] = { fg = p.bright_cyan, italic = true },
		["@type.definition"] = { fg = p.bright_cyan },
		["@type.qualifier"] = { fg = p.red },
		["@attribute"] = { fg = p.orange },
		["@property"] = { fg = p.yellow },

		-- Operators & Punctuation
		["@operator"] = { fg = p.foreground },
		["@punctuation.bracket"] = { fg = p.foreground },
		["@punctuation.delimiter"] = { fg = p.foreground },
		["@punctuation.special"] = { fg = p.foreground },

		-- Comments
		["@comment"] = { fg = p.third_text, italic = true },
		["@comment.todo"] = { fg = p.background, bg = p.yellow, bold = true },
		["@comment.error"] = { fg = p.background, bg = p.red, bold = true },
		["@comment.warning"] = { fg = p.background, bg = p.yellow, bold = true },
		["@comment.note"] = { fg = p.background, bg = p.blue, bold = true },

		-- Markup (markdown, rst, etc.)
		["@markup.heading"] = { fg = p.foreground, bold = true },
		["@markup.heading.1"] = { fg = p.yellow, bold = true },
		["@markup.heading.2"] = { fg = p.green, bold = true },
		["@markup.heading.3"] = { fg = p.blue, bold = true },
		["@markup.heading.4"] = { fg = p.violet, bold = true },
		["@markup.heading.5"] = { fg = p.bright_cyan, bold = true },
		["@markup.heading.6"] = { fg = p.second_text, bold = true },
		["@markup.raw"] = { fg = p.green },
		["@markup.raw.block"] = { fg = p.green },
		["@markup.link"] = { fg = p.blue, underline = true },
		["@markup.link.label"] = { fg = p.blue },
		["@markup.link.url"] = { fg = p.bright_cyan, underline = true },
		["@markup.italic"] = { italic = true },
		["@markup.strong"] = { bold = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.list"] = { fg = p.yellow },
		["@markup.list.checked"] = { fg = p.green },
		["@markup.list.unchecked"] = { fg = p.third_text },
		["@markup.quote"] = { fg = p.third_text, italic = true },

		-- Tags (HTML, JSX, etc.)
		["@tag"] = { fg = p.red },
		["@tag.attribute"] = { fg = p.orange },
		["@tag.delimiter"] = { fg = p.foreground },

		-- Misc
		["@none"] = {},
		["@conceal"] = { fg = p.third_text },
		["@diff.plus"] = { fg = p.green },
		["@diff.minus"] = { fg = p.red },
		["@diff.delta"] = { fg = p.yellow },
		["@module"] = { fg = p.yellow },
		["@label"] = { fg = p.orange },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
