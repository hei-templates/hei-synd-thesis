//-----------------------------------------------------------------------------
// Glossary
//

// HEADER
#import "/00-templates/helpers.typ": *
#let entry-list = (
  (
    key: "ar",
    short: "AR",
    long: "Augmented Reality",
  ),
  (
    key: "scrum",
    short: "Scrum",
    description: [Scrum is an agile process framework for managing complex knowledge work, with an initial emphasis on software development, although it has been used in other fields and is slowly starting to be explored for other complex work, research and advanced technologies.],
  ),
  (
    key: "hei",
    short: "HEI",
    long: "Haute École d'Ingénierie",
    group: "University"
  ),
  (
    key: "synd",
    short: "Systems Engineering",
    group: "University"
  ),
)

#print-glossary(
  entry-list,
  // show all term even if they are not referenced, default to true
  show-all: false,
  // disable the back ref at the end of the descriptions
  disable-back-references: false,
  
)
