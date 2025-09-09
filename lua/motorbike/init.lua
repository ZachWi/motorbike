local M = {}
_G.swap_paths = _G.swap_paths or { "", "" }

-- Setup function with optional netrw auto-open
M.setup = function(opts)
    opts = opts or {}
    M.open_explorer = opts.open_explorer or false
end

-- Set the two directories to swap between
function M.set_directories(dir1, dir2)
    _G.swap_paths[1] = dir1
    _G.swap_paths[2] = dir2
    print("Directories set: " .. dir1 .. " and " .. dir2)
end

-- Swap the current working directory
function M.swap()
    local cwd = vim.fn.getcwd()
    local new_dir = nil

    if cwd == _G.swap_paths[1] then
        new_dir = _G.swap_paths[2]
    elseif cwd == _G.swap_paths[2] then
        new_dir = _G.swap_paths[1]
    else
        print("Current directory is not in swap paths!")
        return
    end

    -- Change working directory
    vim.cmd("cd " .. new_dir)
    print("Swapped to " .. new_dir)

    -- Refresh netrw if desired
    if M.open_explorer then
        -- Close any existing netrw buffers
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_get_option(buf, "filetype") == "netrw" then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end

        -- Open netrw in new directory
        vim.cmd("edit " .. new_dir)
        vim.cmd("Ex")
    end
end

return M

