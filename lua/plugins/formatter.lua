local M = {}
local temp = "/tmp"

local function remove_whitespace()
    return {
        { cmd = { "sed -i 's/[ \t]*$//'"} },
    }
end

local function prettier(params)
    return {
        {
            cmd = {
                function(file)
                    local config = vim.loop.os_homedir() .. "/.config/nvim/.prettierrc"
                    if params ~= nil then
                        return string.format(
                            'prettier --config %s --tab-width %s -w "%s" %s',
                            config, 
                            vim.bo.shiftwidth,
                            file,
                            params
                        )
                    end
                    return string.format('prettier --config %s --tab-width %s -w "%s"', config, vim.bo.shiftwidth, file)
                end,
            },
            tempfile_dir = temp,
        },
    }
end


function M.config()
    vim.g.format_debug = true

    require("format").setup({
        ["*"] = remove_whitespace(),
        javascript = prettier(),
        typescript = prettier(),
        html = prettier("--print-width 1000"),
        css = prettier(),
        sh = shfmt(),
        lua = stylua(),
        markdown = prettier(),
        json = prettier(),
        python = black(),
        scss = prettier(),
        yaml = prettier(),
    })
end
