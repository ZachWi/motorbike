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
Then, to swap between folders, run
```
:lua require("motorbike").swap()
```
Now your pwd in neovim is the swapped folder

