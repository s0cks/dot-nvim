local M = {}

local basic_components = require('plugins.heirline.components.basic')
M.constant_provider = basic_components.constant_provider
M.Space = basic_components.Space
M.Align = basic_components.Align

M.Mode = require('plugins.heirline.components.mode')
M.Git = require('plugins.heirline.components.git')
M.Diagnostics = require('plugins.heirline.components.diagnostics')
M.CurrentFile = require('plugins.heirline.components.current_file')
M.Cursor = require('plugins.heirline.components.cursor')
M.ExecutorStatus = require('plugins.heirline.components.executor')

return M
