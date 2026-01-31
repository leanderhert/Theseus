#let basic(
  title,
  authors,
  padding-top: 0.2em,
  padding-bottom: 0.2em,
  line: false,
) = {
  let header = {
    grid(
      columns: (1fr, 5fr),
      align: (left, right),

      // left
      context counter(page).get().first(),

      // right
      context {
        let n = counter(page).get().first()
        if (calc.odd(n)) {
          title
        } else {
          let authors = if type(authors) != array {
            (authors,)
          } else { authors }
          authors.join(", ")
        }
      },
    )
    // optional line
    v(-0.8em)
    if line { std.line(length: 100%, stroke: black) }
  }

  pad(top: padding-top, bottom: padding-bottom, header)
}
