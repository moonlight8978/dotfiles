local use_cterm, palette

if vim.o.background == 'dark' then
  palette = {
    base00 = '#151515',
    base01 = '#fb9fb1',
    base02 = '#acc267',
    base03 = '#ddb26f',
    base04 = '#6fc2ef',
    base05 = '#e1a3ee',
    base06 = '#12cfc0',
    base07 = '#d0d0d0',
    base08 = '#505050',
    base09 = '#fb9fb1',
    base0A = '#acc267',
    base0B = '#ddb26f',
    base0C = '#6fc2ef',
    base0D = '#e1a3ee',
    base0E = '#12cfc0',
    base0F = '#f5f5f5',
  }
  use_cterm = {
    base00 = 00,
    base01 = 18,
    base02 = 19,
    base03 = 08,
    base04 = 20,
    base05 = 07,    
    base06 = 21,
    base07 = 15,
    base08 = 01,
    base09 = 16,
    base0A = 03,
    base0B = 02,
    base0C = 06,
    base0D = 04,
    base0E = 05,
    base0F = 17,
  }
end

if vim.o.background == 'light' then
  palette = {
    base00 = '#e2e5ca',
    base01 = '#bcbfa4',
    base02 = '#979a7e',
    base03 = '#73765a',
    base04 = '#324490',
    base05 = '#002a83',
    base06 = '#0000e4',
    base07 = '#080500',
    base08 = '#5e2200',
    base09 = '#a86400',
    base0A = '#008818',
    base0B = '#004500',
    base0C = '#b34aad',
    base0D = '#004b76',
    base0E = '#7d0077',
    base0F = '#0086ae',
  }
  use_cterm = {
    base00 = 254,
    base01 = 250,
    base02 = 246,
    base03 = 243,
    base04 = 239,
    base05 = 18,
    base06 = 20,
    base07 = 232,
    base08 = 52,
    base09 = 130,
    base0A = 28,
    base0B = 22,
    base0C = 133,
    base0D = 24,
    base0E = 90,
    base0F = 31,
  }
end

if palette then
  require('mini.base16').setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = 'chalk'
end
