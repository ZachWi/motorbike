# motorbike

- a really basic harpoon clone, but for directories this time

Usage (packer):
```lua
    use {
        "ZachWi/motorbike",
        config = function()
            local motorbike = require("motorbike")
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

    vim.keymap.set("n", "<leader>sd", function() motorbike.swap() end)
    vim.keymap.set("n", "<leader>sm", function() motorbike.set_directories(
                "/desired/file/path/1/",
                "/desired/file/path/2/"
                ) end)
```
Then, to swap between folders, run
```
<leader>sd
```
Now your pwd in neovim is the swapped folder (I often open telescope).
You can also reconfig the paths for this nvim instance:
```
<leader>sm
```
