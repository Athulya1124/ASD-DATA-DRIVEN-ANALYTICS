pip install pandas
import pandas as pd
 pip install numpy
import numpy as sns
pip install matplotlib
import matplotlib.pyplot as plt
pip install seaborn
import seaborn as sns
 pip install scikit-learn
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

import pandas as pd
df=pd.read_csv(r"C:\asd project\Data.csv")
pip install sweetviz
import sweetviz as sv
analyze_report=sv.analyze(df)
analyze_report.show_html('report.html')

pip install autoviz
from autoviz.AutoViz_Class import AutoViz_Class
av = AutoViz_Class()
a = av.AutoViz(r"C:\asd project\Data.csv")

data=pd.read_csv(r"C:\asd project\Data.csv")
pip install dtale 
import dtale 
d = dtale.show(data) 
d.open_browser()

pip install pandas_profiling
from pandas_profiling import ProfileReport
data=pd.read_csv(r"C:\asd project\Data.csv")
p = ProfileReport(data) 
p.to_file("output.html")

pip install dataprep
from dataprep.eda import create_report 
data=pd.read_csv(r"C:\asd project\Data.csv")
report = create_report(data, title='My Report') 
report.show_browser()
