# 🎧 Music Streaming Data Analysis: Spotify & YouTube Engagement

This project features a comprehensive SQL analysis of music streaming data, integrating track metrics from Spotify (danceability, energy) with YouTube user engagement data (views, likes, comments).

## 🎯 Project Objectives & Analytical Focus

* **Data Sourcing:** Handling and importing data from a flat file (CSV) into a structured relational table.
* **Advanced Querying:** Demonstration of high-level SQL proficiency using **Window Functions** and **CTEs**.
* **Engagement Assessment:** Analyzing the relationship between music characteristics (energy, danceability) and commercial popularity.

## 📁 Repository Contents

| File Name | Purpose |
| :--- | :--- |
| `01_create_schema.sql` | Defines the empty table structure needed for the import. |
| `spotify_data.csv` | **The raw data source file** necessary for project reproducibility (must be included). |
| `02_analysis_queries.sql` | Contains all 15 analytical queries (Easy, Medium, Hard). |

## 💻 Getting Started: Setup and Data Load

To run this project, you must first create the schema and then load the data from the CSV file into the empty `spotify` table.

### Step 1: Create the Schema

Execute the script in the **`01_create_schema.sql`** file to create the table structure.

### Step 2: Load Data from CSV

Use your SQL client's bulk import command to load the `spotify_data.csv` file into the new `spotify` table.

\textbf{⚠️ IMPORT COMMAND DEPENDS ON YOUR SERVER:}

* \textbf{For MySQL/MariaDB:} Use the `LOAD DATA` command (requires local file access):
    ```sql
    LOAD DATA LOCAL INFILE 'spotify_data.csv'
    INTO TABLE spotify
    FIELDS TERMINATED BY ','
    IGNORE 1 ROWS;
    ```
* \textbf{For PostgreSQL:} Use the `\COPY` command (if using psql terminal):
    ```sql
    \COPY spotify FROM 'spotify_data.csv' DELIMITER ',' CSV HEADER;
    ```

### Step 3: Run Analysis

Execute the queries in **`02_analysis_queries.sql`** to generate all analytical results.

---

# 📜 SQL Code Contents

## File: `01_create_schema.sql` (Table Definition)

```sql
DROP TABLE IF EXISTS spotify;

CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
