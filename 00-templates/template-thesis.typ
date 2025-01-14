//
// Description: HEVS Thesis Typst Template
// Author     : Silvan Zahno
//
#import "/00-templates/helpers.typ": *
#import "/00-templates/pages-thesis.typ": *

#let thesis(
  option: (
    type        : "final",  // "draft"
    lang        : "en",     // "de", "fr"
    template    : "thesis", // "midterm"
  ),
  doc: (
    title    : "Thesis Template",
    subtitle : "Longer Subtitle",
    author: (
      name        : "Firstname Lastname",
      email       : "firstname.lastname@hevs.ch",
      degree      : "Bachelor",
      affiliation : "HEI-Vs",
      place       : "Sion",
      url         : "https://synd.hevs.io",
      signature   : "/04-resources/signature.svg",
    ),
    keywords : ("HEI-Vs", "Systems Engineering", "Infotronics", "Thesis", "Template"),
    version  : "v0.1.0",
  ),
  summary-page : (
    logo: none,
    objective: none,
    content: none,
  ),
  professor: (),
  expert: (),
  school: (),
  date: (
    start: datetime.today(),
    end: datetime.today(),
    submission: datetime.today(),
    mid-term-submission: datetime.today(),
    mid-term-presentation: datetime.today(),
    today: datetime.today(),
  ),
  tableof : (
    toc: true,
    tof: false,
    tot: false,
    tol: false,
    toe: false,
    maxdepth: 3,
  ),
  icons: (
    topleft: none,
    topright: none,
    bottomleft: none,
    bottomright: none,
  ),
  title-extra-content-top: none,
  title-extra-content-bottom: none,
  body) = {
  // basic properties
  set document(author: doc.author.name , title: doc.title, keywords: doc.keywords, date: date.today)
  set page(margin: (top:3.5cm, bottom:3.5cm, rest:3.5cm))

  // header and footer
  set page(
    header: context(if here().page() >=2 [
    #set text(small)
      #h(1fr) #smallcaps(doc.title)
    ]),
    footer: context( if here().page() >=2 [
      #set text(small)
      #h(1fr) #counter(page).display("1 / 1", both: true)
    ]),
  )

  // font & language
  set text(
    font: (
      "Libertinus Serif",
      "Fira Sans",
    ),
    fallback: true,
    lang: option.lang
  )
  // paragraph
  show par: set par(spacing: 1em)

  // heading
  show heading: set block(above: 1.2em, below: 1.2em)
  set heading(numbering: "1.1")

  show heading.where(level: 1): (it) => {
    set text(size: huge)
    set block(above: 1.2em, below: 1.2em)
    if it.numbering != none {
      let num = numbering(it.numbering, ..counter(heading).at(it.location()))
      let prefix = num + h(0.5em) + text(code-border)[|] + h(0.5em)
      unshift_prefix(prefix, it.body)
    } else {
      it
    }
  }

  show heading.where(level: 2): (it) => {
    if it.numbering != none {
      let num = numbering(it.numbering, ..counter(heading).at(it.location()))
      unshift_prefix(num + h(0.8em), it.body)
    }
  }

  // link color
  //show link: it => text(fill:blue, underline(it))
  show link: it => text(fill:hei-blue, it)

  // code blocks
  set raw(syntaxes:"syntax/VHDL.sublime-syntax")
  set raw(syntaxes:"syntax/riscv.sublime-syntax")

  show raw.where(block: false): set text(weight: "semibold")
  //show raw.where(block: false): it => {
  //  highlight(
  //    fill:code-bg,
  //    top-edge: "ascender",
  //    bottom-edge: "bounds",
  //    extent:1pt, it)
  //}
  show raw.where(block: true): set text(size: tiny)
  show raw.where(block: true): it => {
    block(
      fill: code-bg,
      width:100%,
      inset: 10pt,
      radius: 4pt,
      stroke: 0.1pt + code-border,
      it,
    )
  }

  // Title page
  page-title-thesis(
    title: doc.title,
    subtitle: doc.subtitle,
    date: date.submission,
    template: option.template,
    school: school,
    author: doc.author,
    professor: professor,
    expert: expert,
    icons: icons,
    extra-content-top: title-extra-content-top,
    extra-content-bottom: title-extra-content-bottom,
  )

  // Summary
  pagebreak()
  summary(
    title: doc.title,
    student: doc.author.name,
    year: date.submission.display("[year]"),
    degree: school.orientation,
    field: school.specialisation,
    professor: professor,
    //partner: partner,
    logo: summary-page.logo,
    objective: summary-page.objective,
    address: summary-page.address,
  )[#summary-page.content]

  // Report info
  pagebreak()
  page-reportinfo(
    author: doc.author,
    date: date.today,
    signature: doc.author.signature,
  )

  // Table of ...
  pagebreak()
  toc(
    tableof: tableof,
    titles: (
      toc: i18n("toc-title"),
      tot: i18n("tot-title"),
      tof: i18n("tof-title"),
      tol: i18n("tol-title"),
      toe: i18n("toe-title"),
    ),
    before: <sec:glossary>
  )

  // Main body
  set par(justify: true)

  body
}
