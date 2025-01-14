//
// Description: Main document to stitch everything together
//
#import "/00-templates/template-thesis.typ": *
#import "/01-settings/metadata.typ": *
#import "/03-tail/bibliography.typ": *
#import "/03-tail/glossary.typ": *
#show:make-glossary
#register-glossary(entry-list)

//-------------------------------------
// Template config
//
#show: thesis.with(
  option: option,
  doc: doc,
  summary-page: summary-page,
  professor: professor,
  expert: expert,
  school: school,
  date: date,
  tableof: tableof,
  icons: icons,
)

//-------------------------------------
// Content
//
#include("/02-main/00-acknowledgements.typ")
#include "/02-main/01-abstract.typ"
#include "/02-main/02-introduction.typ"
#include "/02-main/03-analysis.typ"
#include "/02-main/04-design.typ"
#include "/02-main/05-implementation.typ"
#include "/02-main/06-validation.typ"
#include "/02-main/07-conclusion.typ"

//-------------------------------------
// Glossary
//
#make_glossary(gloss:gloss, title:i18n("gloss-title"))

//-------------------------------------
// Bibliography
//
#make_bibliography(bib:bib, title:i18n("bib-title"))

//-------------------------------------
// Appendix
//
#if appendix == true {[
  #pagebreak()
  #counter(heading).update(0)
  #set heading(numbering:"A")
  = #i18n("appendix-title") <sec:appendix>
  #include "/03-tail/a-appendix.typ"
]}
