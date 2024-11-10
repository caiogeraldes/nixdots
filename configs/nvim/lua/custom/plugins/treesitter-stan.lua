return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.parsers').get_parser_configs().stan = {
      install_info = {
        url = 'https://github.com/WardBrian/tree-sitter-stan?tab=readme-ov-file', -- local path or git repo
        files = { 'src/parser.c' },
        branch = 'main',
      },
    }
  end,
}
