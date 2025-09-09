local M = {}
_G.swap_paths = _G.swap_paths or { "", "" }

local function normalize(path)
    return vim.fn.fnamemodify(path, ":p"):gsub("/$", "")
end

function M.set_directories(dir1, dir2)
    _G.swap_paths[1] = vim.fn.fnamemodify(dir1, ":p")
    _G.swap_paths[2] = vim.fn.fnamemodify(dir2, ":p")
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

M.setup = function()
end
return M

