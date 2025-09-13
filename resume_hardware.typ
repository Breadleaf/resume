
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
    #v(0.25em)
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
    // (707)-302-9750 #sym.bullet bradleyhutchings\@mines.edu
    (707)-302-9750 #sym.bullet bkhnapa\@gmail.com
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

// #svgHeader("./icons/comment-solid.svg", "PROFILE")

// #text(size: SizeFont.expr)[
//   I am a passionate computer scientist with a strong foundation in
//   software development and problem-solving. I am a dedicated lifelong learner with lots of curiosity!
// ]

#v(NEW_SECTION_SPACE + 0.3em)

#svgHeader("./icons/graduation-cap-solid.svg", "EDUCATION")

#exprItem(
  "Colorado School of Mines",
  "Golden, CO",
  monthYear(7, 2021),
  monthYear(5, 2025),
  [
    Bachelor of Science, Computer Science #h(1fr) CSCI GPA: 3.04
    #v(NEW_SECTION_SPACE + 0.5em)
    Mines EE Classes: *Circuits*, *Digital Logic*, *PCB Design*, and *Elements of Computing*.
  ],
)

#exprItem(
  "Napa Valley College",
  "Napa, CA",
  monthYear(1, 2017),
  monthYear(1, 2021),
  [
    Certifications: *Autodesk Fusion360*
  ],
)

#v(NEW_SECTION_SPACE)

#svgHeader("./icons/circle-info-solid.svg", "TECHNICAL SKILLS")

#v(NEW_SECTION_SPACE + 0.5em)
#table(
  stroke: none,
  columns: 2,
  row-gutter: -0.5em,
  [*Software Tools*],
  [| Linux, Git, PlatformIO, Fusion360, EagleCAD, FreeCAD, KiCAD],

  [*Hardware Tools*], [| Oscilloscope, Arduino, THT & SMD Soldering],
  [*Languages*], [| Python3, C/C++, Rust, Go, JavaScript, Postgres SQL],
  [*Protocols*], [| I2C, SPI],
)

#v(NEW_SECTION_SPACE - 0.75em)

#svgHeader("./icons/briefcase-solid.svg", "WORK EXPERIENCE")

#exprItem(
  "Contractor Work: Tech Lead & Manager",
  "SwingLens LLC",
  monthYear(5, 2025),
  monthYear(6, 2025),
  list(
    [
      Managed a team of 7 intern engineers whilst working closely with other advisors.
    ],
    [
      Advised on *Python*, *Flask*, *Hardware* configuration, and industry programming practices.
    ],
    [
      Developed and open-sourced a *Python* tool for importing *Jupyter Notebooks*.
    ],
  ),
)

#exprItem(
  "Research Internship",
  "CSM & National Science Foundation",
  monthYear(5, 2024),
  monthYear(9, 2024),
  list(
    [
      Automated data aggregation, filtering, and processing with *Python* and
      *Pandas*.
    ],
    [
      Trained *SciKitLearn* models to identify vulnerable network data.
    ],
    //[
    //  Collaborated closely with graduate student Su Wang and Prof. Dong Chen,
    //  providing daily progress reports and weekly updates.
    //],
  ),
)

#exprItem(
  "Product Development Internship",
  "Analytical Data Systems",
  monthYear(5, 2023),
  monthYear(8, 2023),
  list(
    [
      Developed a toolchain to have LLMs to introspect and reprompt for more
      normalized results based on user-defined qualities.
    ],
    [
      Implemented several interfaces to interact with the service from Discord
      or a custom web client in *JavaScript*.
    ],
    // [
    //   Created a scaling backend infrastructure to handle user permissions and
    //   requests in *Go*.
    // ],
  ),
)

// #exprItem(
//   "Data Infrastructure Freelance",
//   "Computer Engineering Group",
//   monthYear(3, 2020),
//   monthYear(6, 2020),
//   list([
//     Built a solution to manage customer device data before repair in *C\#*,
//     *.NET*, and *PSQL*.
//   ]),
// )

#v(NEW_SECTION_SPACE)

#svgHeader("./icons/code-solid.svg", "PROJECTS")

// #exprItem(
//   "Distributed Custom ISA Execution Environment",
//   "Author",
//   monthYear(4, 2025),
//   TODAY,
//   box[
//     #text[
//       Designed and am working towards implementing a complete, custom computing ecosystem, including an *Instruction Set Architecture* (ISA), *Assembler*, *Virtual Machine* (VM), and a *TCP* machine state transmission networking protocol. The system enables distributed execution of custom machine code across a client-router-server architecture.
//     ]
//     #list(
//       [
//         The custom *8-bit ISA* is executed by a corresponding *VM* developed in *Go*, featuring 256-bytes of RAM.
//       ],
//       [
//         The custom *TCP* networking protocol implemented in *Go*, enables distributed execution by transmitting machine state packets between client, router, and server.
//       ],
//       [
//         The *assembler* translates human-readable assembly into the custom ISA's machine code using a *LL(1) Tabular Parser* dynamically generated applying *Formal Language Theory* algorithms.
//       ],
//     )
//   ],
// )

#exprItem(
  "NovaMill Open Hardware PCB Mill",
  "Author",
  monthYear(7, 2025),
  TODAY,
  box[
    #text[
      NovaMill is a work in progress Open Hardware desktop PCB Mill with the goal of making rapid PCB prototyping easier as faster.
    ]
    #list(
      [
        Real-time motor and sensor control with *Pi Pico 2 W* running *Marlin*.
      ],
      [
        *Pi Zero 2 W* running custom *Linux* distribution for on-device *machine learning* corrections.
      ],
    )
  ],
)

#exprItem(
  "BreadLeaf-8 (BL-8) Hardware Implementation",
  "Author",
  monthYear(6, 2025),
  TODAY,
  box[
    #text[
      Working towards implementing my custom *8-bit* Computer based on *74HC* chips. The architecture is based on my *Distributed Custom ISA Execution Environment* software project.
    ]
    #list(
      [
        Designed and iterating on *custom toolchain* to edit my CPU's *microcode*.
      ],
      [
        Implementing *FPGA* adaptaion to be implemented in *Tiny Tapeout ASIC* project.
      ],
    )
  ],
)

#exprItem(
  "BreadPod (Muserve Hardware Companion)",
  "Author",
  monthYear(9, 2024),
  TODAY,
  box[
    #text[ ]
    #list(
      [
        *ESP32* based music player with touch control.
      ],
      [
        Communicates with *Muserve Server* software project.
      ],
    )
  ],
)

// #exprItem("Plummet", "Author", monthYear(1, 2023), TODAY, list(
//   [
//     An *ACM* project I led with the goal of implementing a cross-platform
//     language.
//   ],
//   [
//     Created technical specification documents for the language and package
//     manager.
//   ],
//   [
//     Implemented toolchain to manage packages and compile programs into
//     *x86\_64 ASM* using *Go*.
//   ],
// ))

// #exprItem(
//   "Keyboard OS",
//   "Author",
//   monthYear(1, 2023),
//   monthYear(12, 2024),
//   list(
//     [
//       Prototyped hardware and firmware with *PlatformIO*.
//     ],
//     [
//       Created a DSL that abstracted the *Adafruit GFX* library to control an
//       on-device screen in *C++*.
//     ],
//   ),
// )

// #exprItem("Leaf Lang", "Author", monthYear(8, 2022), monthYear(1, 2023), list([
//   An interpreted/transpiled procedural dynamically-typed stack-based
//   programming language written in *Python*.
// ]))

//#exprItem(
//  "Zine App",
//  "Author",
//  monthYear(3, 2025),
//  TODAY,
//  list(
//    [
//      Architecting the backend in *Go*, featuring microservices for authentication and *MinIO/S3 storage integration*, alongside *Redis* with a *custom Go wrapper* for session management.
//    ],
//    [
//      Developing the *frontend with TypeScript and React (using Vite)*, with *NGINX* for reverse proxying backend services and *Docker Compose* for containerized deployment.
//    ],
//  ),
//)

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
