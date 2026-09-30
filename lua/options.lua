local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "

o.clipboard = "unnamedplus"
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
o.cursorline = true
o.cursorlineopt = "number"

o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true
o.relativenumber = true

g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1
