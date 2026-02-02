-- in your plugins.lua (or wherever you call require('lazy').setup)
return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = {'markdown'}, -- only load in Markdown buffers
        dependencies = {
            'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim'
        },
        opts = {
            render_modes = true,
            anti_conceal = {
                enabled = true,
                ignore = {code_background = true, sign = true},
                above = 0,
                below = 0
            },
            bullet = {

                -- Turn on / off list bullet rendering
                enabled = true,
                icons = {'*', '*', '*', '*'}
            },
            enabled = true,
            checkbox = {
                position = 'inline',
                unchecked = {
                    icon = ' ',
                    highlight = 'RenderMarkdownUnchecked',
                    scope_highlight = nil
                },
                checked = {
                    icon = ' ',
                    highlight = 'RenderMarkdownChecked',
                    scope_highlight = '@markup.strikethrough'
                },
                custom = {
                    todo = {
                        raw = '[-]',
                        rendered = ' ',
                        highlight = 'RenderMarkdownTodo',
                        scope_highlight = nil
                    }
                }
            },
            heading = {
                enabled = true,
                position = 'inline',
                icons = {'# ', '## ', '### ', '#### ', '##### ', '###### '},
                sign = false,
                width = 'full',
                left_margin = 0,
                left_pad = 0,
                right_pad = 0,
                min_width = 0,
                border = false,
                border_virtual = false,
                border_prefix = false,
                above = '▄',
                below = '▀',
                -- refer to the *group names* here, not raw hex
                backgrounds = {
                    'RenderMarkdownH1Bg', 'RenderMarkdownH2Bg',
                    'RenderMarkdownH3Bg', 'RenderMarkdownH4Bg',
                    'RenderMarkdownH5Bg', 'RenderMarkdownH6Bg'
                },
                foregrounds = {
                    'RenderMarkdownH1', 'RenderMarkdownH2', 'RenderMarkdownH3',
                    'RenderMarkdownH4', 'RenderMarkdownH5', 'RenderMarkdownH6'
                }
            }
        },
        config = function(_, opts)
            -- 1) setup the plugin
            require('render-markdown').setup(opts)

            -- 2) link markdown groups to theme-aware highlight groups (foreground only)
            local function link_group(name, target)
                vim.api.nvim_set_hl(0, name, {link = target})
            end

            link_group('RenderMarkdownH1', 'markdownH1')
            link_group('RenderMarkdownH2', 'markdownH2')
            link_group('RenderMarkdownH3', 'markdownH3')
            link_group('RenderMarkdownH4', 'markdownH4')
            link_group('RenderMarkdownH5', 'markdownH5')
            link_group('RenderMarkdownH6', 'markdownH6')

            link_group('RenderMarkdownH1Bg', 'markdownH1')
            link_group('RenderMarkdownH2Bg', 'markdownH2')
            link_group('RenderMarkdownH3Bg', 'markdownH3')
            link_group('RenderMarkdownH4Bg', 'markdownH4')
            link_group('RenderMarkdownH5Bg', 'markdownH5')
            link_group('RenderMarkdownH6Bg', 'markdownH6')

            link_group('markdownHeadingDelimiter', 'markdownHeadingDelimiter')

            link_group('@markup.heading.1.markdown', 'markdownH1') -- H1
            link_group('@markup.heading.2.markdown', 'markdownH2') -- H2
            link_group('@markup.heading.3.markdown', 'markdownH3') -- H3
            link_group('@markup.heading.4.markdown', 'markdownH4') -- H4
            link_group('@markup.heading.5.markdown', 'markdownH5') -- H5
            link_group('@markup.heading.6.markdown', 'markdownH6') -- H6
        end
    }
}

