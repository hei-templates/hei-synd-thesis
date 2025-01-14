//-------------------------------------
// Metadata of the document
//
#let option = (
  type        : "final",  // "draft"
  //type        : "draft",
  //lang        : "en",     // "de", "fr"
  lang        : "de",
  //lang        : "fr",
  template    : "thesis", // "midterm"
)

#let langs = json("/00-templates/i18n-thesis.json")

#let doc= (
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
)

#let summary-page = (
  logo: "/04-resources/placeholder.svg",
  // one sentence with max. 240 characters, with spaces.
  objective: [
    The objective of this thesis is to analyze and improve the performance of a predictive maintenance system in industrial IoT environments by implementing advanced data processing algorithms and evaluating their effectiveness through case studies.
  ],
  // summary max. 1200 characters, with spaces.
  content: [
    This bachelor thesis focuses on the optimization of predictive maintenance systems within industrial IoT environments. Predictive maintenance is a key aspect of modern manufacturing, enabling the anticipation of equipment failures and reducing downtime. The research begins by outlining the theoretical foundations of predictive maintenance, including sensor data acquisition, processing, and analysis. The study then introduces advanced data processing algorithms, such as machine learning techniques, to enhance prediction accuracy and reliability. A case study approach is employed, using real-world industrial data to evaluate the system’s performance. The results demonstrate significant improvements in fault detection rates and decision-making efficiency. The thesis concludes by discussing the implications for industry and providing recommendations for future development. This work aims to contribute to the advancement of smart maintenance systems, supporting industry 4.0 transformation efforts.
  ],
  address: [HES-SO Valais Wallis • rue de l'Industrie 23 • 1950 Sion \ +41 58 606 85 11 • #link("mailto"+"info@hevs.ch")[info\@hevs.ch] • #link("www.hevs.ch")[www.hevs.ch]]
)

#let professor= (
  name: "Prof. Silvan Zahno",
  email: "silvan.zahno@hevs.ch",
  affiliation: "HEI-Vs",
)
#let expert= (
  name: "Expert Name",
  email: "expert@domain.ch",
  affiliation: "Company",
)
#let school= (
  name: "University of Applied Sciences Western Switzerland, HES-SO Valais Wallis",
  shortname: "HEI-VS",
  orientation: "Systems Engineering",
  specialisation: "Infotronics",
  dean: "Dr. Cyrille Beçencon",
)
#let date = (
  start: datetime(year: 2025, month: 5, day: 13),
  end: datetime(year: 2025, month: 8, day: 16),
  submission: datetime(year: 2025, month: 8, day: 16),

  mid-term-submission: datetime(year: 2025, month: 6, day: 14),
  mid-term-presentation: datetime(year: 2025, month: 6, day: 18),

  today: datetime.today(),
)

#let icons = (
  topleft: image("/04-resources/logos/hei-vs-light.svg", width: 6cm),
  topright: image("/04-resources/logos/hesso-logo.svg", width: 4cm),
  bottomleft: image("/04-resources/logos/hevs-pictogram-only.svg", width: 4cm),
  bottomright: image("/04-resources/logos/valais-excellence-logo.svg", width: 1.5cm),
  )
)

//-------------------------------------
// Settings
//
#let tableof = (
  toc: true,
  tof: false,
  tot: false,
  tol: false,
  toe: false,
  maxdepth: 3,
)

#let gloss    = true
#let appendix = false
#let bib = (
  display : true,
  style : "ieee", //"apa", "chicago-author-date", "chicago-notes", "mla"
)
