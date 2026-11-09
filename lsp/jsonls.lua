return {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas({
        extra = {},
      }),
      validate = { enable = true },
    },
  },
}
