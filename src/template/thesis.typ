#import "header.typ": header-content
#import "title-setup.typ": title-setup

/// Thesis setup
#let thesis(
  title: none,
  title-style: t => [*#t*],
  title-size: 1.6em,
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
  header-authors: none,
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
) = {
  // header
  let header = header-content(
    header-title,
    header-authors,
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
      if counter(page).get().first() > 1 or header-show-on-first-page{
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
    authors,
    authors-size,
    university,
    university-size,
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
