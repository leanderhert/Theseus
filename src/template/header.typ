
/// Header
#let header-content(
  title,
  authors,
  header-show-on-first-page,
  extra-left,
  extra-center,
  extra-right,
  columns,
  column-gutter,
  row-gutter,
  align,
  padding-top,
  padding-bottom,
) = {
  let header = grid(
    columns: columns,
    align: align,
    rows: (auto, auto),
    column-gutter: column-gutter,
    row-gutter: row-gutter,
    /// left
    context {
      counter(page).get().first()
    },
    /// center
    context {
      let n = counter(page).get().first()
      if (calc.odd(n)) {
        title
      }
      if (calc.even(n)) {
        authors
      }
    },
    /// right
    /// empty
  )
  return pad(top: padding-top, bottom: padding-bottom, header)
}
