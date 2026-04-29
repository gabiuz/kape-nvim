-- lua/kape/highlights/treesitter.lua
-- Legacy TS* groups + modern @-capture links (nvim >= 0.8).

local M = function(p, opts)
	local hl = vim.api.nvim_set_hl

	-- Legacy TSxxx groups (nvim-treesitter < 0.8)
	-- Most simply link to syntax or semantic groups.
	hl(0, "TSStrong", { bold = true })
	hl(0, "TSEmphasis", { italic = true })
	hl(0, "TSUnderline", { underline = true })
	hl(0, "TSNote", { fg = p.bg0, bg = p.green, bold = true })
	hl(0, "TSWarning", { fg = p.bg0, bg = p.yellow, bold = true })
	hl(0, "TSDanger", { fg = p.bg0, bg = p.red, bold = true })
	hl(0, "TSURI", { fg = p.blue, underline = true })

	local legacy = {
		TSAnnotation = "KapeViolet",
		TSAttribute = "KapeOrange", -- jsx-like attribute
		TSBoolean = "KapeYellow", -- number/value
		TSCharacter = "KapeYellow", -- individual char literal
		TSCharacterSpecial = "SpecialChar",
		TSComment = "Comment",
		TSConditional = "KapeRed", -- keyword
		TSConstBuiltin = "KapeYellowItalic", -- builtin constants → variable
		TSConstMacro = "KapeVioletItalic",
		TSConstant = "KapeYellow", -- constants → variable-like
		TSConstructor = "KapeOrange", -- function-like
		TSDebug = "Debug",
		TSDefine = "Define",
		TSEnvironment = "Macro",
		TSEnvironmentName = "Type",
		TSError = "Error",
		TSException = "KapeViolet", -- keyword
		TSField = "KapeYellow", -- prop/field → variable
		TSFloat = "KapeYellow", -- number
		TSFuncBuiltin = "KapeGreen", -- function
		TSFuncMacro = "KapeGreen", -- function
		TSFunction = "KapeGreen", -- function
		TSFunctionCall = "KapeGreen", -- function
		TSInclude = "KapeViolet", -- import
		TSKeyword = "KapeRed", -- keyword
		TSKeywordFunction = "KapeRed", -- keyword
		TSKeywordOperator = "KapeFg", -- punctuation-like
		TSKeywordReturn = "KapeRed", -- keyword
		TSLabel = "KapeOrange",
		TSLiteral = "String",
		TSMath = "KapeYellow", -- math values
		TSMethod = "KapeOrange", -- function
		TSMethodCall = "KapeOrange", -- function
		TSNamespace = "KapeVioletItalic", -- module/namespace → import-like
		TSNone = "KapeFg",
		TSNumber = "KapeYellow", -- number
		TSOperator = "KapeFg", -- punctuation
		TSParameter = "KapeYellow", -- variable
		TSParameterReference = "KapeYellow", -- variable
		TSPreProc = "PreProc",
		TSProperty = "KapeYellow", -- prop → variable
		TSPunctBracket = "KapeFg",
		TSPunctDelimiter = "KapeFg", -- punctuation
		TSPunctSpecial = "KapeFg", -- punctuation
		TSRepeat = "KapeViolet", -- keyword
		TSStorageClass = "KapeCyan", -- type-like
		TSStorageClassLifetime = "KapeCyan", -- type-like
		TSStrike = "KapeGrey",
		TSString = "KapeGreen", -- string
		TSStringEscape = "KapeGreen", -- string escape
		TSStringRegex = "KapeGreen", -- string
		TSStringSpecial = "SpecialChar",
		TSSymbol = "KapeYellow", -- symbol/atom → variable-like
		TSTag = "KapeViolet", -- html/jsx tag name → keyword-like
		TSTagAttribute = "KapeOrange", -- jsx attribute
		TSTagDelimiter = "KapeFg", -- punctuation
		TSText = "KapeOrange", -- prose text (string-like)
		TSTextReference = "Constant",
		TSTitle = "Title",
		TSTodo = "Todo",
		TSType = "KapeCyanItalic", -- type
		TSTypeBuiltin = "KapeCyanItalic", -- type
		TSTypeDefinition = "KapeCyanItalic", -- type
		TSTypeQualifier = "KapeCyan", -- type modifier
		TSVariable = "KapeYellow", -- variable
		TSVariableBuiltin = "KapeYellowItalic", -- builtin variable (self, this…)
		TSModuleInfoGood = "KapeGreen",
		TSModuleInfoBad = "KapeRed",
		TSImportBlock = "KapeYellow",
		TSIdentifierName = "KapeYellow",
	}
	for group, target in pairs(legacy) do
		hl(0, group, { link = target })
	end

	-- Modern @-capture groups (nvim >= 0.8)
	if vim.fn.has("nvim-0.8") == 1 then
		local captures = {
			["@annotation"] = "TSAnnotation",
			["@attribute"] = "TSAttribute",
			["@boolean"] = "TSBoolean",
			["@character"] = "TSCharacter",
			["@character.special"] = "TSCharacterSpecial",
			["@comment"] = "TSComment",
			["@comment.error"] = "TSDanger",
			["@comment.note"] = "TSNote",
			["@comment.todo"] = "TSTodo",
			["@comment.warning"] = "TSWarning",
			["@conceal"] = "KapeGrey",
			["@conditional"] = "TSConditional",
			["@constant"] = "TSConstant",
			["@constant.builtin"] = "TSConstBuiltin",
			["@constant.macro"] = "TSConstMacro",
			["@constructor"] = "TSConstructor",
			["@debug"] = "TSDebug",
			["@define"] = "TSDefine",
			["@diff.delta"] = "diffChanged",
			["@diff.minus"] = "diffRemoved",
			["@diff.plus"] = "diffAdded",
			["@exception"] = "TSException",
			["@field"] = "TSField",
			["@float"] = "TSFloat",
			["@function"] = "TSFunction",
			["@function.builtin"] = "TSFuncBuiltin",
			["@function.call"] = "TSFunctionCall",
			["@function.macro"] = "TSFuncMacro",
			["@function.method"] = "TSMethod",
			["@function.method.call"] = "TSMethodCall",
			["@include"] = "TSInclude",
			["@keyword"] = "TSKeyword",
			["@keyword.conditional"] = "TSConditional",
			["@keyword.debug"] = "TSDebug",
			["@keyword.directive"] = "TSPreProc",
			["@keyword.directive.define"] = "TSDefine",
			["@keyword.exception"] = "TSException",
			["@keyword.function"] = "TSKeywordFunction",
			["@keyword.import"] = "TSInclude",
			["@keyword.operator"] = "TSKeywordOperator",
			["@keyword.repeat"] = "TSRepeat",
			["@keyword.return"] = "TSKeywordReturn",
			["@keyword.storage"] = "TSStorageClass",
			["@label"] = "TSLabel",
			["@markup.emphasis"] = "TSEmphasis",
			["@markup.environment"] = "TSEnvironment",
			["@markup.environment.name"] = "TSEnvironmentName",
			["@markup.heading"] = "TSTitle",
			["@markup.link"] = "TSTextReference",
			["@markup.link.label"] = "TSStringSpecial",
			["@markup.link.url"] = "TSURI",
			["@markup.list"] = "TSPunctSpecial",
			["@markup.list.checked"] = "KapeGreen",
			["@markup.list.unchecked"] = "Ignore",
			["@markup.math"] = "TSMath",
			["@markup.note"] = "TSNote",
			["@markup.quote"] = "KapeGrey",
			["@markup.raw"] = "TSLiteral",
			["@markup.strike"] = "TSStrike",
			["@markup.strong"] = "TSStrong",
			["@markup.underline"] = "TSUnderline",
			["@module"] = "TSNamespace",
			["@namespace"] = "TSNamespace",
			["@none"] = "TSNone",
			["@number"] = "TSNumber",
			["@number.float"] = "TSFloat",
			["@operator"] = "TSOperator",
			["@parameter"] = "TSParameter",
			["@parameter.reference"] = "TSParameterReference",
			["@preproc"] = "TSPreProc",
			["@property"] = "TSProperty",
			["@punctuation.bracket"] = "TSPunctBracket",
			["@punctuation.delimiter"] = "TSPunctDelimiter",
			["@punctuation.special"] = "TSPunctSpecial",
			["@repeat"] = "TSRepeat",
			["@storageclass"] = "TSStorageClass",
			["@storageclass.lifetime"] = "TSStorageClassLifetime",
			["@string"] = "TSString",
			["@string.escape"] = "TSStringEscape",
			["@string.regex"] = "TSStringRegex",
			["@string.regexp"] = "TSStringRegex",
			["@string.special"] = "TSStringSpecial",
			["@string.special.symbol"] = "TSSymbol",
			["@string.special.uri"] = "TSURI",
			["@symbol"] = "TSSymbol",
			["@tag"] = "TSTag",
			["@tag.attribute"] = "TSTagAttribute",
			["@tag.delimiter"] = "TSTagDelimiter",
			["@text"] = "TSText",
			["@text.danger"] = "TSDanger",
			["@text.diff.add"] = "diffAdded",
			["@text.diff.delete"] = "diffRemoved",
			["@text.emphasis"] = "TSEmphasis",
			["@text.environment"] = "TSEnvironment",
			["@text.environment.name"] = "TSEnvironmentName",
			["@text.literal"] = "TSLiteral",
			["@text.math"] = "TSMath",
			["@text.note"] = "TSNote",
			["@text.reference"] = "TSTextReference",
			["@text.strike"] = "TSStrike",
			["@text.strong"] = "TSStrong",
			["@text.title"] = "TSTitle",
			["@text.todo"] = "TSTodo",
			["@text.todo.checked"] = "KapeGreen",
			["@text.todo.unchecked"] = "Ignore",
			["@text.underline"] = "TSUnderline",
			["@text.uri"] = "TSURI",
			["@text.warning"] = "TSWarning",
			["@todo"] = "TSTodo",
			["@type"] = "TSType",
			["@type.builtin"] = "TSTypeBuiltin",
			["@type.definition"] = "TSTypeDefinition",
			["@type.qualifier"] = "TSTypeQualifier",
			["@variable"] = "TSVariable",
			["@variable.builtin"] = "TSVariableBuiltin",
			["@variable.member"] = "TSField",
			["@variable.parameter"] = "TSParameter",
			["@error"] = "TSError",
		}
		for capture, target in pairs(captures) do
			hl(0, capture, { link = target })
		end
	end

	-- LSP semantic tokens (nvim >= 0.9)
	if vim.fn.has("nvim-0.9") == 1 then
		local lsp_tokens = {
			["@lsp.type.class"] = "TSType",
			["@lsp.type.comment"] = "TSComment",
			["@lsp.type.decorator"] = "TSFunction",
			["@lsp.type.enum"] = "TSType",
			["@lsp.type.enumMember"] = "TSProperty",
			["@lsp.type.events"] = "TSLabel",
			["@lsp.type.function"] = "TSFunction",
			["@lsp.type.interface"] = "TSType",
			["@lsp.type.keyword"] = "TSKeyword",
			["@lsp.type.macro"] = "TSConstMacro",
			["@lsp.type.method"] = "TSMethod",
			["@lsp.type.modifier"] = "TSTypeQualifier",
			["@lsp.type.namespace"] = "TSNamespace",
			["@lsp.type.number"] = "TSNumber",
			["@lsp.type.operator"] = "TSOperator",
			["@lsp.type.parameter"] = "TSParameter",
			["@lsp.type.property"] = "TSProperty",
			["@lsp.type.regexp"] = "TSStringRegex",
			["@lsp.type.string"] = "TSString",
			["@lsp.type.struct"] = "TSType",
			["@lsp.type.type"] = "TSType",
			["@lsp.type.typeParameter"] = "TSTypeDefinition",
			["@lsp.type.variable"] = "TSVariable",
		}
		for token, target in pairs(lsp_tokens) do
			hl(0, token, { link = target })
		end
	end
end

return M
