-- In your init.lua or plugins.lua

return {
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        filetype = {
          java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt",
          },
          python = "python3 -u",
          typescript = "deno run",
          rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt",
          },
        },
        -- Optional: Additional configurations
        mode = "float", -- Can be 'float', 'terminal', or 'toggleterm'
        startinsert = true,
        focus = false,
        term = {
          -- Terminal options if using 'terminal' mode
          -- direction = "horizontal",
          -- size = 10,
        },
      })
    end,
  },
}
