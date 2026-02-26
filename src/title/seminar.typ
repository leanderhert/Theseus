#let seminar(
  university: none,
  seminar-title: none,
  title: none,
  author: none,
  student-id: none,
  study-program: none,
  docent: none,
  semester: none,
  date: datetime.today().display(),
  show-outline: true,
) = {
  set page(header: none, footer: none)
  set align(center)

  {
    text(size: 1.6em, university)
  }

  v(2fr)

  {
    line(length: 100%)

    text(size: 1.6em, seminar-title)
    v(1fr)
    text(size: 2em, strong(title))

    line(length: 100%)
  }

  v(2fr)

  {
    text(1.4em, author)
    linebreak()
    text(1.1em, student-id)
    linebreak()
    text(1.1em, study-program)
  }

  v(2fr)

  text(size: 1.4em, docent)

  v(2fr)

  {
    semester
    linebreak()
    date
  }

  v(3fr)

  if show-outline { outline() }

  v(5fr)
}
