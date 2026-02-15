// Merged Typst template: template.typ + tmplt.typ
// Generated on 2025-10-23. Both sources preserved verbatim.
// Sections are delimited for clarity. No naming conflicts detected.

// ===== BEGIN: template.typ =====
// ETH Zurich Submission Template (fixed: no #v / #line / #h)

// ------------------------------------------------------------
// PAGE SETUP
// ------------------------------------------------------------
#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2cm,
    left: 2.5cm,
    right: 2.5cm
  )
)

// ------------------------------------------------------------
// TYPOGRAPHY
// ------------------------------------------------------------

// AMS-style typography sizes
#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 11.74988pt
#let extra-large-size = 18pt

#set text(
  size: normal-size,
  lang: "en"
)

#set par(
  spacing: 0.58em,
  first-line-indent: 1.2em,
  justify: true
)

// ------------------------------------------------------------
// HEADING STYLES
// ------------------------------------------------------------
#set heading(numbering: "1.")

#show heading.where(level: 1): it => [
  #set text(size: normal-size, weight: "bold")
  #block(above: 1.5em, below: 1em)[#it]
]

#show heading.where(level: 2): it => [
  #set text(size: small-size, weight: "bold")
  #block(above: 1.2em, below: 0.8em, inset: (left: 1em))[#it]
]

#show heading.where(level: 3): it => [
  #set text(size: small-size, weight: "semibold")
  #block(above: 1em, below: 0.8em, inset: (left: 2em))[#it]
]

// ------------------------------------------------------------
// ETH SOLUTION HEADER
// ------------------------------------------------------------
#let eth-solution(
  course: "",
  department: "",
  professor: "",
  semester: "",
  assignment-title: "",
  due-date: none,
  authors: (),
  body
) = {

  grid(
    columns: (1fr, 1fr),
    align: (left, right),
    column-gutter: 2em,
    [
      #text(size: large-size, weight: "bold")[ETH Zurich] \
      #if department != "" [
        #text(size: normal-size)[#department]
      ]
    ],
    [
      #if course != "" [
        #text(size: large-size, weight: "semibold")[#course] \
      ]
      #if professor != "" [
        #text(size: normal-size)[Prof. #professor] \
      ]
      #if semester != "" [
        #text(size: small-size)[#semester]
      ]
    ]
  )

  v(1.5em)

  align(center)[
    #text(size: extra-large-size, weight: "bold")[
      #assignment-title
    ]
    #if due-date != none [
      #v(0.5em)
      #text(size: small-size)[Due: #due-date]
    ]
  ]

  v(1em)

  if authors.len() > 0 {
    text(size: normal-size)[
      #for (i, author) in authors.enumerate() [
        #author.name (#author.id, TA: #author.ta)
        #if i < authors.len() - 1 [ \ ]
      ]
    ]
  }

  v(1em)
  line(length: 100%, stroke: 0.3pt)
  v(1.2em)

  body
}

// ------------------------------------------------------------
// PROBLEM STRUCTURE
// ------------------------------------------------------------
#let problem(number, title: none, body) = [
  #block(
    breakable: true,
    above: 1.5em,
    below: 1em,
    [
      #text(size: large-size, weight: "bold")[
        Problem #number
        #if title != none [ - #title]
      ]
  #v(0.8em)
      #body
    ]
  )
]

#let subproblem(letter, body) = [
  #block(
    above: 1em,
    below: 0.8em,
    [
      #text(size: normal-size, weight: "semibold")[(#letter)]
  #h(0.5em)
      #body
    ]
  )
]

#let solution(body) = [
  #block(
    above: 0.5em,
    below: 0.8em,
    [
  #text(size: normal-size, weight: "semibold")[Solution:] \
  #v(0.3em)
      #body
    ]
  )
]

#let theorem(title, body) = [
  #block(
    above: 1em,
    below: 1em,
    [
      #text(weight: "bold")[#title.] #emph[#body]
    ]
  )
]

#let proof(body) = [
  #block(
    above: 0.5em,
    below: 1em,
    [
  #text(weight: "bold")[Proof.] #body #h(1fr) $square$
    ]
  )
]

// ------------------------------------------------------------
// END OF template.typ CONTENT
// ------------------------------------------------------------


// ===== BEGIN: tmplt.typ =====
#let function-table(inputs: 2, outputs, values) = {
  let (outputs, values) = if type(outputs) == array {
    (outputs, values)
  } else {
    ((outputs,), (values,))
  }
  table(
    columns: inputs + 1 + outputs.len(),
    align: center,
    stroke: (x, y) => if y == 0 { (bottom: black) } + if x != 0 { (left: black) },
    inset: (5pt,) * inputs + (1.5pt,) + (5pt,) * outputs.len(),
    table.header(..range(65, 65 + inputs).map(x => $italic(#str.from-unicode(x))$), "", ..outputs),
    ..range(calc.pow(2, inputs))
      .map(n => (
        range(inputs).map(x => calc.pow(2, x)).rev().map(x => str(calc.min(n.bit-and(x), 1)))
          + ("",)
          + range(outputs.len()).map(i => str(values.at(i, default: ()).at(n, default: 0)))
      ))
      .flatten()
  )
}

#let lemma(body) = block[_Lemma._ #body]

// ===== END: tmplt.typ =====
