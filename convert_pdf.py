import pdftotext

# save to txt
with open("/app/examples/patrick_grenning_resume.pdf", "rb") as in_file:
    pdf = pdftotext.PDF(in_file)

with open("/app/examples/patrick_grenning_resume.txt", "w") as out_file:
    out_file.write("\n\n".join(pdf))

# convert to pdf
from pdf2image import convert_from_path

# Convert each page of the PDF to an image
images = convert_from_path("/app/examples/patrick_grenning_resume.pdf")

# Check the number of pages in the PDF
len(images)


from PIL import Image

# Combine the images vertically
combined = Image.new('RGB', (max(img.width for img in images), sum(img.height for img in images)))

y_offset = 0
for img in images:
    combined.paste(img, (0, y_offset))
    y_offset += img.height

# Save the combined image as a PNG
combined.save("/app/examples/patrick_grenning_resume.png")


