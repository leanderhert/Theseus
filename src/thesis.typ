#import "header.typ": header-content
#import "title-setup.typ": title-setup
#import "util.typ": is-some, to-string


/// helper for surname
#let surname(name) = {
  let splitname = to-string(name).split()
  return splitname.last()
}

/// helper for authors
#let _handle_authors(authors) = {
  if authors == none { return ((), none, none) }

  if type(authors) != array { authors = (authors,) }

  let author-names = authors.map(a => {
    if type(a) == dictionary {
      assert("name" in a, message: "Missing mandatory field `name`.")
      [#a.name]
    } else [#a]
  })
  let author-surnames = if author-names.len() > 1 {
    author-names.map(a => { surname(to-string(a)) })
  } else if (
    regex("\\s+") in to-string(author-names.last())
  ) { to-string(author-names.last()).split().last() } else {
    author-names.first()
  }
  let author-emails = authors.map(a => {
    if type(a) == dictionary and "email" in a [#a.email]
  })
  let author-ids = authors.map(a => {
    if type(a) == dictionary and "id" in a [#a.id]
  })
  let author-universitys = authors.map(a => {
    if type(a) == dictionary and "university" in a [#a.university]
  })

  if author-emails.filter(is-some).len() == 0 { author-emails = none }
  if author-ids.filter(is-some).len() == 0 { author-emails = none }
  if author-universitys.filter(is-some).len() == 0 { author-universitys = none }

  return (
    author-names,
    author-surnames,
    author-emails,
    author-ids,
    author-universitys,
  )
}

/// Thesis setup
#let thesis(
  title: none,
  title-style: t => [*#t*],
  title-size: 1.8em,
  course: none,
  course-size: 11pt,
  authors: none,
  authors-size: 14pt,
  date: datetime.today(),
  date-size: 11pt,
  date-format: auto,
  margin-left: 1.7cm,
  margin-right: 1.7cm,
  marign-bottom: 1.7cm,
  paper: "a4",
  page-numbering: "1",
  header-title: none,
  header-show-on-first-page: false,
  header-extra-left: none,
  header-extra-center: none,
  header-extra-right: none,
  header-colums: (1fr, 1fr, 1fr),
  header-align: (left, center, right),
  header-column-gutter: 1em,
  header-row-gutter: 0.5em,
  header-padding-top: 3em,
  header-padding-bottom: 0em,
  university: none,
  university-size: 11pt,
  supervisor: none,
  supervisor-size: 11pt,
  document,
) = context {
  let (
    author-names,
    author-surnames,
    author-emails,
    author-ids,
    author-university,
  ) = _handle_authors(authors)

  // header
  let header = header-content(
    header-title,
    author-surnames,
    header-show-on-first-page,
    header-extra-left,
    header-extra-center,
    header-extra-right,
    header-colums,
    header-column-gutter,
    header-row-gutter,
    header-align,
    header-padding-top,
    header-padding-bottom,
  )

  set par(
    justify: true,
  )

  // text settings
  set text(
    font: "Libertinus Serif",
    size: 11pt,
  )

  // page
  set page(
    paper: paper,
    header: context {
      if counter(page).get().first() > 1 or header-show-on-first-page {
        header
      }
    },
    footer: none,
    numbering: "1",
    margin: auto,
  )

  // setup titel
  set align(center)
  title-setup(
    title,
    title-style,
    title-size,
    author-names,
    authors-size,
    author-university,
    university-size,
    author-ids,
    author-emails,
    supervisor,
    supervisor-size,
    course,
    course-size,
    date,
    date-size,
  )
  set align(left)

  // document
  set heading(numbering: "1.")
  counter(page).update(1)
  document
}
