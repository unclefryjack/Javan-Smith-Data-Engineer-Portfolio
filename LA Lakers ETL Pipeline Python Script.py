#Javan Smith LA Lakers ETL Pipeline Project

import pandas as pd
import mysql.connector

file_path = r"C:\Users\javan\OneDrive\Documents\Los Angeles Lakers 2024-2025 Stats.xlsx"
xls = pd.ExcelFile(file_path)
df_player = xls.parse('Player_Stats')
df_game = xls.parse('Game_Stats')
df_monthly=xls.parse('Monthly_Player_Stats')

conn = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password= "@szaismyGod9",
    database= "Lakers_ETL"
    )

cursor = conn.cursor()

cursor.execute( "DROP TABLE IF EXISTS PlayerStats")
cursor.execute ( """
CREATE TABLE PlayerStats (
PlayerID INT PRIMARY KEY,
JerseyNumber INT,
FirstName VARCHAR (50),
LastName VARCHAR (50),
Position VARCHAR (50),
YearsPro INT,
Age INT,
PointsPerGame FLOAT,
AssistsPerGame FLOAT,
ReboundsPerGame FLOAT,
StealsPerGame FLOAT,
BlocksPerGame FLOAT,
TurnoversPerGame FLOAT,
ThreePointPercentage FLOAT,
FreeThrowPercentage FLOAT,
MinutesPerGame FLOAT,
GamesPlayed INT,
PointsTotal INT,
ReboundsTotal INT,
AssistsTotal INT,
StealsTotal INT,
BlocksTotal INT,
TurnoversTotal INT,
ThreePointsTotal INT,
FreeThrowTotal INT,
MinutesTotal INT
) """)

for _, row in df_player.iterrows():
    sql = """
INSERT INTO PlayerStats (
PlayerID, JerseyNumber, FirstName, LastName, Position, YearsPro, Age, PointsPerGame,
AssistsPerGame, ReboundsPerGame, StealsPerGame, BlocksPerGame, TurnoversPerGame,
ThreePointPercentage, FreeThrowPercentage, MinutesPerGame, GamesPlayed, PointsTotal, ReboundsTotal,
AssistsTotal, StealsTotal, BlocksTotal, TurnoversTotal, ThreePointsTotal, FreeThrowTotal,
MinutesTotal) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) """
    values = (
        row ['Player_ID'], row ['Jersey Number'], row ['First Name'], row ['Last Name'],
        row ['Position'], row ['Years Pro'], row ['Age'], row ['Points Per Game'], row ['Assists Per Game'],
        row ['Rebounds Per Game'], row ['Steals Per Game'], row ['Blocks Per Game'],
        row ['Turnovers Per Game'], row ['3-Point Percentage'], row ['Free Throw Percentage'],
        row ['Minutes Per Game'], row ['Games Played'], row ['Points Total'], row ['Rebounds Total'],
        row ['Assists Total'], row ['Steals Total'], row ['Blocks Total'], row ['Turnovers Total'],
        row ['3 Points Total'], row ['Free Throw Total'], row ['Minutes Total']
        )
    cursor.execute(sql, values)

cursor.execute("DROP TABLE IF EXISTS GameStats")
cursor.execute("""
CREATE TABLE GameStats (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    GameDate DATE,
    Opponent VARCHAR(100),
    LakersScore INT,
    OpponentScore INT,
    PointDifferential INT,
    WinLoss ENUM('Win', 'Loss')
)
""")

for _, row in df_game.iterrows():
    sql = """
    INSERT INTO GameStats (
        GameDate, Opponent, LakersScore, OpponentScore,
        PointDifferential, WinLoss
    ) VALUES (%s, %s, %s, %s, %s, %s)
    """
    values = (
        pd.to_datetime(row['Date']).date(),
        row["Opponent"],
        row["Laker's Score"],
        row["Opponent's Score"],
        row["Point Differential"],
        row["Win/Loss"]
    )
    cursor.execute(sql, values)

cursor.execute("DROP TABLE IF EXISTS MonthlyPlayerStats")
cursor.execute("""
CREATE TABLE MonthlyPlayerStats (
    PlayerID INT,
    Month VARCHAR(20),
    PPG FLOAT,
    RPG FLOAT,
    APG FLOAT,
    SPG FLOAT,
    BPG FLOAT,
    TPG FLOAT,
    MPG FLOAT,
    ThreePPercent FLOAT,
    FTPercent FLOAT,
    GamesPlayed INT,
    PRIMARY KEY (PlayerID, Month)
)
""")

for _, row in df_monthly.iterrows():
    sql = """
    INSERT INTO MonthlyPlayerStats (
        PlayerID, Month, PPG, RPG, APG, SPG, BPG, TPG,
        MPG, ThreePPercent, FTPercent, GamesPlayed
    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (
        row['Player_ID'],
        row['Month'],
        row['PPG'],
        row['RPG'],
        row['APG'],
        row['SPG'],
        row['BPG'],
        row['TPG'],
        row['MPG'],
        row['3P%'],
        row['FT%'],
        row['GP']
    )
    cursor.execute(sql, values)

conn.commit()
cursor.close()
conn.close()



print ("All Tables successfully loaded into MySQL!")
            


     
 
