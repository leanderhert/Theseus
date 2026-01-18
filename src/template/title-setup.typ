
/// helper function for the date
#let default-date() = {
  return { "[day] [month repr:long] [year]" }
}

/// setup title
#let title-setup(
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
) = {
  let setup-supervisor = [Supervised by ] + supervisor

  let setup-course = [Course: ] + course

  let setup-date = if (date != none) {
    context date.display(default-date())
  }
  let submission-date = [Submitted: ] + [#setup-date]

  let setup-title = context {
    v(10pt)
    text(title-size)[
      #title-style(title)
    ]
    v(10pt)
    text(authors-size)[
      #authors
    ]
    v(5pt)
    if (university != none) {
      text(university-size)[#university\ ]
    }
    if (course != none) {
      text(course-size)[#setup-course\ ]
    }
    if (supervisor != none) {
      text(supervisor-size)[#setup-supervisor\ ]
    }
    if (date != none) {
      text(date-size)[#submission-date]
    }
    v(10pt)
  }
  return setup-title
}
