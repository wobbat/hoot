local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.crystal = {
    install_info = {
        url = "/home/wobbat/pkgs/tree-sitter-crystal/",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
    },
    filetype = "cr",
}
