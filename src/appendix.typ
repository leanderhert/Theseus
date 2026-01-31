#let appendix(
  title: "Appendix",
  title-size: 1.6em,
  supplement: "Appendix",
  numbering: "A.1",
  body,
) = [
  #if title != none {
    text(title-size, strong(title))
  }

  #set heading(numbering: numbering, supplement: supplement)

  #counter(heading).update(0)

  #body
]