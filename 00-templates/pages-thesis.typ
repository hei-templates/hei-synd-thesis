//
// Description: Custom pages for the thesis template
// Author     : Silvan Zahno
//
#import "/00-templates/helpers.typ": *

#let page-title-thesis(
  title: none,
  subtitle: none,
  template: "thesis",
  date: datetime.today(),
  school: (
    name: none,
    shortname: none,
    orientation: none,
    specialisation: none,
    dean: none,
  ),
  author: (
    name        : none,
    email       : none,
    degree      : none,
    affiliation : none,
    place       : none,
    url         : none,
    signature   : none,
  ),
  professor: none,
  expert:none,
  icons: (
    topleft: none,
    topright: none,
    bottomleft: none,
    bottomright: none,
  ),
  extra-content-top: none,
  extra-content-bottom: none,
) = {

  set page(
    margin: (
      top:3.0cm,
      bottom:3.0cm,
      rest:3.5cm
    )
  )
  //-------------------------------------
  // Page content
  //
  let content-up = {
    //line(length: 100%)
    if school != none {
      //v(0.5fr)
      // Degree Programme
      if school.orientation != none {
        align(center, [#text(size:larger,
          i18n("degree-programme")
        )])
        v(1em)
      }

      // Orientation
      if school.orientation != none {
        align(center, [#text(size:larger,
          school.orientation
        )])
        v(1em)
      }

      // Specialisation
      if school.specialisation != none {
        align(center, [#text(size:large,
          [#i18n("major") #school.specialisation]
        )])
        v(2em)
      }
    }

    if extra-content-top != none {
      extra-content-top
    }

    // BACHELOR'S THESIS / Midterm Report
    if template == "thesis" {
      align(center, [#text(size:huge,
        [*#i18n("thesis-title")*]
      )])
      v(1em)
    } else if template == "midterm"{
      align(center, [#text(size:huge,
        [*#i18n("midterm-title")*]
      )])
      v(1em)
    }

    // DIPLOMA YEAR
    align(center, [#text(size:huge,
      [*#i18n("diploma") #date.display("[year]")*]
    )])
    v(1em)

    // AUTHORs
    align(center, [#text(size:large, [
      #if type(author) == array [
        #enumerating_authors(
          items: author,
          multiline: true,
        )
      ] else [
        #author.name
      ]
      #v(2em)
    ])])

    titlebox(
      title: title,
      subtitle: subtitle,
    )

    if extra-content-bottom != none {
      extra-content-bottom
    }
  }

  let content-down = [
    #v(2em)
    #if professor != none [
      #i18n("professor")\
      #professor.name, #link("mailto:professor.email")[#professor.email]
      \ \
    ]
    #if expert != none [
      #i18n("expert")\
      #expert.name, #link("mailto:expert.email")[#expert.email]
      \ \
    ]
    #i18n("submission-date")\
    #date.display("[day] [month repr:long] [year]")
    #v(1em)
  ]

  grid(
    columns: (50%, 50%),
    rows: (10%, 63%, 20%, 7%),
    align(left+horizon)[#icons.topleft],
    align(right+horizon)[#icons.topright],
    //stroke: 0.5pt,
    grid.cell(
      colspan: 2,
      align(horizon)[#content-up]
    ),
    grid.cell(
      colspan: 2,
      align(horizon)[#content-down]
    ),
    align(left+horizon)[#icons.bottomleft],
    align(right+horizon)[#icons.bottomright],
  )
}

#let summary(
  title: none,
  student: none,
  year: none,
  degree: none,
  field: none,
  professor: none,
  partner: none,
  logo: none,
  objective: none,
  address: none,
  body
) = {
  set page(
    margin: (
      top: 5.5cm,
      bottom: 3cm,
      x: 1.8cm,
    ),
    header: [
      #image("/04-resources/logos/hei-vs-light.svg", width: 7.5cm)
    ],
    footer: [
      #table(
        columns: (11cm, 4cm, 1.5cm, auto),
        stroke: none,
        align: left + horizon,
        [
          #if address != none {
            option_style()[#address]
          } else {[
            #option_style()[HES-SO Valais Wallis • rue de l'Industrie 23 • 1950 Sion \ +41 58 606 85 11 • #link("mailto"+"info@hevs.ch")[info\@hevs.ch] • #link("www.hevs.ch")[www.hevs.ch]]
          ]}
        ],[
          #image("/04-resources/logos/swissuniversities.svg", width: 3.3cm)
        ],[
          #image("/04-resources/logos/equal_salary.svg", width: 1cm)
        ],[
          #image("/04-resources/logos/valais-excellence-logo.svg", width: 1.1cm)
        ]
      )
    ],
  )

  set text(size: 9pt)
  set par(justify: true)

  table(
    columns: (5.4cm, 1.2cm, 1fr),
    stroke: none,
    inset: 0pt,
    [
      #if logo != none {
        image(logo, fit: "contain", width: 5.4cm, height: 8.1cm)
      } else {
        image(placeholder, width: 5.4cm, height: 8.1cm)
      }

      #v(1cm)

      #align(center)[
        #heading(level: 3, numbering:none, outlined: false)[
          #text(15pt)[
            #i18n("thesis-title")\ | #h(0.3cm) #year #h(0.3cm) |
          ]
        ]
      ]

      #v(0.5cm)

      //#square(size: 0.7cm, fill: blue.lighten(70%))

      #v(0.6cm)
      #set text(size: 10pt)

      #i18n("degree-programme")\
      _#[#degree]_

      #v(0.6cm)

      #i18n("major")\
      _#[#field]_

      #v(0.6cm)

      #if professor != none {[
        #i18n("professor")\
        _#[#professor.name]_\
        _#[#professor.email]_
        #v(0.6cm)
      ]}

      #if partner != none {[
        #i18n("partner")\
        _#[#partner.name]_\
        _#[#partner.affiliation]_
      ]}

    ],[],[
      #align(left, text(15pt)[
        #heading(numbering:none, outlined: false)[#title]
      ])
      #table(
        columns: (0cm, 3.5cm, 1fr),
        stroke: none,
        align: left + horizon,
        [
          //#square(size: 0.7cm, fill: blue.lighten(70%))
        ],[
          #set text(
            size: 12pt,
            fill: gray.darken(50%),
          )
          #i18n("graduate")
        ],[
          #set text(size: 10pt)
          #student
        ]
      )

      #v(1.5cm)

      #heading(level: 3, numbering:none, outlined: false)[
        #text(12pt)[#i18n("objective")]
      ]

      #if objective == none {
        (red)[
          #i18("objective-text")
        ]
        lorem(20)
      } else {
        objective
      }

      #v(0.6cm)

      #heading(level: 3, numbering:none, outlined: false)[
        #text(12pt)[#i18n("methods-experiences-results")]
      ]

      #body
    ]
  )
}

#let page-reportinfo(
  author: (),
  date: none,
  signature: none,
) = {
  heading(numbering:none, outlined: false)[#i18n("report-info")]
  v(2em)
  heading(numbering:none, outlined: false)[*#i18n("contact-info")*]

  table(
    columns: (auto, auto),
    stroke: none,
    align: left + top,
    table.cell(rowspan: 3)[Author:], [#author.name],
    [#author.degree #i18n("student")],
    [#author.affiliation],
    [Email:], [#link("mailto:author.email")[#author.email]],
  )

  v(5em)
  [
    *#i18n("declaration-title")* \
    #i18n("declaration-text")
  ]

  table(
    stroke: none,
    columns: (auto,auto),
    align: left + horizon,
    [#i18n("declaration-signature-prefix")], [#author.place, #date.display("[day].[month].[year]")],
    [#i18n("declaration-signature")],
    if signature != none {[
      #v(0.5cm)
      #pad(x: 2.5em, image(author.signature, width:3cm))
      #line(start: (0cm,-0.7cm),length:5cm)
    ]} else {[
      #line(start: (0cm,1.5cm),length:7cm)
    ]},
  )
}
