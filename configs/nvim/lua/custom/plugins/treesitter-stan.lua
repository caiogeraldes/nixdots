return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.parsers').get_parser_configs().stan = {
      install_info = {
        url = '~/proj/tree-sitter-stan/', -- local path or git repo
        files = { 'src/parser.c' },
        branch = 'main',
      },
    }
  end,
}
