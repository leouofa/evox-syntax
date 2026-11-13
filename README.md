# evox-syntax

Neovim filetype detection and syntax highlighting for `.evox` songbook files ([leouofa/evox](https://github.com/leouofa/evox)).

## Features

- **Automatic Filetype Detection**: Recognizes `*.evox` files as `filetype=evox`.
- **Embedded YAML Metadata**: Highlights YAML frontmatter attributes inside `== ... ==` blocks.
- **Column Delimiters**: Highlights `--` column boundaries.
- **Granular Chord Highlighting**: Highlights the leading `.` marker and individual chord tokens (e.g., `C`, `Am7`, `Dm6`) using standard Neovim highlight groups that adapt to your colorscheme.
- **Lyric Highlighting**: Highlights space-prefixed lyric lines distinctly from chords and layout markers.

## `.evox` Format Example

```evox
==
name: Free Falling
author: Tom Petty
font: 9.0
column_width: 610
gutter: 5
==

--
.        C    F     F     C     G
 She's a good girl, loves her mama
.     C    F     F     C    G
 Loves Jesus and America too
--
```

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim) / [LazyVim](https://www.lazyvim.org/)

Add `lua/plugins/evox.lua` to your Neovim configuration:

```lua
return {
  {
    "leouofa/evox-syntax",
    ft = "evox",
  },
}
```

## Highlight Groups

All syntax groups use `highlight default link` so they automatically inherit colors from your active colorscheme and can be overridden in your Neovim config if desired:

| Syntax Group | Default Link | Description |
| :--- | :--- | :--- |
| `evoxMetadataDelimiter` | `PreProc` | `==` metadata block delimiters |
| `evoxMetadataKey` | `Identifier` | YAML attribute keys inside `== ... ==` |
| `evoxMetadataColon` | `Delimiter` | `:` key-value separator in metadata |
| `evoxMetadataNumber` | `Number` | Numeric YAML attribute values (e.g., `9.0`, `610`, `5`) |
| `evoxMetadataString` | `Constant` | String YAML attribute values (e.g., `Free Falling`, `Tom Petty`) |
| `evoxColumnDelimiter` | `Delimiter` | `--` column wrapper delimiters |
| `evoxChordDot` | `SpecialChar` | Leading `.` on chord lines |
| `evoxChord` | `Function` | Individual chord tokens (e.g., `C`, `F`, `Am`, `Dm6`) |
| `evoxLyricLine` | `String` | Lyric lines beginning with a leading space |
| `evoxLyricLeadSpace` | `Whitespace` | Leading space character on lyric lines |
