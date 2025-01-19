import random
import os
import json

for dir in os.listdir():
    if not os.path.isdir(dir):
        continue
    for file in os.listdir(dir):
        if file.endswith(".txt"):
            continue
        question = {}
        with open(f"{dir}/{file}", 'r') as f:
            print(f"change {dir}/{file}")
            question = json.load(f)
        with open(f"{dir}/{file}", 'w') as f:
            correct = question["correct"]
            new = random.choice(['A', 'B', 'C', 'D'])
            old = question[new]
            question[new] = question[correct]
            question[correct] = old
            question["correct"] = new
            json.dump(question, f)
                
                