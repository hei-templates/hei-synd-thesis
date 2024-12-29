//
// Description: HEVS Thesis Typst Template
// Author     : Silvan Zahno
//
#import "helpers.typ": *
#import "page-title-thesis.typ": *
#import "page-reportinfo.typ": *

#let thesis(
  title: none,
  subtitle: none,
  templateType: "thesis",
  version: none,
  author: (),
  professor: none,
  expert: none,
  school: none,
  date: datetime.today(),
  lang:"en",
  tableof : (
    toc: true,
    tof: false,
    tot: false,
    tol: false,
    toe: false,
    indent: none,
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
  //-------------------------------------
  // Variables
  //
  
  let authors = ()
  if type(author) == array {
    if author != none {
      for a in author {
        if a != none{
          if "name" in a {
            authors.push(a.name)
          }
        }
      }
    }
  } else {
    authors.push(author.name)
  }

  let thesis = if templateType == "thesis" {true}
  else {false}

  let midterm = if templateType == "midterm" {true}
  else {false}


  let submission-date = if midterm {
    if "mid-term-submission" in date {
      date.mid-term-submission
    } else {
      datetime.today()
    }
  } else {
    if type(date) == datetime {
      date
    } else {
      if "submission" in date {
        date.submission
      } else {
        datetime.today()
      }
    }
  }


  //-------------------------------------
  // Metadata
  //
  set document(
    author: authors,
    title: title,
    date: datetime.today(),
    keywords: keywords,
  )

  //-------------------------------------
  set page(
    margin: (
      top:3.5cm,
      bottom:3.5cm,
      rest:3.5cm
    )
  )

  // header and footer
    header: context(if here().page() >=2 [
    #set text(small)
      #h(1fr) #smallcaps(title)
    ]),
    footer: context(if here().page() >=2 [
      #set text(small)
      #h(1fr) #counter(page).display("1 / 1", both: true)
    ]),
  )

  // font & language
  set text(
    font: (
      "Linux Libertine",
      "Fira Sans",
    ),
    fallback: true,
    lang:lang
  )
  // paragraph
  show par: set par(spacing: 1em)
  //set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)

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
    let num = numbering(it.numbering, ..counter(heading).at(it.location()))
    unshift_prefix(num + h(0.8em), it.body)
  }

  show heading: (it) => {
    if (depth-max != none) and (it.level > depth-max) {
      /*h(0.8em)*(it.level - depth-max + 1) + */it.body + linebreak()
    } else {
      it
    }
  }


  // link color
  //show link: it => text(fill:blue, underline(it))
  show link: it => text(fill:hei-blue, it)

  // Math numbering
  set math.equation(numbering: "(1)")

  // code blocks
  set raw(syntaxes:"syntax/VHDL.sublime-syntax")
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
    title: title,
    subtitle: subtitle,
    date: submission-date,
    templateType: templateType,
    school: school,
    author: author,
    professor: professor,
    expert: expert,
    icons: icons,
    extra-content-top: title-extra-content-top,
    extra-content-bottom: title-extra-content-bottom,
  )


  // Main body
  set par(justify: true)

  body
}