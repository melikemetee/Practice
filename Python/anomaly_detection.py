import pandas as pd

# Step 1: Creating a synthetic financial transaction dataset
data = {
    'Customer_ID': [101, 102, 103, 104, 101, 105, 102, 106],
    'Transaction_Amount_USD': [150, 45000, 200, 350, 150, 85000, 400, 120],
    'Location': ['Istanbul', 'Ankara', 'Izmir', 'Istanbul', 'Istanbul', 'Ankara', 'Miami', 'Izmir'],
    'Transaction_Type': ['Retail', 'Electronics', 'Apparel', 'Restaurant', 'Retail', 'Jewelry', 'ATM Withdrawal', 'Restaurant']
}

df = pd.DataFrame(data)
print("📊 Original Dataset:\n", df, "\n" + "-"*60)

# Step 2: Data Preprocessing & Cleaning
# Removing duplicate transaction records to ensure data integrity
df = df.drop_duplicates()

# Step 3: Rule-Based Rule Engineering (Anomaly Detection)
# Rule 1: Transactions above $10,000 are flagged as High Risk.
# Rule 2: Transactions initiated from overseas locations (e.g., Miami) are flagged for review.

high_amount = df['Transaction_Amount_USD'] > 10000
overseas = df['Location'] == 'Miami'

# Filtering the "Suspicious" transactions based on the engineered rules
suspicious_transactions = df[high_amount | overseas]

print("🚨 Flagged Suspicious Activity Report:\n", suspicious_transactions, "\n" + "-"*60)

# Step 4: Data Pipeline Export
# Exporting the flagged anomalies into a CSV report for the risk management team
suspicious_transactions.to_csv('suspicious_transactions_report.csv', index=False)
print("💾 Success! 'suspicious_transactions_report.csv' has been generated and saved.")
