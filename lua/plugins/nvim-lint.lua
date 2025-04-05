-- General purpose linters
return {
  -- https://github.com/mfussenegger/nvim-lint
  'mfussenegger/nvim-lint',
  event = 'BufWritePost',
  config = function ( )
    -- Define a table of linters for each filetype (not extension).
    require('lint').linters_by_ft = {
      python = {
        -- Uncomment whichever linters you prefer
        'flake8',
        'mypy',
        'pylint',
      },
      elixir = { 'credo' }
    }

    -- Automatically run linters after saving.  Use "InsertLeave" for more
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      -- Only run linters for the following extensions.
      pattern = { "*.py" },
      callback = function ( )
        require("lint").try_lint()
      end,
    })
  end
}
