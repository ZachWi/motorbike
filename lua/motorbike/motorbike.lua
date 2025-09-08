local M = {}
_G.swap_paths = _G.swap_paths or { "", "" }

function M.swap()
    local cwd = vim.fn.getcwd()
    if cwd == _G.swap_paths[1] then
        vim.cmd("cd " .. _G.swap_paths[2])
        print("swapped 2")
    elseif cwd == _G.swap_paths[2] then
        vim.cmd("cd " .. _G.swap_paths[1])
        print("swapped 1")
    end
end
M.setup = function()
end

function M.set_directories(dir1, dir2)
  _G.swap_paths[1] = dir1
  _G.swap_paths[2] = dir2
  print("Directories set: " .. dir1 .. " and " .. dir2)
end

return M
