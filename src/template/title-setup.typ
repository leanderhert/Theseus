#import "util.typ": is-some


/// helper function for the date
#let default-date() = {
  return { "[day] [month repr:long] [year]" }
}

/// setup title
#let title-setup(
  title,
  title-style,
  title-size,
  author-names,
  authors-size,
  author-universitys,
  university-size,
  author-ids,
  author-emails,
  supervisor,
  supervisor-size,
  course,
  course-size,
  date,
  date-size,
  inset: 1em,
  gutter: 1em,
  column-gutter: 7em,
) = {
  
  let info = author-emails

  for uni in author-universitys {
    info.push(uni)
  }
  for id in author-ids {
    info.push(id)
  }
  let entries = if(is-some(author-emails)) {
    info
  }

  let info-box = block( inset: inset, grid(
    columns: author-names.len(),
    gutter: gutter,
    column-gutter: column-gutter,
    align: center,
    ..entries,
  ))

  let setup-date = if (date != none) {
    context date.display(default-date())
  }

  let setup-title = context {
    v(10pt)
    text(title-size)[
      #title-style(title)
    ]
    v(10pt)
    text(authors-size)[
      #author-names.join(", ")
    ]
    v(5pt)
    info-box
    v(10pt)
  }
  return setup-title
}
