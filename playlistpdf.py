# Code modified from https://py-pdf.github.io/fpdf2/Tutorial.html#tuto-5-creating-tables

import csv
from fpdf import FPDF
from fpdf.fonts import FontFace
from fpdf.enums import TableCellFillMode


with open("dance.csv", encoding="utf8") as csv_file:
    data = list(csv.reader(csv_file, delimiter=","))

pdf = FPDF(orientation="P", unit="mm", format="A4")
pdf.set_font("helvetica", size=6)


pdf.add_page()
pdf.set_draw_color(51, 51, 102)
pdf.set_line_width(0.1)
headings_style = FontFace(emphasis="BOLD", color=255, fill_color=(51, 51, 102))
with pdf.table(
    borders_layout="NO_HORIZONTAL_LINES",
    cell_fill_color=(224, 235, 255),
    cell_fill_mode=TableCellFillMode.ROWS,
    col_widths=(189, 106, 106, 84, 84, 84, 84, 84, 127, 63, 63, 127),
    headings_style=headings_style,
    line_height=6,
    text_align=("LEFT", "LEFT", "CENTER", "CENTER", "CENTER", "CENTER", "CENTER", "CENTER", "CENTER", "CENTER", "CENTER", "CENTER"),
    width=180,
) as table:
    for i, data_row in enumerate(data):
        row = table.row()
        for datum in data_row:
            if i == 0:
                row.cell(datum, align='C')
            else:
                row.cell(datum)

pdf.output("playlist.pdf")
