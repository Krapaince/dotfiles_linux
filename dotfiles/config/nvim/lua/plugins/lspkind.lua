return function()
    require('lspkind').init({
        with_text = true,
        preset = 'codicons',
        symbol_map = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "ﴲ",
            Variable = "[]",
            Class = "",
            Interface = "ﰮ",
            Module = "",
            Property = "襁",
            Unit = "",
            Value = "",
            Enum = "練",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "ﲀ",
            Struct = "ﳤ",
            Event = "",
            Operator = "",
            TypeParameter = ""
        },
    })
end
