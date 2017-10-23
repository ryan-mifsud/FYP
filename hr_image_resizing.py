from tkinter import *
from PIL import Image, ImageTk

root = Tk()
w = Canvas(root, width=250, height=50)
w.pack()

foo = Image.open("C:/Users/ryanm/Desktop/University aka School/FYP/Data Sets/License Plate Database/P1010035.jpg")
im_size = foo.size
print(im_size)

foo.save("C:/Users/ryanm/Desktop/University aka School/FYP/Data Sets/Test Hr with lower quality/sample6.jpg",quality=4)

foo2 = Image.open("C:/Users/ryanm/Desktop/University aka School/FYP/Data Sets/Test Hr with lower quality/sample6.jpg")

foo3 = ImageTk.PhotoImage(foo2)
w.create_image(0, 0, image=foo3, anchor="nw")

root.mainloop()

#images which were tested were found to have decreased their size by an average of 320% (example: 4.17Kb - original to 1.22Kb - resized)