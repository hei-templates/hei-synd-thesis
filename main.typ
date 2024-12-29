//
// Description: Main document to stitch everything together
//
#import "00-templates/template-thesis.typ": *
#import "01-settings/metadata.typ": *
#import "03-tail/glossary.typ": *
#register-glossary(entry-list)

//-------------------------------------
// Template config
//
#show: thesis.with(
  title: title,
  subtitle: subtitle,
  version: version,
  templateType: "thesis",
  author: (
    author,
    // (name: "author 2"),
    // (name: "author 3"),
    // (name: "author 4"),
    // (name: "author 5"),
  ),
  professor: professor,
  expert: expert,
  school: school,
  date: date,
  lang: lang,
  tableof: tableof,
  icons: icons,
  // title-extra-content-top: [
  //   #align(center+horizon)[#image(placeholder, width: 6cm)]
  // ],
  // title-extra-content-bottom: [
  //   #align(center+horizon)[#text(fill: red)[#image(placeholder, width: 6cm)]]
  // ],
)
//-------------------------------------
// Specifications + Summary
//
#full-page("/04-resources/specifications.svg")
#add-chapter("/02-main/00-summary.typ")

//-------------------------------------
// Report info + table of content
//
#pagebreak()
#page-reportinfo(
  author: author,
  date: date.current,
  signature: author.signature,
)
#pagebreak()
#toc(
  lang: lang,
  tableof: tableof,
  depth: depth-max,
  before: <sec:glossary>, // can be none for toc on all document
)

//-------------------------------------
// Acknowledgements
//
#pagebreak()
#heading(numbering:none)[Acknowledgements] <sec:ack>
#add-chapter("/02-main/01-acknowledgements.typ")

//-------------------------------------
// Abstract
//
#pagebreak()
#heading(numbering:none)[Abstract] <sec:abstract>
#add-chapter("/02-main/02-abstract.typ")

//-------------------------------------
// Introduction
//
#pagebreak()
= Introduction <sec:intro>
#todo([
  This is not finished add:
  - a
  - b
])
#add-chapter(
  "/02-main/03-introduction.typ",
  heading-offset: 1
)

//-------------------------------------
// Analysis
//
#pagebreak()
= Analysis <sec:analysis>

#lorem(50)

#add-chapter(
  "/02-main/04-analysis.typ",
  heading-offset: 1,
  after:<sec:analysis>,
  before:<sec:design>
)

//-------------------------------------
// Design
//
#pagebreak()
= Design <sec:design>

#lorem(50)

#add-chapter(
  "/02-main/05-design.typ",
  heading-offset: 1,
  after:<sec:design>,
  before:<sec:impl>
)


//-------------------------------------
// Implementation
//
#pagebreak()
= Implementation <sec:impl>

#lorem(50)

#add-chapter(
  "/02-main/06-implementation.typ",
  heading-offset: 1,
  after:<sec:impl>,
  before:<sec:validation>
)


//-------------------------------------
// Validation
//
#pagebreak()
= Validation <sec:validation>

#lorem(50)

#add-chapter(
  "/02-main/07-validation.typ",
  heading-offset: 1,
  after: <sec:validation>,
  before: <sec:conclusion> 
)

//-------------------------------------
// Conclusion
//
#pagebreak()
= Conclusion <sec:conclusion>

#add-chapter(
  "/02-main/08-conclusion.typ",
  heading-offset: 1,
)


//-------------------------------------
// Glossary
//
#pagebreak()
= Glossary <sec:glossary>
#print-glossary(
  entry-list,
  // show all term even if they are not referenced, default to true
  show-all: false,
  // disable the back ref at the end of the descriptions
  disable-back-references: false,
  
)


//-------------------------------------
// Bibliography
//
#if bib == true {
  include "03-tail/bibliography.typ"
}

//-------------------------------------
// Appendix
//
#include "03-tail/a-appendix.typ"