local M = {}
_G.swap_paths = _G.swap_paths or { "", "" }

local function normalize(path)
    return vim.fn.fnamemodify(path, ":p"):gsub("/$", "")
end

function M.set_directories(dir1, dir2)
    _G.swap_paths[1] = normalize(dir1)
    _G.swap_paths[2] = normalize(dir2)
end

function M.swap()
    local cwd = normalize(vim.fn.getcwd())
    local dir1 = _G.swap_paths[1]
    local dir2 = _G.swap_paths[2]

    print("cwd: " .. cwd)
    print("dir1: " .. dir1)
    print("dir2: " .. dir2)

    if cwd == dir1 then
        vim.cmd("cd " .. dir2)
        print("Swapped to: " .. vim.fn.getcwd())
    elseif cwd == dir2 then
        vim.cmd("cd " .. dir1)
        print("Swapped to: " .. vim.fn.getcwd())
    else
        local input = vim.fn.input("Enter 1 or 2 to choose directory: ")
        local choice = tonumber(input)
        if choice and _G.swap_paths[choice] then
            vim.cmd("cd " .. _G.swap_paths[choice])
            print("Swapped to: " .. vim.fn.getcwd())
        else
            print("Invalid choice: " .. input)
        end
    end
end

return M
