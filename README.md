# motorbike

- a really basic harpoon clone, but for folders this time

Usage (packer):
```lua
    use {
        "ZachWi/motorbike",
        config = function()
            local motorbike = require("motorbike")
            motorbike.setup({})  -- optional
            motorbike.set_directories(
                "/desired/file/path/1/",
                "/desired/file/path/2/"
            )
        end
    }
```
Now make motorbike.lua in your .config/nvim/after/plugin directory
```lua
local motorbike = require("motorbike")

-- Swap directories
    vim.keymap.set("n", "<leader>sd", function()
            motorbike.swap()
            end, { desc = "Swap motorbike directories" })

-- Set directories manually (example)
    vim.keymap.set("n", "<leader>sm", function()
            motorbike.set_directories(
                "/Users/zacharywillis/motorbike/",
                "/Users/zacharywillis/.config/nvim/"
                )
            end, { desc = "Set motorbike directories" })
```
Then, to swap between folders, run
```
:lua require("motorbike").swap()
```
Now your pwd in neovim is the swapped folder

