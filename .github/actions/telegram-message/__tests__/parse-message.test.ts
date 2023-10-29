import { parseColumns } from '../src/main'

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
        placement: 'full',
        title: 'Project'
      },
      {
        content: 'John',
        placement: 'inline',
        title: 'Author'
      },
      {
        content: `<html-safe>asdsaas Co-author: email@example.com <email@example.com></html-safe>`,
        placement: 'full',
        title: 'Changelog'
      }
    ])
  })
})
