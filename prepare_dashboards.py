import yaml
import json
import os

if __name__ == "__main__":
    

    for subdir, dirs, files in os.walk('dashboards'):
        for file in files:            
            filepath = subdir + os.sep + file
            print (filepath)

            with open(filepath, 'r') as f:
                data = json.load(f)
                if "id" in data:
                    del data["id"]
                if "uid" in data:
                    del data["uid"]   
                if "version" in data:
                    data["version"] = 1
                
                
            with open(filepath, 'w') as f:
                json.dump(data, f, indent=4)
