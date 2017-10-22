from tkinter import *
from PIL import Image, ImageTk
import os
import time

def printcoordinates(click):
    f.write(str(click.x) + " " + str(click.y) + "\n")
    print(click.x, click.y)
    global clickCount
    global topLeft
    global bottomRight
    clickCount += 1
    if (clickCount == 1):
        topLeft.append(click.x)
        topLeft.append(click.y)
    if (clickCount == 2):
        bottomRight.append(click.x)
        bottomRight.append(click.y)

clickCount = 0
topLeft = []
bottomRight = []
root = Tk()
w = Canvas(root, width=700, height=500)
Folder = "C:/Users/ryanm/Desktop/University aka School/FYP/Data Sets/snapshots"

directory = os.fsencode(Folder)

for File in os.listdir(directory):
    w.delete("all")
    clickCount = 0

    filename = os.fsdecode(File)
    if filename.endswith(".jpg"):

        w.pack()

        originFile = Folder + '/' + filename
        infile = Image.open(originFile)
        infile = infile.resize((700, 500))  # resize image
        # keep track of the original image size
        # if using matlab use guide
        # make sure im resize in matlab is bicubic
        img = ImageTk.PhotoImage(infile)
        w.create_image(0, 0, image=img, anchor="nw")

        txt_save_path = Folder

        fileName = os.path.basename(filename)
        print(fileName)
        first = fileName[0:len(fileName) - 4]
        print(first + ".txt")
        completeName = os.path.join(txt_save_path, first + ".txt")
        f = open(completeName + ".txt", "w")

        # mouseclick event
        w.bind("<Button 1>", printcoordinates)

        while clickCount < 2:
            root.update_idletasks()
            root.update()

        f.close()

        imgCrop = infile.crop((topLeft[0], topLeft[1], bottomRight[0], bottomRight[1]))
        imgCrop = imgCrop.resize((250, 50))
        imgCropPrint = ImageTk.PhotoImage(imgCrop)

        imgCrop.save('C:/Users/ryanm/Desktop/University aka School/FYP/Data Sets/License Plate Database/' + filename, 'JPEG')

        del topLeft[:]
        del bottomRight[:]

        currentTime = time.clock()

        while currentTime + 1 > time.clock():
            root.update_idletasks()
            root.update()
