--DATA ANALYSIS (EASY LEVEL).
-- 1.Retrieve the names of all tracks that have more than 1 billion streams.

SELECT track 
FROM spotify 
WHERE stream > 1000000000;

-- 2.List all albums along with their respective artists.

SELECT album, 
       artist 
FROM spotify;

-- 3.Get the total number of comments for tracks where licensed = TRUE.

SELECT  SUM(comments) AS Total_Comments 
FROM spotify 
WHERE licensed = TRUE;

-- 4.Find all tracks that belong to the album type single.

SELECT track, 
       album_type 
FROM spotify
WHERE album_type = 'single';

-- 5.Count the total number of tracks by each artist.

SELECT artist, 
       COUNT(track) AS No_of_tracks 
FROM spotify
GROUP BY artist
ORDER BY No_of_tracks DESC;

--MEDIUM LEVEL
-- 6.Calculate the average danceability of tracks in each album.

SELECT 
    album, 
    AVG(danceability) AS Avg_Danceability 
FROM spotify
GROUP BY album
ORDER BY Avg_Danceability DESC;

-- 7.Find the top 5 tracks with the highest energy values.

SELECT track, energy_liveness 
FROM spotify
ORDER BY energy_liveness DESC
LIMIT 5;

-- 8.List all tracks along with their views and likes where official_video = TRUE.

SELECT track, 
       views, 
	   likes 
FROM spotify
WHERE official_video = TRUE;

-- 9.For each album, calculate the total views of all associated tracks.

SELECT album, 
       SUM(views) AS Total_views 
FROM spotify
GROUP BY album
ORDER BY Total_views DESC;

-- 10.Retrieve the track names that have been streamed on Spotify more than YouTube.

SELECT track 
FROM spotify
WHERE most_played_on = 'Spotify';

--DATA ANALYSIS (ADVANCE LEVEL)
-- 11.Find the top 3 most-viewed tracks for each artist using window functions.

WITH ranking_artist AS
	(SELECT artist, track ,SUM(views) AS Total_views,
	       DENSE_RANK() OVER(PARTITION BY artist ORDER BY SUM(views) DESC) AS Ranking
	FROM spotify
	GROUP BY artist, track
	ORDER BY artist, Total_views DESC)
SELECT * FROM ranking_artist
WHERE Ranking <= 3;

-- 12.Write a query to find tracks where the liveness score is above the average.

SELECT track, 
       artist, 
	   liveness 
FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify)
ORDER BY liveness;

-- 13.Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

WITH T AS 
    (SELECT album, MAX(energy) AS highest_energy, MIN(energy) AS lowest_energy FROM spotify
	 GROUP BY album 
	 ORDER BY highest_energy DESC)
SELECT album, (highest_energy-lowest_energy) AS Difference
FROM T
ORDER BY Difference DESC LIMIT 10;

-- 14.Find tracks where the energy-to-liveness ratio is greater than 1.2.

SELECT track, 
       artist, 
	   energy, 
	   liveness, 
       (energy / liveness) AS calculated_ratio
FROM spotify
WHERE liveness > 0 
  AND (energy / liveness) > 1.2;

-- 15.Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

SELECT track, 
       views, 
	   likes,
       SUM(likes) OVER (ORDER BY views DESC) AS cumulative_likes
FROM spotify;