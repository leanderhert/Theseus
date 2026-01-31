#let basic(
  thesis-type-title: "THESIS TYPE TITLE",
  title: "TITLE",
  author: "AUTHOR",
  university: "UNIVERSITY",
  department: none,
  institute: none,
  submission-date: none,
  reviewer: none,
) = {
  set page(header: none, footer: none, margin: 0pt)
  show: align.with(center)

  v(8fr)

  grid(
    columns: 1,
    row-gutter: 0.7em,
    text(size: 2em, university),
    if department != none {
      text(size: 1.3em, department)
    },
    if institute != none {
      text(size: 1.3em, institute)
    },
  )

  v(8fr)

  text(size: 2.3em, thesis-type-title)

  v(4fr)

  text(size: 1.6em, strong(title))

  v(3fr)

  text(size: 1.3em, author)

  if submission-date != none {
    v(1fr)
    text(size: 1em, submission-date)
  }

  v(8fr)

  if reviewer != none {
    text(size: 0.9em, strong("Reviewer"))

    v(2fr)

    if type(reviewer) == str {
      text(size: 1.3em, reviewer)
    } else if type(reviewer) == dictionary {
      let r-name = reviewer.at("name", default: none)
      let r-university = reviewer.at("university", default: none)
      let r-department = reviewer.at("department", default: none)

      grid(
        columns: 1,
        row-gutter: 0.5em,
        if r-name != none {
          text(size: 1.3em, r-name)
        },
        if r-department != none {
          text(size: 0.8em, r-department)
        },
        if r-university != none {
          text(size: 0.8em, r-university)
        },
      )
    }
  }

  v(8fr)

  pagebreak(weak: true)
}
