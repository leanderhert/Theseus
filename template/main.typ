// TODO: Replace with @preview
#import "@local/theseus:0.1.0": thesis

#show: thesis.with(
  title: [A typst template for a thesis],
  authors: (
    (
      name: "Rasmus Buurman",
      university: "University of Tübingen",
      email: "rasmus.buurman@student.uni-tuebingen.de",
      id: "666666",
    ),
    (
      name: "Leander Herter",
      university: "University of Tübingen",
      email: "leander.herter@student.uni-tuebingen.de",
      id: "6452375",
    ),
  ),
  header-title: [A template],
)

= First Chapter
#lorem(500)

= Second Chapter
#lorem(300)

= Third Chapter
#lorem(700)
