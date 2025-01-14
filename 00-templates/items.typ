//
// Description: Creating nice looking item list with different icons
// Author     : Silvan Zahno
//
#import "/00-templates/constants.typ": *

#let item-list(
  content: none,
  height: normal,
  icon: icon-check-square,
) = {
  if content != none {
    v(-9pt)
    table(
      stroke: none,
      columns: 2,
      align: left+horizon,
      column-gutter: -2pt,
      image(icon, height:normal), content
    )
    v(-9pt)
  }
}

#let item-circle(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-circle,
  )
}
#let item-square(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-square,
  )
}
#let item-checkbadge(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-check-badge,
  )
}
#let item-checkcircle(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-check-circle,
  )
}
#let item-checksquare(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-check-square,
  )
}
#let item-check(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-check,
  )
}
#let item-circle(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-circle,
  )
}
#let item-square(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-square,
  )
}
#let item-file(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-file,
  )
}
#let item-folder(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-folder,
  )
}
#let item-xcircle(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-x-circle,
  )
}
#let item-xsquare(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-x-square,
  )
}
#let item-x(
  content: none,
  height: normal,
) = {
  item-list(
    content: content,
    height: height,
    icon: icon-x,
  )
}
