# DS594 Boston's Children Hospital: Vaccine Equity

**Instructions for downloading this github repository (for Dr. Julia Kohler):**
- Follow this guide, BUT ONLY from 0:43 to 1:22 : https://shorturl.at/yvJDv
- If you need more help with this, please email one of us

**Details on each sheet:**

Map, colors:
- This simply defines the colors that all cities will be across all the sheets

Map, ages:
- This map is used in the Interactive Map V2 dashboard
- It uses the average vaccination rate simply as a way to diversify the colors of the cities
- It also understands the set of cities that have been selected, which defines the dropdown in Interactive Map V2

Bar graph by age:
- This is the bar graph displayed in Interactive Map V2
- It only contains a subset of age groups because the others did not have proper data
- It also separates the data by city and colors the bars by city
- These colors match the original colors defined in "Map, colors"
- It shows the average of the currently selected vaccination rate for each age group

Vax over time by age:
- This is the line graph displayed in Interactive Map V2
- It contains a red, bold line that displays the currently selected vaccination rate for the selected city
- This is the total vaccination rate across all age groups
- It contains a dotted line that represents the currently selected vaccination rate for the selected city, within one selected age group
- The x-axis is set to be stuck from 0 to 1

Map info & Map info, race & Over time info & Background information:
- These are simply used to show additional information when hovering over lightbulbs

Interactive Map V2:
- This is the main dashboard that contains many sheets and options
- You can click on cities to select them, this will fill the bar graph with those cities
- It will also allow those cities to be selected from the dropdown
- There are other dropdown menus to select the vaccination status and the age group to examine

Map, races:
- It is used in the Interactive Map Race
- This is the same as "Map, ages", but in order to not have them influence each other they are separate

Bar graph by race:
- It is used in the Interactive Map Race
- This is the same as "Bar graph by age" but this time it is grouped by ethnicity

Interactive Map Race:
- This contains the map and bar graph
- It has the same functionality as the Interactive Map V2, but without the over time data
- If the over time data is added, this could be modified to look like Interactive Map V2

Heat map (Regions): Full-vax SPECTRUM:
- This is the heat map that shows the fully vaccinated rates across each city
- It is used in Summary
- It is tied to "Bar chart Rankings for 6 Cities of Interest", so both are animated at the same time
- Some regions do not have any data, so they have to be filtered out and are left blank

Bar chart Rankings for 6 Cities of Interest:
- This tracks the fully vaccinated rate across the 6 main cities you instructed us to focus on
- It is animated over time and you can see which cities were the most vaccinated across each month

Percent Fully Vaccinated for 6 Cities of Interest:
- This shows the same data as "Bar chart Rankings for 6 Cities of Interest", but all at once
- This way it is easier to see over time data in this graph and it easier to see how the vaccination rates compare in the other

Summary:
- This contains our blurb, the heatmap, and both graphs about the 6 cities of interest
- It also introduces the hover lightbulb which is used across the dashboard

Details on our data:
- We ensured that across all the vaccination rates we tracked, if the total population was ever smaller than the vaccination population, we set that rate to be equal to 1, instead of larger than 1
- We merged our data with a shape file so that we could create the maps with regional borders
- Lastly, we attached the limited ethnicity data that we received for the semester. In the future, this should be replaced with the time series data on race that Dr. Julia Kohler has
