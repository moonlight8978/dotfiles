import { parseColumns } from '..'

describe('parseColumns', () => {
  it('parse the input into columns', () => {
    const input = `
    |W| full |W| Project |W| <a>dotfiles</a>
    |W| inline |W| Author |W| John
    |W| full |W| Changelog |W| <html-safe>asdsaas Co-author: email@example.com <email@example.com></html-safe>
`

    expect(parseColumns(input)).toEqual([
      {
        content: '<a>dotfiles</a>',
        variant: 'full',
        title: 'Project',
      },
      {
        content: 'John',
        variant: 'inline',
        title: 'Author',
      },
      {
        content: `<html-safe>asdsaas Co-author: email@example.com <email@example.com></html-safe>`,
        variant: 'full',
        title: 'Changelog',
      },
    ])
  })
})
