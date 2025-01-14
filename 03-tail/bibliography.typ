#import "/00-templates/helpers.typ": *
#pagebreak()

```typst
#bibliography("/03-tail/bibliography.bib", style:"apa")
#bibliography("/03-tail/bibliography.bib", style:"chicago-author-date")
#bibliography("/03-tail/bibliography.bib", style:"chicago-notes")
#bibliography("/03-tail/bibliography.bib", style:"ieee")
#bibliography("/03-tail/bibliography.bib", style:"mla")
```

#let make_bibliography(
  bib:(
    display: true,
    style: "ieee", //"apa", "chicago-author-date", "chicago-notes", "mla"
  ),
  title: i18n("bib-title"),
) = {[
  #if bib.display == true {[
    #pagebreak()
    #bibliography(title: title, "/03-tail/bibliography.bib", style:bib.style)
  ]} else{[
    #set text(size: 0pt)
    #bibliography(title: "", "/03-tail/bibliography.bib", style:bib.style)
  ]}
]}
