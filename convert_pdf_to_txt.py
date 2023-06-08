import pdftotext

# Load your PDF
with open("/app/examples/patrick_grenning_resume.pdf", "rb") as in_file:
    pdf = pdftotext.PDF(in_file)

# Save the text to a file
with open("/app/examples/patrick_grenning_resume.txt", "w") as out_file:
    out_file.write("\n\n".join(pdf))
