local M = {}
_G.swap_paths = _G.swap_paths or { "", "" }

local function normalize(path)
    return vim.fn.fnamemodify(path, ":p"):gsub("/$", "")
end

function M.set_directories(dir1, dir2)
    _G.swap_paths[1] = vim.fn.fnamemodify(dir1, ":p")
    _G.swap_paths[2] = vim.fn.fnamemodify(dir2, ":p")
    print("Directories set: " .. _G.swap_paths[1] .. " and " .. _G.swap_paths[2])
end

function M.swap()
    local cwd = normalize(vim.fn.getcwd())
    local dir1 = normalize(_G.swap_paths[1])
    local dir2 = normalize(_G.swap_paths[2])

    print("cwd: ", cwd)
    print("dir1:", dir1)
    print("dir2:", dir2)

    if cwd == dir1 then
        vim.cmd("cd " .. dir2)
        print("Swapped to: " .. vim.fn.getcwd())
    elseif cwd == dir2 then
        vim.cmd("cd " .. dir1)
        print("Swapped to: " .. vim.fn.getcwd())
    else
        print("Current directory not in swap paths")
    end
end

for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "filetype") == "netrw" then
        vim.api.nvim_buf_delete(buf, { force = true })
    end
end
vim.cmd("edit " .. cwd)
vim.cmd("Ex")

M.setup = function()
end
return M

