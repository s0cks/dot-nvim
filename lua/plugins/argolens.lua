return {
  'desdic/agrolens.nvim',
  version = '*',
  event = 'VeryLazy',
  keys = {
    {
      'zu',
      function()
        require('agrolens.fzf').run({
          query = 'functions,labels',
          buffers = 'all',
          same_type = false,
        })
      end,
      'n',
      { desc = 'Find: Functions & Labels' },
    },
  },
  opts = {
    force_long_filepath = true,
    debug = false,
    same_type = false,
    include_hidden_buffers = false,
    disable_indentation = true,
    aliases = {
      yamllist = 'docker-compose,github-workflow-steps',
      work = 'cheflxchost,github-workflow-steps,pytest,ipam',
      all = 'cheflxchost,pytest,ipam,functions,labels',
    },
  },
}
