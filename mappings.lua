---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>h"] = { "<cmd> Nvdash <CR>", "Open Nvdash" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>o"] = {
      function()
        if vim.bo.filetype == "NvimTree" then
          vim.api.nvim_input "<C-w>l"
        else
          vim.cmd "NvimTreeFocus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },
    ["<leader>q"] = {
      function()
        vim.lsp.buf.format()
        vim.cmd "wqa"
      end,
      "Save and quit",
    },
    -- ["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" },
    ["<leader>w"] = {
      function()
        vim.lsp.buf.format()
        vim.cmd "w"
      end,
      "Save",
    },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    -- -- cycle through buffers
    -- ["]b"] = {
    --   function()
    --     require("nvchad_ui.tabufline").tabuflineNext()
    --   end,
    --   "Goto next buffer",
    -- },
    --
    -- ["[b"] = {
    --   function()
    --     require("nvchad_ui.tabufline").tabuflinePrev()
    --   end,
    --   "Goto prev buffer",
    -- },
    ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<CR>", desc = "Search document symbols" },
    ["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", desc = "Show document diagnostics" },
    -- map("n", m.workspace_symbols, ":Telescope lsp_dynamic_workspace_symbols <CR>"),
    -- map("n", m.buf_diagnostics, ":Telescope diagnostics bufnr=0 <CR>"),
    -- map("n", m.workspace_diagnostics, ":Telescope diagnostics <CR>"),
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["]b"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["[b"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

-- more keybinds!

return M
