import { htmlSafe } from '../src/main'

describe('htmlSafe', () => {
  it('escape html inside <html-safe> tag', () => {
    const input = `<a>Link</a> some thing <html-safe>asdsaas Co-author: email@example.com <email@example.com></html-safe>`

    expect(htmlSafe(input)).toEqual(
      `<a>Link</a> some thing asdsaas Co-author: email@example.com &lt;email@example.com&gt;`
    )
  })

  it('escape multi-line string', () => {
    const input = `<html-safe>fix: Fix html entities

1. feat1
2. feat2

Co-author: bichle-mechmaster <bich.le@icetea.io></html-safe>`

    expect(htmlSafe(input)).toEqual(
      `fix: Fix html entities&#10;&#10;1. feat1&#10;2. feat2&#10;&#10;Co-author: bichle-mechmaster &lt;bich.le@icetea.io&gt;`
    )
  })
})
