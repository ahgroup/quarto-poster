// This function gets your whole document as its `body` and formats
// it as a scientific poster.
#let poster(
  // The poster's size in inches, e.g. "48x36" or "36x48".
  size: "48x36",

  // The poster's title.
  title: "Poster Title",

  // A string of author names.
  authors: "Author Names (separated by commas)",

  // Department or affiliation line.
  departments: "Department Name",

  // Full-width poster banner. The Quarto template builds this function in the
  // user's document so paths are resolved relative to the poster source file.
  banner: (width => []),

  // Footer text.
  // For instance, Name of Conference, Date, Location.
  // or Course Name, Date, Instructor.
  footer_text: "Footer Text",

  // Whether to draw the footer bar.
  show_footer: "true",

  // Any URL, like a link to the conference website.
  footer_url: "Footer URL",

  // Email IDs of the authors.
  footer_email_ids: "Email IDs (separated by commas)",

  // Color of the footer and section heading bars.
  footer_color: "Hex Color Code",

  // Header text color.
  header_text_color: "111111",

  // Whether to draw the built-in header. Set false for fully custom Typst layouts.
  show_header: "true",

  // Font size of the poster body text, in pt.
  body_font_size: "24",

  // Any keywords or index terms that you want to highlight at the beginning.
  keywords: (),

  // Number of columns in the poster.
  num_columns: "3",

  // Header row height, in inches. This should roughly match the visual height
  // of the banner image.
  title_row_size: "5.5",

  // Poster title's font size, in pt.
  title_font_size: "66",

  // Authors' font size, in pt.
  authors_font_size: "34",

  // Departments/affiliations font size, in pt.
  department_font_size: "26",

  // Footer's URL and email font size, in pt.
  footer_url_font_size: "26",

  // Footer's text font size, in pt.
  footer_text_font_size: "34",

  // Page margins, in inches.
  margin_top: "0.15",
  margin_left: "1",
  margin_right: "1",
  margin_bottom: "1.8",

  // Extra space after the header, in pt.
  space_after_header: "12",

  // The poster's content.
  body
) = {
  let sizes = size.split("x")
  let width = float(sizes.at(0)) * 1in
  let height = float(sizes.at(1)) * 1in

  body_font_size = int(body_font_size) * 1pt
  title_font_size = int(title_font_size) * 1pt
  authors_font_size = int(authors_font_size) * 1pt
  department_font_size = int(department_font_size) * 1pt
  footer_url_font_size = int(footer_url_font_size) * 1pt
  footer_text_font_size = int(footer_text_font_size) * 1pt
  let header_text_fill = rgb(header_text_color)
  show_header = show_header == "true"
  show_footer = show_footer == "true"
  num_columns = int(num_columns)
  title_row_size = float(title_row_size) * 1in
  margin_top = float(margin_top) * 1in
  margin_left = float(margin_left) * 1in
  margin_right = float(margin_right) * 1in
  margin_bottom = float(margin_bottom) * 1in
  space_after_header = float(space_after_header) * 1pt

  // Set the body font. Typst will substitute if the requested font is absent.
  set text(font: "STIX Two Text", size: body_font_size)

  // Configure the page. The banner is a background image spanning the top of
  // the page; the title/author block is overlaid as normal content at the top.
  set page(
    width: width,
    height: height,
    margin: (top: margin_top, left: margin_left, right: margin_right, bottom: margin_bottom),
    background: align(center + top, banner(100%)),
    footer: if show_footer [
      #set align(center)
      #set text(fill: white)
      #block(
        fill: rgb(footer_color),
        width: 100%,
        inset: 16pt,
        radius: 8pt,
        [
          #text(font: "Courier", size: footer_url_font_size, footer_url)
          #h(1fr)
          #text(size: footer_text_font_size, smallcaps(footer_text))
          #h(1fr)
          #text(font: "Courier", size: footer_url_font_size, footer_email_ids)
        ]
      )
    ] else { none }
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // Configure headings.
  set heading(numbering: none)
  show heading: it => context {
    set text(weight: 400)
    if it.level == 1 [
      #v(18pt, weak: true)
      #block(
        fill: rgb(footer_color),
        width: 100%,
        inset: (x: 12pt, y: 8pt),
      )[
        #set align(left)
        #set text(30pt, fill: white, weight: 700)
        #it.body
      ]
      #v(10pt, weak: true)
    ] else if it.level == 2 [
      #set text(22pt, weight: 600)
      #v(12pt, weak: true)
      #it.body
      #line(length: 35%, stroke: 0.8pt + rgb(footer_color))
      #v(4pt, weak: true)
    ] else [
      _#(it.body):_
    ]
  }

  // Header text over the banner.
  if show_header {
    align(center + top,
      block(width: 100%, height: title_row_size)[
        #set align(center)
        #v(0.35in)
        #par(leading: 0.62em, text(title_font_size, header_text_fill, title, weight: 700))
        #v(0.22in)
        #text(authors_font_size, header_text_fill, authors, weight: 600)
        #v(0.14in)
        #text(department_font_size, header_text_fill, departments)
      ]
    )

    v(space_after_header)
  }

  // Start column mode and configure paragraph properties. Set num_columns to 1
  // when the poster body provides its own explicit Typst grid/layout.
  if num_columns > 1 {
    show: columns.with(num_columns, gutter: 0.7in)
  }
  set par(justify: true, first-line-indent: 0em, spacing: 0.65em)

  // Display the keywords.
  if keywords != () [
      #set text(22pt, weight: 400)
      #show "Keywords": smallcaps
      *Keywords* --- #keywords.join(", ")
  ]

  // Display the poster's contents.
  body
}
