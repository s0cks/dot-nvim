local get_gh_token = function()
  return vim.fn.expand('$GITHUB_TOKEN')
end

return {
  module = 'blink-cmp-git',
  name = 'Git',
  enabled = function()
    return vim.tbl_contains({ 'octo', 'gitcommit', 'markdown' }, vim.bo.filetype)
  end,
  opts = {
    git_centers = {
      github = {
        issue = {
          get_token = get_gh_token,
        },
        pull_request = {
          get_token = get_gh_token,
        },
        mention = {
          get_token = get_gh_token,
          get_documentation = function(item)
            local default = require('blink-cmp-git.default.github').mention.get_documentation(item)
            default.get_token = get_gh_token
            return default
          end,
        },
      },
    },
  },
}
