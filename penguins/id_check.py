student_ids = {
    2113888 : "Ramsamy John Michael Geordan",
    2112942 : "Bhutoo Pooshan",
    2116221 : "Bissessur Sheilee",
    2111112 : "Bhundoqa Sejal",
    2118125 : "Cheddee Tarushi",
    2110573 : "Chengadoo Kartikeye",
    2116979 : "Chinasamy Saraspadee",
    2110393 : "Dhokee Ruhiyya",
    2117862 : "Gaungoo Nabiihah",
    2113922 : "Gentil Anne-Laure",
    2116887 : "Gooroochurn Vanshika",
    2111643 : "Issuree Prajay",
    2116249 : "Kallychurun Rahul",
    2111001 : "Lalit Rishabh",
    2117092 : "L'amour Emilie",
    2116470 : "Laurent Adriana",
    2116530 : "Luximon Drishtee",
    2113666 : "Meunier Korally",
    2118330 : "Moothia Dhushiven",
    2116310 : "Munjhureea Dushyant",
    2117030 : "Muthy Tanusha",
    2116473 : "Muttur Devisha",
    2117111 : "Nemours Audriana",
    2116237 : "Pillyappadoo Kareena",
    2115276 : "Rambhojoo Reshav",
    2116074 : "Somaroo Meenal",
    2117230 : "Toory Vaishnav",
    2011016 : "Ayikullu Urumi"
}

def who_tf (id = None, name = ""):
    if name == "" and id != None:
        try:
            student = student_ids[id]
            print(f"{student} is the student with id: {id}.")
        except KeyError:
            #print(f"Student with id: {id} not found.")
            print("error")
    elif id == None and name != "":
        try:
            id_num = student_ids[name]
            print(f"{id_num} is the id of {name}.")
        except KeyError:
            print("Student not found.")
    else:
        print("Sorry please input a name or id.")

import pandas as pd

classmates = pd.read_csv("~/Documents/ids.csv")
for classmate in classmates["ids"]:
    if who_tf(classmate) == "error":
        print(classmate)
    else:
        pass
