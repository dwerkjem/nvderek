return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      window = {
        position = "bottom",
        -- You can add other window-related options here, such as:
        -- border = "single",          -- Change window border
        -- margin = { 1, 0, 1, 0 },   -- Adjust window margins
        -- padding = { 2, 2, 2, 2 },  -- Adjust window padding
      },
    })
  end,
}
