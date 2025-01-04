This Beginner MySQL Database Project containts numerous statistics for NBA Superstars Lebron James & Michael Jordan. The purpose of the Database aims to compare Regular Season Totals
in various categories (Points, Assists, Rebounds) & Accomplishments (Championships, MVP, All-Star Selections) against the two. Provided in this document are some fun queries to try!

Find the Player/s who has 5 or more NBA Finals Appearances AND more than 15 All-Star Selections:

SELECT playerprofile.Player_Name
FROM playerprofile INNER JOIN accomplishments
ON playerprofile.PlayerID = accomplishments.PlayerID
WHERE accomplishments.Finals_Appearance >=5 AND accomplishments.AllStar > 15;

Find the Player/s who has 25000 or more total points AND less than 8000 total assists:

SELECT playerprofile.Player_Name
FROM playerprofile INNER JOIN regularseasontotals
ON playerprofile.PlayerID = regularseasontotals.PlayerID
WHERE regularseasontotals.TotalPoints >=25000 AND regularseasontotals.TotalAssists <8000;
