import pandas as pd

 
df = pd.read_csv("dataset/creditcard.csv")


print(df.head())
print(df.tail())
print(df.shape)
print(df.columns)
print(df.info())
print(df.describe())

#data cleaning

print(df.isnull().sum())
print(df.duplicated().sum())
df = df.drop_duplicates()
print(df.duplicated().sum())

#EDA

print(len(df))
print(df["Class"].value_counts())

fraud = df["Class"].value_counts()[1]

total = len(df)

percentage = fraud/total*100

print(percentage)
print(df["Amount"].mean())
print(df["Amount"].max())
print(df["Amount"].min())

fraud_data = df[df["Class"]==1]
genuine_data = df[df["Class"]==0]
print(fraud_data["Amount"].mean())
print(genuine_data["Amount"].mean())

#Visualization

import seaborn as sns
import matplotlib.pyplot as plt

sns.countplot(x="Class", data=df)

plt.show()
sns.histplot(df["Amount"])
sns.boxplot(x="Class",y="Amount",data=df)
sns.heatmap(df.corr())

#changing names of columns 
df["Hour"]=(df["Time"]//3600)%24
df["Amount_Category"]=pd.cut(
df["Amount"],
bins=[0,100,1000,5000,100000],
labels=["Low","Medium","High","Very High"]
)
import numpy as np


df["High_Value"] = np.where(df["Amount"] > 1000, 1, 0)

df = df.sample(75000, random_state=42)

df.to_csv("final_creditcard.csv", index=False, header=False)

