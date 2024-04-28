import pandas as pd
from sqlalchemy import create_engine
pip install mysql-connector-python

# Replace 'your_username', 'your_password', 'your_host', and 'your_database' with your actual MySQL credentials
url = 'mysql+mysqlconnector://root:Athulya@1199@localhost:3306/autism'

engine = create_engine(url)

# Now you can use the 'engine' to connect to your MySQL database


# Load data from the SQL table into a Pandas DataFrame
query = 'SELECT * FROM autism.cleaned_data'
cleaned_data = pd.read_sql(query, engine)

print(cleaned_data.head())
print(cleaned_data.describe(include='all'))
print(cleaned_data.info())


missing_values = cleaned_data.isnull().sum()
print(missing_values)

duplicate_rows = cleaned_data[cleaned_data.duplicated()]


# Assuming 'data' is your DataFrame
data_without_duplicates = cleaned_data.drop_duplicates()

# Displaying the DataFrame without duplicates
print("DataFrame without Duplicate Rows:")
print(data_without_duplicates)


s= cleaned_data['probability']
q1= s.quantile(0.25)
q3= s.quantile(0.75)
iqr= q3 - q1
iqr_lower = q1 - 1.5* iqr
iqr_upper = q3 + 1.5* iqr
outliers = dict (s[(s < iqr_lower)| (s > iqr_upper)])

# Count the number of outliers
num_outliers = len(outliers)

# Calculate the percentage of outliers
percentage_outliers = (num_outliers / len(s)) * 100

# Print the results
print(f"Number of outliers: {num_outliers}")
print(f"Percentage of outliers: {percentage_outliers:.2f}%")

# Cap the outliers
cleaned_data['probability'] = cleaned_data['probability'].clip(lower=0.68, upper=1.19)

# Save cleaned data to a CSV file
cleaned_data.to_csv("C:/Users/athuu/OneDrive/Desktop/cleaned_asd.csv", index=False)

import pandas as pd

# Read the CSV file into a DataFrame
cleaned_asd = pd.read_csv('cleaned_asd.csv')

# Display the first few rows of the loaded data
print(cleaned_asd.head())


