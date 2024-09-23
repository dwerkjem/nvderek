-- File: lua/plugins/copilot.lua

return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter", -- Load the plugin when entering insert mode
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- Options: bottom | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false, -- Keep auto_trigger disabled
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = false, -- Disable the built-in accept keymap
            accept_word = false, -- Disable the built-in accept_word keymap
            accept_line = false, -- Disable the built-in accept_line keymap
            next = false, -- Disable the built-in next keymap
            prev = false, -- Disable the built-in prev keymap
            dismiss = false, -- Disable the built-in dismiss keymap
          },
        },
        filetypes = {
          ["*"] = true,
        },
        copilot_node_command = "node", -- Ensure Node.js version > 18.x
        server_opts_overrides = {},
      })

      -- Import the copilot.suggestion module
      local copilot_suggestion = require("copilot.suggestion")

      -- Define a custom function to accept one word safely
      local function AcceptWordSafely()
        if copilot_suggestion.is_visible() then
          copilot_suggestion.accept_word()
        else
          -- Optionally, trigger a suggestion
          copilot_suggestion.next()
          copilot_suggestion.accept_word()
        end
      end

      -- Define Key Mappings for Copilot Functions
      local map = vim.keymap.set

      -- Map <C-right> in Insert Mode to the custom function
      map("i", "<C-right>", AcceptWordSafely, {
        expr = false,
        remap = false,
        desc = "Copilot: Accept One Word Safely",
      })

      -- Optional: Map other Copilot functions as needed
      -- Example: Map <C-]> to cycle to the next suggestion
      map("i", "<C-]>", copilot_suggestion.next, {
        desc = "Copilot: Next Suggestion",
      })

      -- Example: Map <C-[> to cycle to the previous suggestion
      map("i", "<C-[>", copilot_suggestion.prev, {
        desc = "Copilot: Previous Suggestion",
      })

      -- Example: Map <C-d> to dismiss the current suggestion
      map("i", "<C-d>", copilot_suggestion.dismiss, {
        desc = "Copilot: Dismiss Suggestion",
      })

      -- Example: Toggle auto-trigger with <leader>ct in Normal Mode
      map("n", "<leader>ct", copilot_suggestion.toggle_auto_trigger, {
        desc = "Copilot: Toggle Auto Trigger",
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim", -- Copilot may require plenary
    },
  },
}
