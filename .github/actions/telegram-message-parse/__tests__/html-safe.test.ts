import { htmlSafe } from '../src/main'

describe('htmlSafe', () => {
  it('escape html inside <html-safe> tag', () => {
    const input = `<a>Link</a> some thing <html-safe>asdsaas Co-author: email@example.com <email@example.com></html-safe>`

    expect(htmlSafe(input)).toEqual(
      `<a>Link</a> some thing asdsaas Co-author: email@example.com &lt;email@example.com&gt;`
    )
  })
})
