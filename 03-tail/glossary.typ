//-----------------------------------------------------------------------------
// Glossary with Glossarium
//
#import "/00-templates/helpers.typ": *

#let entry-list = (
  (
    key: "hei",
    short: "HEI",
    long: "Haute École d'Ingénierie",
    group: "University"
  ),
  (
    key: "synd",
    short: "SYND",
    long: "Systems Engineering",
    group: "University"
  ),
  (
    key: "it",
    short: "IT",
    long: "Infotronics",
    group: "University"
  ),
  (
    key: "fpga",
    short: "FPGA",
    plural: "FPGAs",
    long: "Field Programmable Gate Array",
    longplural: "Field Programmable Gate Arrays",
    description: "A field-programmable gate array (FPGA) is an integrated circuit designed to be configured by a customer or a designer after manufacturing – hence the term 'field-programmable'.",
    group: "Technology"
  ),
)



#let make_glossary(
  gloss:true,
  title: i18n("gloss-title"),
) = {[
  #if gloss == true {[
    #pagebreak()
    #set heading(numbering: none)
    = #title <sec:glossary>
    #print-glossary(
      entry-list,
      // show all term even if they are not referenced, default to true
      show-all: false,
      // disable the back ref at the end of the descriptions
      disable-back-references: false,
    )
  ]} else{[
    #set text(size: 0pt)
    #title <sec:glossary>
    #print-glossary(
      entry-list,
      // show all term even if they are not referenced, default to true
      show-all: false,
      // disable the back ref at the end of the descriptions
      disable-back-references: false,
    )
  ]}
]}
