#let manual(
  type: "Manual",
  title: "Title",
  author: "Author",
  date: datetime.today().display(),
  version: none,
  repo: none,
  show-content: true,
) = {
  set page(header: none, footer: none, margin: 70pt)
  show: align.with(center)

  v(5em)

  text(size: 1.3em, type)

  v(3em)

  text(size: 1.6em, strong(title))

  v(0.3em)

  text(size: 1.3em, author)

  v(0.3em)

  text(size: 1.3em, date)

  if version != none {
    v(0.3em)
    text(size: 1.3em, version)
  }

  if repo != none {
    v(0.3em)
    link(repo)
  }

  if show-content {
    v(5em)
    outline()
  }

  pagebreak(weak: true)
}
