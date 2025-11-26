<p align="center">
  <img src="Spotify_Full_Logo_RGB_Green.png" alt="Spotify and YouTube Data Analysis Logo" width="700">
</p>

# 🎧 Music Streaming Data Analysis: Spotify & YouTube Engagement

This project features a comprehensive SQL analysis integrating track metrics from Spotify (audio features) with YouTube user engagement data (views, likes, comments). The analysis progresses from simple aggregation to complex ranking, demonstrating full-spectrum querying capability.

## 🎯 Analytical Objectives & Project Value

* **Advanced Querying:** Demonstrate high-level SQL proficiency using **Window Functions** and **CTEs** to solve complex analytical problems.
* **Engagement Assessment:** Analyze the correlation between music characteristics (energy, danceability) and commercial popularity (streams, views, likes).
* **Data Sourcing:** Showcase the ability to handle and import data from a flat file (CSV) into a structured relational table.

---

## 📁 Repository Contents & Setup

| File Name | Purpose |
| :--- | :--- |
| **`Spotify-Create-Schema.sql`** | Defines the empty table structure (`spotify` table) for the import. |
| **`Spotify_dataset.csv`** | **The raw data source file** necessary for project reproducibility. |
| **`Spotify-Analysis-Query.sql`** | Contains all 15 analytical queries (Easy, Medium, Hard). |
| **`README.md`** | This documentation and setup guide. |

### 💻 Getting Started: Data Load Instructions

To run this project, you must first create the schema and then load the data from the CSV file into the empty `spotify` table.

### Step 1: Create the Schema

Execute the script in the **`Spotify-Create-Schema.sql`** file to create the table structure.

### Step 2: Load Data from CSV

Use your SQL client's bulk import command to load the **`Spotify_dataset.csv`** file into the new `spotify` table.

> \textbf{Note:} The specific command depends on your SQL server (e.g., `LOAD DATA INFILE` for MySQL or `\COPY` for PostgreSQL). Ensure the file path is correct when executing the import command.

### Step 3: Run Analysis

Execute the queries in **`Spotify-Analysis-Query.sql`** to generate all analytical results.

---

## 🚀 Key Analytical Questions 

### Advanced Technical Achievements:
* Demonstrates use of **Window Functions** (`DENSE_RANK()`, `SUM() OVER`) and **CTEs** (`WITH` clause) for ranking and complex aggregation.

### Easy Level
1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where licensed = TRUE.
4. Find all tracks that belong to the album type 'single'.
5. Count the total number of tracks by each artist.

### Medium Level
6. Calculate the average danceability of tracks in each album.
7. Find the top 5 tracks with the highest energy values (based on energy\_liveness).
8. List all tracks along with their views and likes where official\_video = TRUE.
9. For each album, calculate the total views of all associated tracks.
10. Retrieve the track names that have been streamed on Spotify more than YouTube.

### Hard Level
11. Find the top 3 most-viewed tracks for each artist using window functions.
12. Write a query to find tracks where the liveness score is above the average.
13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
14. Find tracks where the energy-to-liveness ratio is greater than 1.2.
15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
