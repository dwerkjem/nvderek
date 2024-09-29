return {
  "R-nvim/R.nvim",
  config = function()
    -- Create a table with the options to be passed to setup()
    local opts = {
      hook = {
        on_filetype = function()
          local keymap_opts = { noremap = true, silent = true }
          vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine", keymap_opts)
          vim.keymap.set("v", "<Enter>", "<Plug>RSendSelection", keymap_opts)
        end,
      },
      R_args = { "--quiet", "--no-save" },
      min_editor_width = 72,
      rconsole_width = 78,
      disable_cmds = {
        "RClearConsole",
        "RCustomStart",
        "RSPlot",
        "RSaveClose",
      },
    }

    -- Check if the environment variable "R_AUTO_START" exists.
    -- If using fish shell, you could put in your config.fish:
    -- alias r "R_AUTO_START=true nvim"
    if vim.env.R_AUTO_START == "true" then
      opts.auto_start = true -- Changed to boolean
      opts.objbr_auto_start = true
    end

    require("r").setup(opts)
  end,
  lazy = false,
}
