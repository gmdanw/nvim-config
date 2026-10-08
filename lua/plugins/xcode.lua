return {
  "fraeso/xcodedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("xcodedark").setup({
      transparent = true, -- or false if you prefer solid background

      integrations = {
        telescope = true,
        nvim_tree = true,
        gitsigns = true,
        bufferline = true,
        incline = true,
        lazygit = true,
        which_key = true,
        notify = true,
        snacks = true,
        blink = true,
      },

      terminal_colors = true,
    })
    vim.cmd.colorscheme("xcodedark")
  end,
}
