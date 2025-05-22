
// global values ---------------------------------------------------------------

#let ACTIVE_LINKS = false

#let FONT_FAMILY = "JetBrains Mono"

#let TODAY = (
  datetime.today().display("[month repr:long] [day], [year repr:full]")
)

#let TextColors = (
  TheBlue: rgb("#0b5394"),
)

// #let NEW_SECTION_SPACE = -0.75em
#let NEW_SECTION_SPACE = -1em

#let SizeFont = (
  name: 17pt,
  header: 14pt,
  expr: 10pt,
)

// page setup and configuration ------------------------------------------------

#set page(paper: "us-letter", margin: 0.5in, footer: align(center, [
  _ Last Updated: #TODAY _
]))

#set text(font: FONT_FAMILY)

#show link: underline

// user defined functions ------------------------------------------------------

#let svgLink(imagePath, url, urlText) = {
  box(image(imagePath), height: 10pt)
  h(0.3em)
  if ACTIVE_LINKS [
    #link(url)[#urlText]
  ] else [
    #text(urlText)
  ]
}

#let svgHeader(imagePath, headerText) = {
  heading(level: 1)[
    #box(image(imagePath, height: SizeFont.header))
    #text(headerText, fill: TextColors.TheBlue, size: SizeFont.header)
    #v(-0.75em)
    #line(length: 100%, stroke: (paint: luma(170), thickness: 2pt))
  ]
}

#let monthYear(month, year) = datetime(day: 1, month: month, year: year)

// experience / project item
#let exprItem(itemName, itemRole, startDate, endDate, content) = [
  #set text(size: SizeFont.expr)

  #let exprDateFormat = "[month repr:long] [year repr:full]"

  *#itemName* - #itemRole #h(1fr) #startDate.display(exprDateFormat) -
  #if endDate == TODAY {
    text("Present")
  } else {
    endDate.display(exprDateFormat)
  }
  #v(-0.5em)
  #content
  #v(-0.25em)
]

// page content ----------------------------------------------------------------

#box([
  #text(size: SizeFont.name)[
    *Bradley Kenneth Hutchings*
  ]
  #v(NEW_SECTION_SPACE)
  #text(size: SizeFont.expr)[
    (707)-302-9750 #sym.bullet bradleyhutchings\@mines.edu
  ]
])
#h(1fr)
#box([
  #svgLink(
    "./icons/linkedin-brands-solid.svg",
    "https://linkedin.com/in/bradley-k-hutchings",
    "linkedin.com/in/bradley-k-hutchings",
  )
  #v(NEW_SECTION_SPACE + 0.1em)
  #svgLink(
    "./icons/github-brands-solid.svg",
    "https://github.com/breadleaf",
    "github.com/breadleaf",
  )
  #v(NEW_SECTION_SPACE + 0.1em)
  //   #svgLink(
  //     "./icons/gitlab-brands-solid.svg",
  //     "https://gitlab.com/breadleaf",
  //     "gitlab.com/breadleaf",
  //   )
  //   #v(NEW_SECTION_SPACE + 0.1em)
  #svgLink(
    "./icons/globe-solid.svg",
    "https://breadleaf.github.io",
    "breadleaf.github.io",
  )
])
#v(NEW_SECTION_SPACE)

// ---- ----

#svgHeader("./icons/comment-solid.svg", "PROFILE")

#text(size: SizeFont.expr)[
  I am a passionate computer science enthusiast with a strong foundation in
  software development and problem-solving. In my free time, I like to learn
  Spanish and Japanese, bake bread, and make music. I am a dedicated lifelong
  learner with lots of curiosity!
]

#v(NEW_SECTION_SPACE)

#svgHeader("./icons/graduation-cap-solid.svg", "EDUCATION")

#exprItem(
  "Colorado School of Mines",
  "Golden, CO",
  monthYear(7, 2021),
  monthYear(5, 2025),
  [
    Bachelor of Science, Computer Science #h(1fr) CSCI GPA: 3.04
  ],
)

#v(NEW_SECTION_SPACE)

#svgHeader("./icons/circle-info-solid.svg", "SKILLS")

#table(
  stroke: none,
  columns: 2,
  row-gutter: -0.5em,
  [*Languages*], [| Python3, C/C++, Go, Java, JavaScript, Lua, Postgres],
  [*Developer Tools*], [| Linux, Docker, Git, PlatformIO, Makefile],
  [*Libraries/Frameworks*], [| Node.js, Flask, NumPy, Matplotlib],
)

#v(NEW_SECTION_SPACE)

#svgHeader("./icons/briefcase-solid.svg", "WORK EXPERIENCE")

#exprItem(
  "Research Internship",
  "CSM & National Science Foundation",
  monthYear(6, 2024),
  monthYear(9, 2024),
  list(
    [
      Automated data aggregation, filtering, and processing with *Python* and
      *Pandas*.
    ],
    [
      Trained *SciKitLearn* models to identify vulnerable network data.
    ],
    [
      Collaborated closely with graduate student Su Wang and Prof. Dong Chen,
      providing daily progress reports and weekly updates.
    ],
  ),
)

#exprItem(
  "Product Development Internship",
  "Analytical Data Systems",
  monthYear(6, 2023),
  monthYear(8, 2023),
  list(
    [
      Developed a toolchain to have LLMs to introspect and reprompt for more
      normalized results based on user-defined qualitied.
    ],
    [
      Implemented several interfaces to interact with the service from Discord
      or a custom web client in *JavaScript*.
    ],
    [
      Created a scaling backend infrastructure to handle user permissions and
      requests in *Go*.
    ],
  ),
)

#exprItem(
  "Data Infrastructure Freelance",
  "Computer Engineering Group",
  monthYear(3, 2020),
  monthYear(6, 2020),
  list([
    Built a solution to manage customer device data before repair in *C\#*,
    *.NET*, and *PSQL*.
  ]),
)

#v(NEW_SECTION_SPACE)

#svgHeader("./icons/code-solid.svg", "NOTABLE PROJECTS")

#exprItem("Plummet", "Author", monthYear(1, 2023), TODAY, list(
  [
    An *ACM* project I led with the goal of implementing a cross-platform
    language.
  ],
  [
    Created technical specification documents for the language and package
    manager.
  ],
  [
    Implemented toolchain to manage packages and compile programs into
    *x86\_64 ASM* using *Go*.
  ],
))

#exprItem(
  "Keyboard OS",
  "Author",
  monthYear(1, 2023),
  monthYear(12, 2024),
  list(
    [
      Prototyped hardware and firmware with *PlatformIO*.
    ],
    [
      Created a DSL that abstracted the *Adafruit GFX* library to control an
      on-device screen in *C++*.
    ],
  ),
)

#exprItem("Leaf Lang", "Author", monthYear(8, 2022), monthYear(1, 2023), list([
  An interpreted/transpiled procedural dynamically-typed stack-based
  programming language written in *Python*.
]))

#exprItem(
  "Robotics Software Engineer",
  "FRC #7667",
  monthYear(11, 2018),
  monthYear(6, 2019),
  list(
    [
      Competed in the 2019 Houston World Championship.
    ],
    [
      Fabricated and implemented a game piece manipulation mechanism using *C++*
      and *WPILIB*.
    ],
  ),
)
