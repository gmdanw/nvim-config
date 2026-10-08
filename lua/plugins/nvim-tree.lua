return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Optional but recommended for nice file icons
    },
    config = function()
      -- 1. DISABLE NETRW (Must be done before nvim-tree setups to prevent conflicts)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true -- Highly recommended for correct icon colors

      -- 2. SETUP CONFIGURATION
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 35,          -- Width of the side panel
          side = "left",       -- Left side of the editor
          number = false,      -- Don't show line numbers in the tree panel
          relativenumber = false,
        },
        renderer = {
          group_empty = true,  -- Compact folders that don't contain files
          highlight_git = true, -- Color files based on their git status
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,    -- Set to true if you want to hide hidden files by default (.git, .env, etc.)
          custom = { "^\\.git$" }, -- Completely filter out the raw .git directory
        },
        git = {
          enable = true,       -- Enable git integration icons
          ignore = false,      -- Show files even if they are in your .gitignore
        },
      })

      vim.keymap.set("n", "<leader>e", function()
		local api = require("nvim-tree.api")
		if api.tree.is_visible then
			if vim.bo.filetype == "NvimTree" then
				api.tree.close()
			else
				api.tree.focus()
			end
		else
			api.tree.open()
		end
	end, { silent = true, desc = "Toggle File Explorer" }) 

      --  [ Navigation & Opening ]
      --  <CR> (Enter) / o  -> Open file in main window OR toggle folder expand/collapse
      --  v                 -> Open the file in a vertical split
      --  h                 -> Open the file in a horizontal split
      --
      --  [ File Manipulation ]
      --  a                 -> Create a new file or directory (add a trailing '/' to create a folder)
      --  d                 -> Delete file/folder (will prompt you to confirm)
      --  r                 -> Rename file/folder
      --  x                 -> Cut file/folder to internal clipboard
      --  c                 -> Copy file/folder to internal clipboard
      --  p                 -> Paste copied/cut file into the current directory
      --
      --  [ Toggles & Views ]
      --  I                 -> Toggle visibility of hidden files (dotfiles) and gitignored paths
      --  H                 -> Toggle visibility of hidden dotfiles specifically
      --  R                 -> Refresh the current tree view
      --  q                 -> Close the explorer panel
	end,
  },
}

