import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

historical = pd.read_csv('History.csv')
print(list(historical.columns))

Trading = historical[["Date(UTC)","type","Amount"]]
PnL = Trading[Trading["type"].isin(['COMMISSION', 'FUNDING_FEE', 'REALIZED_PNL'])]
print("The total profits you made for the period was: $" + str(sum(PnL["Amount"])))
print(PnL.describe())
print(PnL["type"].unique())
PnL_mat = PnL[(PnL["Amount"] > 0.2) | (PnL["Amount"] < -0.2)]
PnL_mat["Date(UTC)"] = pd.to_datetime(PnL_mat["Date(UTC)"])
# convert datetime values to seconds
PnL_mat["Time"] = PnL_mat["Date(UTC)"].astype('int64') // 10**9

plt.scatter(PnL_mat["Date(UTC)"], PnL_mat["Amount"])
plt.xticks(rotation=45)

x = PnL_mat["Time"]
y = PnL_mat["Amount"]
z = np.polyfit(x, y, 1)
p = np.poly1d(z)
plt.plot(PnL_mat["Date(UTC)"], p(x),"r--")

plt.show()