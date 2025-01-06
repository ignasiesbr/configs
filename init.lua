-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- VSCode-specific configuration
if vim.g.vscode then
  -- Set leader key to space
  vim.g.mapleader = " "

  -- VSCode extension
  local function vscode_map(mode, lhs, rhs, opts)
    local options = {
      noremap = true,
      silent = true,
      callback = function()
        -- Handle the black hole register operation through VSCode
        vim.fn.VSCodeCall("editor.action.clipboardCopyAction") -- Optional: copy before delete
        vim.cmd(string.format("normal! %s", rhs))
      end,
    }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  -- Black hole delete operations
  vim.keymap.set("n", "d", '"_d', { noremap = true })
  vim.keymap.set("v", "d", '"_d', { noremap = true })
  vim.keymap.set("n", "D", '"_D', { noremap = true })
  vim.keymap.set("n", "dd", '"_dd', { noremap = true })

  -- Clipboard delete operations with leader
  vim.keymap.set("n", "<leader>d", "d", { noremap = true })
  vim.keymap.set("v", "<leader>d", "d", { noremap = true })
  vim.keymap.set("n", "<leader>D", "D", { noremap = true })
  vim.keymap.set("n", "<leader>dd", "dd", { noremap = true })

  -- Black hole change operations
  vim.keymap.set("n", "c", '"_c', { noremap = true })
  vim.keymap.set("v", "c", '"_c', { noremap = true })
  vim.keymap.set("n", "C", '"_C', { noremap = true })
  vim.keymap.set("n", "cc", '"_cc', { noremap = true })

  -- Black hole single character operations
  vim.keymap.set("n", "x", '"_x', { noremap = true })
  vim.keymap.set("v", "x", '"_x', { noremap = true })
  vim.keymap.set("n", "X", '"_X', { noremap = true })
  vim.keymap.set("v", "X", '"_X', { noremap = true })

  -- Black hole text object operations
  vim.keymap.set("n", "diw", '"_diw', { noremap = true })
  vim.keymap.set("n", "ciw", '"_ciw', { noremap = true })
  vim.keymap.set("n", "daw", '"_daw', { noremap = true })
  vim.keymap.set("n", "caw", '"_caw', { noremap = true })
  vim.keymap.set("n", "dip", '"_dip', { noremap = true })
  vim.keymap.set("n", "cip", '"_cip', { noremap = true })

  -- Clipboard text object operations with leader
  vim.keymap.set("n", "<leader>diw", "diw", { noremap = true })
  vim.keymap.set("n", "<leader>daw", "daw", { noremap = true })
  vim.keymap.set("n", "<leader>dip", "dip", { noremap = true })

  -- Keep your existing VSCode-specific keymaps
  vim.api.nvim_set_keymap(
    "n",
    "gr",
    "<cmd>lua vim.fn.VSCodeCall('editor.action.referenceSearch.trigger')<CR>",
    { noremap = true, silent = true }
  )
end
