#import "../template/thesis.typ": thesis

#show: thesis.with(
  title: [A typst template for a thesis],
  authors: [Rasmus Buurman, Leander Herter],
  header-authors: [Buurman, Herter],
  university: [University of Tübingen],
  supervisor: [Kurt Gödel],
  header-title: [A template],
)

= First Chapter
#lorem(500)

= Second Chapter
#lorem(300)

= Third Chapter
#lorem(700)
