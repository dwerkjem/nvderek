return {
  "lervag/vimtex",
  lazy = false, -- We don't want to lazy load VimTeX
  -- tag = "v2.15", -- Uncomment to pin to a specific release
  init = function()
    -- Set the PDF viewer method (optional)
    vim.g.vimtex_view_method = "zathura"

    -- Enable vimtex and set the compiler to latexmk
    vim.g.vimtex_compiler_method = "latexmk"

    -- Configure latexmk to use the build directory
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build", -- Redirect build files to 'build/'
      aux_dir = "build", -- Redirect auxiliary files to 'build/'
      out_dir = "build", -- Redirect output files to 'build/'
      callback = 1, -- Enable callback for forward and inverse search
      continuous = 1, -- Enable continuous compilation
      executable = "latexmk", -- Specify the compiler
      options = {
        "-pdf", -- Generate PDF
        "-interaction=nonstopmode", -- Non-stop mode
        "-synctex=1", -- Enable SyncTeX
        "-outdir=build", -- Specify output directory
        "-auxdir=build", -- Specify auxiliary directory
        "-output-directory=build", -- Alternative option for some latexmk versions
      },
    }

    -- Optional: Set up syntax highlighting and other vimtex options here
  end,
}
