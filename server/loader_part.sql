CREATE DATABASE IF NOT EXISTS creditsworld_test;
USE creditsworld_test;
DROP TABLE IF EXISTS Entries;
DROP TABLE IF EXISTS Crew_in;
DROP TABLE IF EXISTS Sings;
DROP TABLE IF EXISTS Artists;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Songs;
CREATE TABLE Songs (
  id varchar(255),
  title varchar(255),
  album varchar(255),
  label varchar(255),
  youtube_url varchar(255),
  song_art_image_thumbnail_url varchar(255),
  release_date_for_display varchar(255),
  PRIMARY KEY (id)
);
CREATE TABLE Person (
  id varchar(255),
  name varchar(255),
  image_url varchar(255),
  url varchar(255),
  PRIMARY KEY (id)
);
CREATE TABLE Artists(
  artist_id varchar(255),
  genius_followers int,
  genius_iq int,
  PRIMARY KEY (artist_id),
  FOREIGN KEY (artist_id) REFERENCES Person(id)
);
CREATE TABLE Sings(
  artist_id varchar(255),
  song_id varchar(255),
  type varchar(255),
  PRIMARY KEY (artist_id,song_id,type),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
);
CREATE TABLE Crew_in (
  crew_id varchar(255),
  song_id varchar(255),
  type varchar(255),
  PRIMARY KEY (crew_id, song_id, type),
  FOREIGN KEY (crew_id) REFERENCES Person(id),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
);
CREATE TABLE Entries (
  song_id varchar(255),
  position int,
  date int,
  streams int,
  PRIMARY KEY (song_id, date, position),
  FOREIGN KEY (song_id) REFERENCES Songs(id)
);
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2346601', 'Me, Myself & I - MV', 'Video Breakdowns', NULL, 'http://www.youtube.com/watch?v=bSfpSOBD30U', 'https://images.rapgenius.com/21d9f89fb8b82aa1b9c26190e3ab4468.300x300x1.jpg', 'October 29, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2852482', 'OVO Sound Radio Episode 31 Tracklist', 'OVO Sound Radio Tracklists', NULL, 'NULL', 'https://images.genius.com/056421efa6cc338499fea25e5a8be6a1.300x300x1.png', 'October 8, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('3904320', 'Imagine Dragons Cleanup Page', 'NULL', NULL, 'NULL', 'https://images.genius.com/c8f51648a053d907ba2f6d7b5dc7ba72.300x300x1.jpg', NULL);
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2496305', 'Too Many Years', 'Lil B.I.G. Pac', NULL, 'http://www.youtube.com/watch?v=HnCiU8mcPWs', 'https://images.genius.com/d99d072a2a5498c5bc40c3fb57535cdb.300x300x1.jpg', 'June 11, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('3857644', '2017 Playlist', 'Decades Of The 21st Century:2010-2019', NULL, 'NULL', 'https://images.genius.com/f0c7eb4741875841755dbc6a19b680f0.300x300x1.jpg', '2019');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2890675', 'The 25 Best Pop Songs of 2016: Nominations', '2016 Year-End List', NULL, 'NULL', 'https://images.genius.com/7e177b5f3341d07397a75c280dfc54ed.300x300x1.png', 'October 23, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('1633480', 'Ain’t No Mountain High Enough (Single) [Mono]', 'NULL', NULL, 'NULL', 'https://images.genius.com/ee7f453224dcc21cb8b8cf57475530dc.217x217x1.png', NULL);
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2875301', 'Love Me Now', 'Darkness and Light', 'Columbia Records,G.O.O.D. Music', 'http://www.youtube.com/watch?v=NmCFY1oYDeM', 'https://images.genius.com/0fc0ccdc6e6ab2a0100feab5b0c0f9b5.300x300x1.jpg', 'October 7, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2928485', 'New Music Friday 12/09/16', 'New Music Friday Playlists 2016', NULL, 'NULL', 'https://images.genius.com/a453d01209dfbdb6c76a990c2be18bf1.300x300x1.jpg', 'December 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2960556', 'Call On Me (Ryan Riback Extended Remix)', 'Call On Me (Remixes)', NULL, 'http://www.youtube.com/watch?v=I-VsisgVkHw', 'https://images.genius.com/2e8226cc229896b07d6418688e2fbd82.300x300x1.jpg', 'October 14, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2891157', 'Best Songs of 2016 Nominations', 'Genius Best of 2016', NULL, 'NULL', 'https://images.genius.com/ca26177152bbe276a2fbc90b0ca7495a.300x300x1.png', 'October 24, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2881766', 'New Music Friday 10/14/16', 'New Music Friday Playlists 2016', NULL, 'NULL', 'https://images.genius.com/6486a54090e6cf2f44642ab0e77b28bd.300x300x1.jpg', 'October 14, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2881810', 'Now and Later', 'Morse Code', 'Atlantic Records,HBK Gang', 'http://www.youtube.com/watch?v=4KfnU1VI9SE', 'https://images.genius.com/02488c8e5146a1a6db5b824e10e5ccbf.300x300x1.jpg', 'October 14, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('3036726', 'In The Name Of Love (Snavs Remix)', 'In the Name of Love (Remixes)', 'STMPD RCRDS', 'http://www.youtube.com/watch?v=yCYT9X8KE2w', 'https://images.genius.com/6aea4958a5d0cc197597bc4946f312ba.300x300x1.jpg', 'November 10, 2017');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('5110616', 'April 2020 Singles Release Calendar', '2020 Singles Release Calendar', NULL, 'NULL', 'https://images.genius.com/a13a61b9220c6e609be5d1168c95da8b.300x300x1.jpg', 'April 2020');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2892211', 'Chantaje', 'El Dorado', NULL, 'http://www.youtube.com/watch?v=6Mgqbai3fKo', 'https://images.genius.com/264033dfc3f22eacadcf72badbdc7cbe.300x300x1.jpg', 'October 28, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2478138', 'Treat You Better', 'Illuminate', 'Island Records', 'http://www.youtube.com/watch?v=lY2yjAdbvdQ', 'https://images.genius.com/bf004d7c1ba188cb06c28e8966788a6d.300x300x1.jpg', 'June 3, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2844173', 'Trust Nobody', '9', NULL, 'http://www.youtube.com/watch?v=1Vn1BXfsd4Q', 'https://images.genius.com/12e6dd453874b72aa0850f6d60a5891d.300x300x1.jpg', 'September 30, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2488833', 'Selfish', 'GTTM: Goin Thru The Motions', NULL, 'http://www.youtube.com/watch?v=8Sczx0Xztd4', 'https://images.genius.com/5dee1c6b6983775ff6c68fffed4f9820.300x300x1.jpg', 'June 24, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2855384', 'JuJu On That Beat (TZ Anthem)', 'Just Dance 2017 Official Tracklist', NULL, 'http://www.youtube.com/watch?v=a2v_zGWawP0', 'https://images.genius.com/f6862e87f3874a8b6b72afc979648371.300x300x1.jpg', 'July 26, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2435615', 'I Took a Pill In Ibiza (Seeb Remix)', 'At Night, Alone.', NULL, 'http://www.youtube.com/watch?v=foE1mO2yM04', 'https://images.genius.com/92e114a9482dd822bab3f3e47d0c8872.300x300x1.jpg', 'July 14, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('664970', 'Lot to Learn', 'TMRWFRVR', NULL, 'http://www.youtube.com/watch?v=7QY27fjZUaU', 'https://images.genius.com/1d1a531ac3bb41eeb195cc71097fab28.300x300x1.jpg', 'January 6, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2355208', 'Some Kind of Drug', 'When It’s Dark Out', NULL, 'http://www.youtube.com/watch?v=TtqiBUOSm_A', 'https://images.genius.com/52fb13f3429f949d470f3942005413f1.300x300x1.jpg', 'December 4, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2688236', 'Too Much Sauce', 'Project E.T. (Esco Terrestrial)', 'Epic Records,Freebandz', 'http://www.youtube.com/watch?v=Ekqu_Ku7nuY', 'https://images.genius.com/ac534fbffc2c777923f67bced38b6f91.300x300x1.jpg', 'June 24, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2890555', 'Sneakin’', 'NULL', 'Republic Records,OVO Sound,Young Money,Cash Money Records', 'http://www.youtube.com/watch?v=ThaBFEJIV_E', 'https://images.genius.com/81118b1faf9c7377180039e385a15543.300x300x1.jpg', 'October 23, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2391084', 'Cheap Thrills', 'This Is Acting ', NULL, 'http://www.youtube.com/watch?v=31crA53Dgu0', 'https://images.genius.com/1338ed41f569e94944c52d58812c9152.300x300x1.png', 'February 11, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2444781', 'Water', 'The Booty Tape', NULL, 'http://www.youtube.com/watch?v=nzpZov-VFLk', 'https://images.genius.com/00c471dddb9965c7c4c45a023bb7f0bc.300x300x1.jpg', 'March 16, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2851057', 'Don’t Wanna Know', 'Red Pill Blues', 'Top Dawg Entertainment,Aftermath,Friends Keep Secrets,Interscope Records,222 Records', 'http://www.youtube.com/watch?v=OxPv8mSTv9U', 'https://images.genius.com/73a34d501ab0ea962a4fcda19a957f86.300x300x1.jpg', 'October 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2436402', 'Caroline', 'Good For You', 'Universal Music Group,Republic Records', 'http://www.youtube.com/watch?v=3j8ecF8Wt4E', 'https://images.genius.com/e5b85886dea15403c0e28e312bb22e1e.300x300x1.jpg', 'March 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2938684', 'Setting Fires (Sigma Remix)', 'Sick Boy (Special Edition)', NULL, 'http://www.youtube.com/watch?v=oc64W6N9U2I', 'https://images.genius.com/0120fa46841c095650cdb8f99f11d255.300x300x1.jpg', 'December 23, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2336758', 'Chill Bill', 'Straight Bummin’', NULL, 'http://www.youtube.com/watch?v=J7IMwop3RHs', 'https://images.genius.com/952d814fc11cc4f5a0d2e5ec5e84e89a.300x300x1.jpg', 'June 25, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2404125', 'One Night', 'Lil Boat ', 'Capitol Records,Motown Records,Quality Control', 'http://www.youtube.com/watch?v=251cxou3yR4', 'https://images.genius.com/5e13fd7416e57fc857d2f0cc09da983e.300x300x1.jpg', 'August 23, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2859956', 'Used to This', 'FUTURE', 'A1 Recordings,Epic Records,Freebandz', 'http://www.youtube.com/watch?v=SZDmuHSqwtg', 'https://images.genius.com/44d1519a7447ba231c9b007cbe61259d.300x300x1.png', 'November 4, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2811214', 'Mercy', 'Illuminate', NULL, 'http://www.youtube.com/watch?v=KkGVmN68ByU', 'https://images.genius.com/ced6fec4819853ecb50da2322f9d46a9.300x300x1.jpg', 'August 18, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('599427', 'No Role Modelz', '2014 Forest Hills Drive', NULL, 'http://www.youtube.com/watch?v=2RrhwDKw-j4', 'https://images.genius.com/2f88c0a52697a42d3d0fb1e3276d2411.300x300x1.jpg', 'December 9, 2014');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2336620', 'Send My Love (To Your New Lover)', '25 ', NULL, 'http://www.youtube.com/watch?v=fk4BbF7B29w', 'https://images.genius.com/e20c352a7871b6dcadf70428dadfd46b.300x300x1.jpg', 'November 20, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2922155', '​iSpy', 'Light of Mine', '​independently popular.,Atlantic Records', 'http://www.youtube.com/watch?v=5XK4v2fgMPU', 'https://images.genius.com/ebbb6ff360a4666aa2f50d08d5e7ecd6.300x300x1.jpg', 'December 2, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2911255', 'Party Monster', 'Starboy', 'Republic Records,The Weeknd XO, Inc.,Universal Music Group', 'http://www.youtube.com/watch?v=diW6jXhLE0E', 'https://images.genius.com/235fbb681a9b3e40af8aa474ba16b9cd.300x300x1.jpg', 'November 18, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2869012', 'Sunset Lover', 'Presence', NULL, 'http://www.youtube.com/watch?v=5hALH-s6ZkA', 'https://images.genius.com/791fe87320114f112d4c6744d20616f4.300x300x1.jpg', 'February 22, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2467204', 'CAN’T STOP THE FEELING!', 'NOW That’s What I Call Music! 94 [UK]', NULL, 'http://www.youtube.com/watch?v=p5RobDomh5U', 'https://images.genius.com/ceaaa71bda62cfba769bb82cdf068fb5.300x300x1.jpg', 'May 6, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2418877', 'Money Longer', 'Lil Uzi Vert vs. The World', 'Generation Now,Atlantic Records', 'http://www.youtube.com/watch?v=1eoSanFCU-M', 'https://images.genius.com/97fe62393830361917ecc28f3942473c.300x300x1.png', 'February 6, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2457826', 'Swang', 'SremmLife 2', 'Ear Drummers,Interscope Records', 'http://www.youtube.com/watch?v=dmJefsOErr0', 'https://images.genius.com/3ae5fce394cec0598165a7fe68c8fa74.300x300x1.jpg', 'August 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2880960', 'Rockabye', 'What Is Love?', 'Atlantic Records', 'http://www.youtube.com/watch?v=papuvlVeZg8', 'https://images.genius.com/bcbbb88e18587909cc8c4ac4c1bed346.300x300x1.jpg', 'October 21, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2924189', 'Neighbors', '4 Your Eyez Only', 'Interscope Records,Roc Nation,Dreamville', 'http://www.youtube.com/watch?v=9nfVWiXY3WY', 'https://images.genius.com/e8867c7f0c8a290e03aaa2fbc804fdbf.300x300x1.jpg', 'December 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2908883', 'Make Me (Cry)', 'NULL', NULL, 'http://www.youtube.com/watch?v=vXyBcKV0UIo', 'https://images.genius.com/28a27d338b44a8776ceac47856e51241.300x300x1.jpg', 'November 15, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2849861', 'Say You Won’t Let Go', 'Back from the Edge', NULL, 'http://www.youtube.com/watch?v=0yW7w8F2TVA', 'https://images.genius.com/90d5d7bec926733d6764a8f45d3f95f9.300x300x1.jpg', 'September 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2923332', 'Immortal', '4 Your Eyez Only', NULL, 'http://www.youtube.com/watch?v=53A0oPyLQLA', 'https://images.genius.com/37291e01ab860f66509cc60d0f0c75bf.300x300x1.jpg', 'December 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2911557', 'Die for You', 'Starboy', 'The Weeknd XO, Inc.,Republic Records,Universal Music Group', 'http://www.youtube.com/watch?v=mTLQhPFx2nM', 'https://images.genius.com/2c1f31ee6278b9ccf7be5b6a3ab190ab.300x300x1.jpg', 'November 25, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2471960', 'No Problem', 'Coloring Book', NULL, 'http://www.youtube.com/watch?v=DVkkYlQNmbc', 'https://images.genius.com/bd58f880e3639190c45ab29cd1bdf354.300x300x1.png', 'May 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2890553', 'Fake Love', 'More Life', 'Cash Money Records,Young Money,Republic Records,Octobers Very Own', 'http://www.youtube.com/watch?v=jz_01KVkOBI', 'https://images.genius.com/4672f8523e0fbf7f7848185256e946f4.300x300x1.jpg', 'October 23, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('749215', 'All Time Low', 'The Human Condition', 'Capitol Records,Visionary Music Group', 'http://www.youtube.com/watch?v=AXnqkVTFUqY', 'https://images.genius.com/55779c4fa8797a522190e40cf060749a.300x300x1.png', 'April 14, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2336631', 'Water Under the Bridge', '25 ', 'Columbia Records,XL Recordings', 'http://www.youtube.com/watch?v=_BBvHRB5vQE', 'https://images.genius.com/366d0cce534e9fb30a41e2f24a9cdab4.300x300x1.jpg', 'November 20, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2925371', 'Change', '4 Your Eyez Only', 'Roc Nation,Dreamville', 'http://www.youtube.com/watch?v=AiZuT69qJLc', 'https://images.genius.com/e8867c7f0c8a290e03aaa2fbc804fdbf.300x300x1.jpg', 'December 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('4006446', 'Bohemian Rhapsody (2011 Remaster)', 'Bohemian Rhapsody (The Original Soundtrack)', NULL, 'http://www.youtube.com/watch?v=V8QqZ0Qb3U8', 'https://images.genius.com/c62e3a1cc275b38664a26fe03f4a8975.220x220x1.jpg', 'October 19, 2018');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2263909', '​i​ hate u, i love u', 'us - EP', NULL, 'http://www.youtube.com/watch?v=BiQIc7fG9pA', 'https://images.genius.com/c0a4a2a52f57acfb2214a1b46bd6c402.300x300x1.jpg', 'February 17, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2465219', 'Into You', 'Dangerous Woman', 'Republic Records', 'http://www.youtube.com/watch?v=1ekZEVeXwek', 'https://images.genius.com/8cb124754c813c5231a333b984711669.300x300x1.jpg', 'May 6, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2911564', 'Reminder', 'Starboy', 'The Weeknd XO, Inc.,Republic Records,Universal Music Group', 'http://www.youtube.com/watch?v=JZjAg6fK-BQ', 'https://images.genius.com/ce75af9ee6c2c4a113e5ce6adfe1aebe.300x300x1.jpg', 'November 25, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2911554', 'Sidewalks', 'Starboy', 'The Weeknd XO, Inc.,Republic Records,Universal Music Group', 'http://www.youtube.com/watch?v=uxBganA7KnY', 'https://images.genius.com/2c1f31ee6278b9ccf7be5b6a3ab190ab.300x300x1.jpg', 'November 25, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2396302', 'Low Life', 'EVOL', 'Freebandz,Epic Records,A1 Recordings', 'http://www.youtube.com/watch?v=K_9tX4eHztY', 'https://images.genius.com/515a9f4ff0b6778b6ce90b86041ff1e7.300x300x1.jpg', 'December 25, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('201791', 'Rich Girl', 'Bigger Than Both Of Us', NULL, 'http://www.youtube.com/watch?v=oIAkRVBS-0U', 'https://images.genius.com/de2c8f78c6ea77246fc7ed2d16846d7a.220x221x1.jpg', 'January 22, 1977');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2407925', 'Never Be Like You', 'Skin', NULL, 'http://www.youtube.com/watch?v=-KPnyf8vwXI', 'https://images.genius.com/8338fc38cf3c217428f73c27fb363a23.300x300x1.jpg', 'January 16, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2872960', '24K Magic', '24K Magic', 'Atlantic Records', 'http://www.youtube.com/watch?v=UqyT8IEBkvY', 'https://images.genius.com/b282bdd631cf951aad0ed03f69a58356.300x300x1.jpg', 'October 7, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2416822', 'Don’t Let Me Down', 'Collage', 'Disruptor Records,Columbia Records', 'http://www.youtube.com/watch?v=Io0fBr1XBUA', 'https://images.genius.com/c68b35253766908063c6ea38f457974d.300x300x1.jpg', 'February 5, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2820703', 'X', 'Savage Mode', NULL, 'http://www.youtube.com/watch?v=SpXw0qiy3Wo', 'https://images.genius.com/74fd790126e1e11b02aa8a560e195859.300x300x1.jpg', 'July 15, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2860652', 'Weak', 'The Click', 'AJR', 'http://www.youtube.com/watch?v=txCCYBMKdB0', 'https://images.genius.com/36a8fd44f1bda59d867595087592881a.300x300x1.jpg', 'September 16, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2819932', 'Black Beatles', 'SremmLife 2', NULL, 'http://www.youtube.com/watch?v=b8m9zhNAgKs', 'https://images.genius.com/3ae5fce394cec0598165a7fe68c8fa74.300x300x1.jpg', 'August 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2413890', 'Needed Me', 'ANTi', 'Roc Nation,Westbury Road', 'http://www.youtube.com/watch?v=wfN4PVaOU5Q', 'https://images.rapgenius.com/13031e30d3fe64f307ed762d387d58f2.300x300x1.jpg', 'January 28, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('725792', 'Ride', 'Blurryface', 'Warner Music Group,Atlantic Records,Fueled By Ramen', 'http://www.youtube.com/watch?v=Pw-0pbY9JeU', 'https://images.genius.com/24362a574b78f0173a82a7e05b715d2c.300x300x1.png', 'May 11, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2104392', 'Scars to Your Beautiful', 'Know-It-All', 'Def Jam Recordings', 'http://www.youtube.com/watch?v=Em7vc8NWUNY', 'https://images.genius.com/bc662d47cd6425f84fbc911b498734a6.300x300x1.jpg', 'November 13, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2456795', 'You Was Right', 'Lil Uzi Vert vs. The World', 'Atlantic Records,Generation Now', 'http://www.youtube.com/watch?v=55iN4H6kRN4', 'https://images.genius.com/91c497688eacb83a8d4c3e8f2a0cb418.300x300x1.png', 'April 15, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('579968', 'Don’t', 'T R A P S O U L', NULL, 'http://www.youtube.com/watch?v=d7cVLE4SaN0', 'https://images.rapgenius.com/8c796513d5f03ecfaf118176ce3ae06e.300x300x1.jpg', 'October 28, 2014');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2312297', 'Exchange', 'T R A P S O U L', NULL, 'http://www.youtube.com/watch?v=aj9coPGuFkM', 'https://images.genius.com/af83a81669b0e0a9ed813c8db8bdb97c.300x300x1.jpg', 'September 21, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2311373', 'Jumpman', 'What a Time to Be Alive ', 'OVO Sound,Cash Money Records,Young Money,Republic Records,Freebandz,Epic Records', 'http://www.youtube.com/watch?v=drprt4Dft7Y', 'https://images.genius.com/856d23cafd5a7afd935b2dba87c3140f.300x300x1.jpg', 'September 20, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('64869', 'Titanium', 'Nothing But the Beat', NULL, 'http://www.youtube.com/watch?v=JRfuAukYTKg', 'https://images.genius.com/273191abde56f42837213fba53958df0.300x300x1.jpg', 'August 26, 2011');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2388373', 'We Don’t Talk Anymore', 'Nine Track Mind', 'Atlantic Records', 'http://www.youtube.com/watch?v=3AtDnEC4zak', 'https://images.genius.com/3bfb705b70df7ba7f0b19ff356fea3b5.300x300x1.jpg', 'May 24, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2306268', 'Cake By the Ocean', 'DNCE', NULL, 'http://www.youtube.com/watch?v=vWaRiD5ym74', 'https://images.genius.com/ac198dea4aaf034177f1c5054ff05f98.300x300x1.jpg', 'September 18, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2913726', 'Six Feet Under', 'Starboy', 'The Weeknd XO, Inc.,Republic Records,Universal Music Group', 'http://www.youtube.com/watch?v=Jt5nPuMgKA8', 'https://images.genius.com/2c1f31ee6278b9ccf7be5b6a3ab190ab.300x300x1.jpg', 'November 25, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('725791', 'Stressed Out', 'Blurryface', 'Warner Music Group,Atlantic Records,Fueled By Ramen', 'http://www.youtube.com/watch?v=pXRviuL6vMY', 'https://images.genius.com/f4f2b7bded756772a84a648d5464507a.220x220x1.jpg', 'April 28, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2867244', 'All We Know', 'Collage', NULL, 'http://www.youtube.com/watch?v=7mWQ38SpEf8', 'https://images.genius.com/b88df63fd6fa744089bb3b07188f4249.300x300x1.jpg', 'September 30, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2378935', 'Love on the Brain', 'ANTi', 'Westbury Road,Roc Nation', 'http://www.youtube.com/watch?v=0RyInjfgNc4', 'https://images.genius.com/f8cf63fc2d0865d1e2b6f7809eaa5de7.300x300x1.jpg', 'January 28, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2924188', 'Deja Vu', '4 Your Eyez Only', NULL, 'http://www.youtube.com/watch?v=9d_jOIwEKPY', 'https://images.genius.com/37291e01ab860f66509cc60d0f0c75bf.300x300x1.jpg', 'December 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2457495', 'Side To Side', 'Dangerous Woman', 'Republic Records', 'http://www.youtube.com/watch?v=SXiSVQZLje8', 'https://images.genius.com/93e981120ecd5a594ba68ce3de503275.300x300x1.jpg', 'May 20, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2905167', 'Redbone', '“Awaken, My Love!”', 'Glassnote Records', 'http://www.youtube.com/watch?v=Kp7eSUU9oy8', 'https://images.genius.com/ff5ee117884906685f99f5a37747bcaf.300x300x1.jpg', 'November 17, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2463402', 'Too Good', 'Views', 'Cash Money Records,Young Money,Republic Records', 'http://www.youtube.com/watch?v=-MZAiIuAEnk', 'https://images.genius.com/6f4b9c41ccb18485cccd6aa364ccc3b8.300x300x1.jpg', 'April 29, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2861311', 'The Mack', 'N1*', 'Universal Music Group,Nourishing Music,Straight Forward Recordings,Capitol Records', 'http://www.youtube.com/watch?v=-cy78b9uvBs', 'https://images.genius.com/9686460891ff146ae7c29e9b578e028a.300x300x1.jpg', 'September 23, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2474069', 'OOOUUU', 'Herstory', NULL, 'http://www.youtube.com/watch?v=gVf_4Ns3qLU', 'https://images.genius.com/6697b65322ef90e9777557e902c1b3c4.300x300x1.jpg', 'May 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2464123', 'Controlla', 'Views', 'Cash Money Records,Young Money,Republic Records', 'http://www.youtube.com/watch?v=cl5QcdUI158', 'https://images.genius.com/6f4b9c41ccb18485cccd6aa364ccc3b8.300x300x1.jpg', 'April 29, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2427392', 'Work from Home', '7/27', NULL, 'http://www.youtube.com/watch?v=5GL9JoH4Sws', 'https://images.rapgenius.com/ec8ba94f6c3b8512a7447f0947afbf49.300x300x1.jpg', 'February 26, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2865735', 'Congratulations', 'Stoney (Deluxe)', 'Universal Music Group,Republic Records', 'http://www.youtube.com/watch?v=SC4xMk98Pdc', 'https://images.genius.com/68c858f53b26e44f67787916c6ebc74c.300x300x1.png', 'November 4, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2830058', 'Erase Your Social', 'The Perfect LUV Tape', 'Generation Now,Atlantic Records', 'http://www.youtube.com/watch?v=WxL2au41cnk', 'https://images.genius.com/e8bb7480436e9427e41dfa69cd3a6e19.300x300x1.png', 'July 31, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2820812', 'No Heart', 'Savage Mode', NULL, 'http://www.youtube.com/watch?v=6wtwpUwxQik', 'https://images.genius.com/74fd790126e1e11b02aa8a560e195859.300x300x1.jpg', 'July 15, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2463453', 'This Is What You Came For', 'NOW That’s What I Call Music! 94 [UK]', 'Westbury Road,Columbia Records', 'http://www.youtube.com/watch?v=kOkQ4T5WO9E', 'https://images.genius.com/3cb8d810e54624e96b8e786d80a731fd.300x300x1.jpg', 'April 29, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2450584', 'One Dance', 'Views', 'Universal Music Group,Cash Money Records,Young Money,Republic Records', 'http://www.youtube.com/watch?v=iAbnEUA0wpA', 'https://images.rapgenius.com/103e5aed5053b63991934deae026b9d3.300x300x1.jpg', 'April 5, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2451433', 'Broccoli', 'Big Baby DRAM', NULL, 'http://www.youtube.com/watch?v=K44j-sb1SRY', 'https://images.genius.com/5c743f0ab4939e1b435db108b4118040.300x300x1.jpg', 'April 6, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2532266', 'Heathens', 'Suicide Squad: The Album', 'Warner Music Group,Atlantic Records', 'http://www.youtube.com/watch?v=UprcpdwuwCg', 'https://images.genius.com/985db59572de79931cfcb00a4379ac0e.300x300x1.png', 'June 16, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2819412', 'Let Me Love You', 'Encore', 'DJ Snake Productions Limited,Interscope Records', 'http://www.youtube.com/watch?v=euCqAq6BRa4', 'https://images.genius.com/073cd0dbdf330c416680c3705d09270a.300x300x1.jpg', 'August 4, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2442052', 'Come and See Me', 'PARTYNEXTDOOR 3 (P3)', 'OVO Sound,Warner Music Group', 'http://www.youtube.com/watch?v=Ockhq8E2FrA', 'https://images.genius.com/c22072bd490dc96d39aca812eba22296.300x300x1.jpg', 'March 20, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2458848', 'Closer', 'Collage', NULL, 'http://www.youtube.com/watch?v=0zGcUoRlhmw', 'https://images.genius.com/6e44a91448d28714d0a0f91a27193e91.300x300x1.jpg', 'July 29, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2893922', 'Bounce Back', 'I Decided.', 'G.O.O.D. Music,Def Jam Recordings', 'http://www.youtube.com/watch?v=phr1pOFK1V8', 'https://images.genius.com/6dbe3c351a64ae50d44858c7502c4365.300x300x1.jpg', 'October 31, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('1429', 'Pumped Up Kicks', 'Torches', NULL, 'http://www.youtube.com/watch?v=SDTZ7iX4vTQ', 'https://images.genius.com/fd2f2e740a8fa6025907648a31abf43f.300x300x1.png', 'October 14, 2010');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2342329', 'Love Yourself', 'Purpose', 'Def Jam Recordings,RBMG', 'http://www.youtube.com/watch?v=oyEuk8j8imI', 'https://images.genius.com/06f05219a0279493a63a79cd5b1a5d28.300x300x1.jpg', 'November 13, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2909921', 'I Feel It Coming', 'Starboy', 'The Weeknd XO, Inc.,Universal Music Group,Republic Records', 'http://www.youtube.com/watch?v=qFLhGq0060w', 'https://images.genius.com/02d44f528e2f14794c9ac02eeb6268f3.300x300x1.jpg', 'November 18, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('54027', 'I Want You Back', 'Diana Ross Presents the Jackson 5', 'Motown Records', 'http://www.youtube.com/watch?v=s3Q80mk7bxE', 'https://images.genius.com/658041780a0452d6357c2c498b94cf73.300x299x1.jpg', 'October 7, 1969');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('698675', 'White Iverson', 'Stoney (Deluxe)', 'Republic Records', 'http://www.youtube.com/watch?v=SLsTskih7_I', 'https://images.genius.com/1dad4b59df882166763827cd9ac83662.300x303x1.png', 'February 4, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2849767', '​goosebumps', 'Birds in the Trap Sing McKnight', 'Epic Records,Grand Hustle Records', 'http://www.youtube.com/watch?v=Dst9gZkq1a8', 'https://images.genius.com/5f66b21e0c69ff6c30080f2c6795f025.300x300x1.jpg', 'September 2, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2845980', 'Bad and Boujee', 'Culture', 'Quality Control', 'http://www.youtube.com/watch?v=S-sJp1FfG7Q', 'https://images.genius.com/2fec6685c2aa2f875cab422bdb68d099.300x300x1.png', 'August 27, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2851948', 'Starboy', 'Starboy', 'The Weeknd XO, Inc.,Universal Music Group,Republic Records', 'http://www.youtube.com/watch?v=34Na4j8AVgA', 'https://images.genius.com/1df3b30ecda8ca80f687230b43897ed1.300x300x1.jpg', 'September 21, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('1644', 'Billie Jean', 'Thriller', 'Sony Music Entertainment,Epic Records', 'http://www.youtube.com/watch?v=Zi_XLOBDo_Y', 'https://images.genius.com/6d6f4e98e26c6a3b885132764820b352.300x300x1.jpg', 'November 30, 1982');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2481759', 'Cold Water', 'Major Lazer Essentials', 'Mad Decent,Because Music', 'http://www.youtube.com/watch?v=nBtDsQ4fhXY', 'https://images.genius.com/fcbb9f99e72af79537b124f0fc4084d0.300x300x1.jpg', 'July 22, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2171', 'Paper Planes', 'Kala', 'Interscope Records,XL Recordings', 'http://www.youtube.com/watch?v=ewRjZoRtu0Y', 'https://images.genius.com/d2fa9ea19155e704d0300ff0d29e78a3.300x300x1.jpg', 'February 11, 2008');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2400811', 'Panda', 'New English', 'G.O.O.D. Music,Def Jam Recordings', 'http://www.youtube.com/watch?v=E5ONTXHS2mM', 'https://images.genius.com/2facb805b5003f53a51edda12ae4eb36.300x300x1.jpg', 'December 15, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2398213', 'Work', 'ANTi', 'Westbury Road,Roc Nation', 'http://www.youtube.com/watch?v=HL1UzIK-flA', 'https://images.genius.com/286c7810f1bbcc0d5465b9ecab71c29b.300x300x1.jpg', 'January 27, 2016');
INSERT INTO Person (id, name, image_url, url)
VALUES ('41287', 'DJ Snake', 'https://images.genius.com/788e25951d4ca358d84a6237f53b7393.1000x1000x1.jpg', 'https://genius.com/artists/Dj-snake');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2069', 'Calvin Harris', 'https://images.genius.com/5a4c19533211eca706c6abdef9f14586.960x960x1.jpg', 'https://genius.com/artists/Calvin-harris');
INSERT INTO Person (id, name, image_url, url)
VALUES ('665', 'Major Lazer', 'https://images.genius.com/626ea490847672aa129086040ecb259b.1000x1000x1.jpg', 'https://genius.com/artists/Major-lazer');
INSERT INTO Person (id, name, image_url, url)
VALUES ('500', 'Bruno Mars', 'https://images.genius.com/edca1a867127a07d29f959070b1a2a5f.838x838x1.png', 'https://genius.com/artists/Bruno-mars');
INSERT INTO Person (id, name, image_url, url)
VALUES ('984358', 'Starley', 'https://images.genius.com/581ff42d240d4e5d521645a704ed79e3.1000x638x1.jpg', 'https://genius.com/artists/Starley');
INSERT INTO Person (id, name, image_url, url)
VALUES ('703', 'Foster the People', 'https://images.genius.com/797efcee81d888b8c6d053316717611f.838x838x1.jpg', 'https://genius.com/artists/Foster-the-people');
INSERT INTO Person (id, name, image_url, url)
VALUES ('568186', 'Drake & Future', 'https://images.genius.com/b033687222fde407fb97ca135c4192e1.452x452x1.jpg', 'https://genius.com/artists/Drake-and-future');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1015048', 'Zay Hilfigerrr', 'https://images.genius.com/ea9bb73b02adf7b9693749b28be94782.1000x1000x1.jpg', 'https://genius.com/artists/Zay-hilfigerrr');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1405', 'Shakira', 'https://images.genius.com/a7f249e5109d8de0631ace6d00276f2a.900x900x1.jpg', 'https://genius.com/artists/Shakira');
INSERT INTO Person (id, name, image_url, url)
VALUES ('492', 'Big Sean', 'https://images.genius.com/fe9d52d64ed689e2e66252f43efab598.1000x1000x1.jpg', 'https://genius.com/artists/Big-sean');
INSERT INTO Person (id, name, image_url, url)
VALUES ('241761', 'DRAM', 'https://images.genius.com/6356cb78f83b5bd8c293e6eb87909206.1000x750x1.jpg', 'https://genius.com/artists/Dram');
INSERT INTO Person (id, name, image_url, url)
VALUES ('980465', '21 Savage & Metro Boomin', 'https://images.genius.com/d80415ba54e748cced97ffd872f1a482.630x630x1.jpg', 'https://genius.com/artists/21-savage-and-metro-boomin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('625410', 'Rob $tone', 'https://images.genius.com/b4c411442720c17c11a38b90d3eb360d.683x683x1.png', 'https://genius.com/artists/Rob-stone');
INSERT INTO Person (id, name, image_url, url)
VALUES ('11395', 'G-Eazy', 'https://images.genius.com/5be60f1bff9e76b63f76000ba305246e.1000x1000x1.jpg', 'https://genius.com/artists/G-eazy');
INSERT INTO Person (id, name, image_url, url)
VALUES ('65238', 'Martin Garrix', 'https://images.genius.com/055a3f25a6c81bcadd91c5bf0ab6d056.400x400x1.jpg', 'https://genius.com/artists/Martin-garrix');
INSERT INTO Person (id, name, image_url, url)
VALUES ('26577', 'Aminé', 'https://images.genius.com/b84dcf6b373199720716085d766624a1.540x540x1.jpg', 'https://genius.com/artists/Amine');
INSERT INTO Person (id, name, image_url, url)
VALUES ('150934', 'The Chainsmokers', 'https://images.genius.com/3dbdcbf24ff923ce4e5feb7d777e76d1.400x400x1.png', 'https://genius.com/artists/The-chainsmokers');
INSERT INTO Person (id, name, image_url, url)
VALUES ('44080', 'Migos', 'https://images.genius.com/f9c991a8f021b26424a0ce9efa8ccee3.1000x1000x1.jpg', 'https://genius.com/artists/Migos');
INSERT INTO Person (id, name, image_url, url)
VALUES ('11795', 'Luke Christopher', 'https://images.genius.com/398ce8bc32b2f793641bf83b61547bc6.854x854x1.jpg', 'https://genius.com/artists/Luke-christopher');
INSERT INTO Person (id, name, image_url, url)
VALUES ('626678', 'Desiigner', 'https://images.genius.com/cffc1f76ca88c79f2628fee1e4386a22.640x640x1.jpg', 'https://genius.com/artists/Desiigner');
INSERT INTO Person (id, name, image_url, url)
VALUES ('565381', 'DNCE', 'https://images.genius.com/78c07131d8d6f9fe0d0d16cd8bce3f2b.640x640x1.jpg', 'https://genius.com/artists/Dnce');
INSERT INTO Person (id, name, image_url, url)
VALUES ('8662', 'The Jackson 5', 'https://images.genius.com/246f15d55b276fd2d696bde4020ad436.948x711x1.jpg', 'https://genius.com/artists/The-jackson-5');
INSERT INTO Person (id, name, image_url, url)
VALUES ('69342', 'Spotify', 'https://images.genius.com/141d96cdaf6ed557155c18ed91af11e6.1000x1000x1.png', 'https://genius.com/artists/Spotify');
INSERT INTO Person (id, name, image_url, url)
VALUES ('89', 'Rihanna', 'https://images.genius.com/8856725837a6157e574488f78d2804a2.960x960x1.jpg', 'https://genius.com/artists/Rihanna');
INSERT INTO Person (id, name, image_url, url)
VALUES ('394321', 'Alessia Cara', 'https://images.genius.com/b7cacdee274b088f932aa14c4ecb2ea7.300x300x1.jpg', 'https://genius.com/artists/Alessia-cara');
INSERT INTO Person (id, name, image_url, url)
VALUES ('106693', 'Clean Bandit', 'https://images.genius.com/5c00e16caadfb26bdd99183ccadbd6ae.1000x1000x1.png', 'https://genius.com/artists/Clean-bandit');
INSERT INTO Person (id, name, image_url, url)
VALUES ('405554', 'Noah Cyrus', 'https://images.genius.com/a7be8c702f2852d04dfe80e78d5013e2.563x563x1.png', 'https://genius.com/artists/Noah-cyrus');
INSERT INTO Person (id, name, image_url, url)
VALUES ('835', 'Michael Jackson', 'https://images.genius.com/c01e2f316435bc76798f44eea465818f.499x499x1.jpg', 'https://genius.com/artists/Michael-jackson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('993779', 'Petit Biscuit', 'https://images.genius.com/e9861e3c0df6f9300acb0c6a11f622f2.300x300x1.jpg', 'https://genius.com/artists/Petit-biscuit');
INSERT INTO Person (id, name, image_url, url)
VALUES ('13539', 'Maroon 5', 'https://images.genius.com/52af76244f7392149389dfc653cd0ec1.960x960x1.jpg', 'https://genius.com/artists/Maroon-5');
INSERT INTO Person (id, name, image_url, url)
VALUES ('16751', 'Chance the Rapper', 'https://images.genius.com/9db1a9643a028d62543e44c90da3a6ad.1000x1000x1.jpg', 'https://genius.com/artists/Chance-the-rapper');
INSERT INTO Person (id, name, image_url, url)
VALUES ('49470', 'DJ ESCO', 'https://images.genius.com/7130fa2421767d64a74aacaee4592d4b.841x841x1.jpg', 'https://genius.com/artists/Dj-esco');
INSERT INTO Person (id, name, image_url, url)
VALUES ('365', 'John Legend', 'https://images.genius.com/bd03e06628a565b7838715dfd78e346c.1000x1000x1.jpg', 'https://genius.com/artists/John-legend');
INSERT INTO Person (id, name, image_url, url)
VALUES ('177756', 'Rae Sremmurd', 'https://images.genius.com/c1c133f78a89899c77f8ac4329d4298b.645x645x1.jpg', 'https://genius.com/artists/Rae-sremmurd');
INSERT INTO Person (id, name, image_url, url)
VALUES ('264368', 'Bryson Tiller', 'https://images.genius.com/a0e91b5f06cdd8c7b3f1a87ad853a604.640x640x1.jpg', 'https://genius.com/artists/Bryson-tiller');
INSERT INTO Person (id, name, image_url, url)
VALUES ('25939', 'Sage The Gemini', 'https://images.genius.com/15c11c911d9394de7d33549cf9924c94.1000x1000x1.jpg', 'https://genius.com/artists/Sage-the-gemini');
INSERT INTO Person (id, name, image_url, url)
VALUES ('162126', 'Kodak Black', 'https://images.genius.com/5eaf111ea572a2e8b481f3af9b61eaa7.800x800x1.jpg', 'https://genius.com/artists/Kodak-black');
INSERT INTO Person (id, name, image_url, url)
VALUES ('339543', 'Young M.A', 'https://images.genius.com/eac22acf0996fe81401676d52fe00183.803x803x1.jpg', 'https://genius.com/artists/Young-ma');
INSERT INTO Person (id, name, image_url, url)
VALUES ('620092', 'Damasa', 'https://images.rapgenius.com/avatars/medium/88cb6c356a0e6ba757fc7d1240aec8ac', 'https://genius.com/artists/Damasa');
INSERT INTO Person (id, name, image_url, url)
VALUES ('204611', 'Genius', 'https://images.genius.com/8ed669cadd956443e29c70361ec4f372.1000x1000x1.png', 'https://genius.com/artists/Genius');
INSERT INTO Person (id, name, image_url, url)
VALUES ('34107', 'James Arthur', 'https://images.genius.com/e4300142f1d00d122aebf79c77adb5d4.476x476x1.jpg', 'https://genius.com/artists/James-arthur');
INSERT INTO Person (id, name, image_url, url)
VALUES ('26593', 'Jon Bellion', 'https://images.genius.com/12dade330f5b70fb5f16ebeb343a0304.724x724x1.jpg', 'https://genius.com/artists/Jon-bellion');
INSERT INTO Person (id, name, image_url, url)
VALUES ('151666', 'Pop Genius', 'https://images.genius.com/7e177b5f3341d07397a75c280dfc54ed.512x512x1.png', 'https://genius.com/artists/Pop-genius');
INSERT INTO Person (id, name, image_url, url)
VALUES ('944', 'Marvin Gaye', 'https://images.genius.com/ee7f453224dcc21cb8b8cf57475530dc.217x217x1.png', 'https://genius.com/artists/Marvin-gaye');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2578', 'David Guetta', 'https://images.genius.com/65d304cb93bbe53967e0642c105f8c4e.886x886x1.jpg', 'https://genius.com/artists/David-guetta');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1385462', 'Pessoa', 'https://images.genius.com/ed4d77ad78cba4d73a80d8cc66a1a6d5.1000x1000x1.jpg', 'https://genius.com/artists/Pessoa');
INSERT INTO Person (id, name, image_url, url)
VALUES ('47131', 'PARTYNEXTDOOR', 'https://images.genius.com/2c94d878675cd182a5b52c28073f67eb.683x683x1.jpg', 'https://genius.com/artists/Partynextdoor');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2300', 'Adele', 'https://images.genius.com/2dfd665a4ae64d9e23534c1cca7b8a03.999x999x1.jpg', 'https://genius.com/artists/Adele');
INSERT INTO Person (id, name, image_url, url)
VALUES ('334', 'Justin Timberlake', 'https://images.genius.com/d33775ee78f5b76308d1e024eb2c5867.1000x1000x1.jpg', 'https://genius.com/artists/Justin-timberlake');
INSERT INTO Person (id, name, image_url, url)
VALUES ('326362', 'Post Malone', 'https://images.genius.com/aec6f3d454b88621ec9863f05b4e89a7.937x937x1.jpg', 'https://genius.com/artists/Post-malone');
INSERT INTO Person (id, name, image_url, url)
VALUES ('991355', 'Nevada', 'https://images.genius.com/1a8609fcd6e8af45f2c9a74c1ceb629f.958x958x1.jpg', 'https://genius.com/artists/Nevada');
INSERT INTO Person (id, name, image_url, url)
VALUES ('16775', 'Sia', 'https://images.genius.com/6bcd2bd1708eeae7282400f1e4be633f.600x600x1.jpg', 'https://genius.com/artists/Sia');
INSERT INTO Person (id, name, image_url, url)
VALUES ('69', 'J. Cole', 'https://images.genius.com/034c70a439a2b0c4c13b8b346b560111.999x999x1.jpg', 'https://genius.com/artists/J-cole');
INSERT INTO Person (id, name, image_url, url)
VALUES ('164661', 'AJR', 'https://images.genius.com/9d0da8b79d9dd6156bae9d87ae33c0b8.1000x1000x1.jpg', 'https://genius.com/artists/Ajr');
INSERT INTO Person (id, name, image_url, url)
VALUES ('185600', 'Screen Genius', 'https://images.genius.com/a105ca426e365081c955f81b0ba8a89e.283x278x1.png', 'https://genius.com/artists/Screen-genius');
INSERT INTO Person (id, name, image_url, url)
VALUES ('49926', 'Hall & Oates', 'https://images.rapgenius.com/a52c3c045381464ebd52dba6148a3ac3.599x558x1.jpg', 'https://genius.com/artists/Hall-and-oates');
INSERT INTO Person (id, name, image_url, url)
VALUES ('248458', 'PnB Rock', 'https://images.genius.com/d19431d27fee165ba71d702e3bb437c3.900x900x1.jpg', 'https://genius.com/artists/Pnb-rock');
INSERT INTO Person (id, name, image_url, url)
VALUES ('563', 'Queen', 'https://images.genius.com/30a049d2de687550227ba815650eb196.585x585x1.png', 'https://genius.com/artists/Queen');
INSERT INTO Person (id, name, image_url, url)
VALUES ('992687', 'Vimto(TaylorSwift14)', 'https://images.genius.com/f0c7eb4741875841755dbc6a19b680f0.1000x1000x1.jpg', 'https://genius.com/artists/Vimtotaylorswift14');
INSERT INTO Person (id, name, image_url, url)
VALUES ('6412', 'KYLE', 'https://images.genius.com/699fca331388df27700e999e21f833db.717x717x1.jpg', 'https://genius.com/artists/Kyle');
INSERT INTO Person (id, name, image_url, url)
VALUES ('51380', 'J Gramm', 'https://images.genius.com/a2988797673127ae5dfe26f242d01ed9.1000x1000x1.jpg', 'https://genius.com/artists/J-gramm');
INSERT INTO Person (id, name, image_url, url)
VALUES ('571062', 'Ugly God', 'https://images.genius.com/02607adf69a3cc6b39b2407b402383e9.1000x1000x1.jpg', 'https://genius.com/artists/Ugly-god');
INSERT INTO Person (id, name, image_url, url)
VALUES ('49449', 'Flume', 'https://images.genius.com/f7456fb2a774947ae914ce69923fab10.433x433x1.jpg', 'https://genius.com/artists/Flume');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2180892', 'Peter Karlsson, watt & Ali Payami, Taylor Swift, Ali Payami, Max Martin & Shellback,  Clara Taroncher, Luis Ángel O’Neill, Eric Pérez, Jorge Class & Matt Rad and many more', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Peter-karlsson-watt-and-ali-payami-taylor-swift-ali-payami-max-martin-and-shellback-clara-taroncher-luis-angel-oneill-eric-perez-jorge-class-and-matt-rad-and-many-more');
INSERT INTO Person (id, name, image_url, url)
VALUES ('209397', 'John Ryan', 'https://images.genius.com/be786dfbd003b7bf7d5ca7dad32db144.640x640x1.jpg', 'https://genius.com/artists/John-ryan');
INSERT INTO Person (id, name, image_url, url)
VALUES ('228334', 'Blake Mills', 'https://images.genius.com/4d750318687e942ca5ad07efc09d6c48.700x700x1.jpg', 'https://genius.com/artists/Blake-mills');
INSERT INTO Person (id, name, image_url, url)
VALUES ('654', 'Mike Posner', 'https://images.genius.com/01d6f09f869e81a7ab29c47c122ec1cf.570x570x1.jpg', 'https://genius.com/artists/Mike-posner');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1042', 'M.I.A.', 'https://images.genius.com/add6727f4d54bc1d0e5aa7d9bba33489.1000x1000x1.png', 'https://genius.com/artists/Mia');
INSERT INTO Person (id, name, image_url, url)
VALUES ('195029', 'Shawn Mendes', 'https://images.genius.com/0ca4a269702ad6b21bd96a8233c33bd7.499x499x1.jpg', 'https://genius.com/artists/Shawn-mendes');
INSERT INTO Person (id, name, image_url, url)
VALUES ('60437', 'Fifth Harmony', 'https://images.genius.com/357e0be14e32a48ef2120ea81f0ebd64.400x400x1.jpg', 'https://genius.com/artists/Fifth-harmony');
INSERT INTO Person (id, name, image_url, url)
VALUES ('48185', '​gnash', 'https://images.genius.com/c5970cf8d80b1adf6e1d6d24bf53f3cc.660x660x1.jpg', 'https://genius.com/artists/Gnash');
INSERT INTO Person (id, name, image_url, url)
VALUES ('37880', 'P-Money (Producer)', 'https://images.genius.com/dc9332ab2324e93927e007470ab16e03.489x448x1.jpg', 'https://genius.com/artists/P-money-producer');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1061395', 'Ryan Riback', 'https://images.genius.com/453e6bc099b44b1be15ad885584e5da2.1000x1000x1.jpg', 'https://genius.com/artists/Ryan-riback');
INSERT INTO Person (id, name, image_url, url)
VALUES ('610968', 'Lil Yachty', 'https://images.genius.com/e9ed7a062d51e2c00a01c863ce55826f.851x851x1.jpg', 'https://genius.com/artists/Lil-yachty');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1050477', 'Big Taste', 'https://images.genius.com/d7c835a8e5881292814529448c4e0f99.854x854x1.jpg', 'https://genius.com/artists/Big-taste');
INSERT INTO Person (id, name, image_url, url)
VALUES ('481514', 'Gladius', 'https://images.genius.com/0f4e6799a01016d5cce92dba20fb47b3.750x750x1.jpg', 'https://genius.com/artists/Gladius');
INSERT INTO Person (id, name, image_url, url)
VALUES ('71540', 'Axident', 'https://images.genius.com/2983de44a4d274d05310b1f0411c7830.535x535x1.png', 'https://genius.com/artists/Axident');
INSERT INTO Person (id, name, image_url, url)
VALUES ('165764', 'Ian Kirkpatrick', 'https://images.genius.com/c19fb840c90ac18761476669fd20386e.626x626x1.jpg', 'https://genius.com/artists/Ian-kirkpatrick');
INSERT INTO Person (id, name, image_url, url)
VALUES ('527629', 'Joe London', 'https://images.genius.com/f86739c6f774505f1250997c2af547bc.239x239x1.jpg', 'https://genius.com/artists/Joe-london');
INSERT INTO Person (id, name, image_url, url)
VALUES ('639684', 'Snavs', 'https://images.genius.com/4fed0665ede0977530a6784a3ac935df.512x512x1.jpg', 'https://genius.com/artists/Snavs');
INSERT INTO Person (id, name, image_url, url)
VALUES ('158919', 'CMC$', 'https://images.genius.com/568b742509ee80b60521adf3991a7695.640x640x1.jpg', 'https://genius.com/artists/Cmc');
INSERT INTO Person (id, name, image_url, url)
VALUES ('632021', 'Ilsey', 'https://images.genius.com/e6954405cbbc341b758246c77c2a37c2.400x400x1.jpg', 'https://genius.com/artists/Ilsey');
INSERT INTO Person (id, name, image_url, url)
VALUES ('649708', 'Stephen Philibin', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Stephen-philibin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('19818', 'RuthAnne', 'https://images.genius.com/0eb08365d743f78a4148bbb1394822bc.400x400x1.jpg', 'https://genius.com/artists/Ruthanne');
INSERT INTO Person (id, name, image_url, url)
VALUES ('309511', 'Matt Rad', 'https://images.genius.com/4079e482fdc825c4fb0acbb4f41cf209.409x409x1.png', 'https://genius.com/artists/Matt-rad');
INSERT INTO Person (id, name, image_url, url)
VALUES ('104044', 'Bebe Rexha', 'https://images.genius.com/bff53ef87d2d92efc61b59aa3dfc2539.400x400x1.jpg', 'https://genius.com/artists/Bebe-rexha');
INSERT INTO Person (id, name, image_url, url)
VALUES ('26507', 'Ariana Grande', 'https://images.genius.com/3b393fc39f48d3acb3566075b1565ce5.320x320x1.jpg', 'https://genius.com/artists/Ariana-grande');
INSERT INTO Person (id, name, image_url, url)
VALUES ('217208', 'Lil Uzi Vert', 'https://images.genius.com/05f2ee7ef53d1a68352ec67cda793d0c.469x469x1.jpg', 'https://genius.com/artists/Lil-uzi-vert');
INSERT INTO Person (id, name, image_url, url)
VALUES ('23796', '​twenty one pilots', 'https://images.genius.com/5187915a46562e8316fa62a49ff1aee7.1000x1000x1.jpg', 'https://genius.com/artists/Twenty-one-pilots');
INSERT INTO Person (id, name, image_url, url)
VALUES ('357', 'Justin Bieber', 'https://images.genius.com/b8a71aef947716b9e24dcbea07fd23d1.800x800x1.jpg', 'https://genius.com/artists/Justin-bieber');
INSERT INTO Person (id, name, image_url, url)
VALUES ('543018', 'Kevin ADG', 'https://images.genius.com/d32c84d762645e585cbde0015cf298d4.400x400x1.jpg', 'https://genius.com/artists/Kevin-adg');
INSERT INTO Person (id, name, image_url, url)
VALUES ('405415', 'Maluma', 'https://images.genius.com/27d41ec9929223155c33c152e8f65182.400x400x1.png', 'https://genius.com/artists/Maluma');
INSERT INTO Person (id, name, image_url, url)
VALUES ('543019', 'Chan El Genio', 'https://images.genius.com/a63a17cdea15ab0f4ce2813b53f3fd89.768x768x1.jpg', 'https://genius.com/artists/Chan-el-genio');
INSERT INTO Person (id, name, image_url, url)
VALUES ('55411', 'Kenai', 'https://images.genius.com/d7ac81c90b8f08c5ae02c9439e465ea0.614x614x1.jpg', 'https://genius.com/artists/Kenai');
INSERT INTO Person (id, name, image_url, url)
VALUES ('20185', 'Travis Scott', 'https://images.genius.com/0374eff2298dbc5612d9558952cf2573.999x999x1.jpg', 'https://genius.com/artists/Travis-scott');
INSERT INTO Person (id, name, image_url, url)
VALUES ('250301', 'Charlie Puth', 'https://images.genius.com/d500c261f708ced0580af6696f8413fb.418x418x1.png', 'https://genius.com/artists/Charlie-puth');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1030827', 'DJ Kyriakides', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Dj-kyriakides');
INSERT INTO Person (id, name, image_url, url)
VALUES ('131676', 'Dan Romer', 'https://images.genius.com/8e40b78c5a581a8096e134e24cc5b593.521x521x1.jpg', 'https://genius.com/artists/Dan-romer');
INSERT INTO Person (id, name, image_url, url)
VALUES ('354283', 'Teddy Geiger', 'https://images.genius.com/79af4a2ba84ef0254d9bf68913a7c792.432x432x1.png', 'https://genius.com/artists/Teddy-geiger');
INSERT INTO Person (id, name, image_url, url)
VALUES ('71876', 'Scott Harris', 'https://images.genius.com/c9b03c89c8b881a36166d1099c4d7778.1000x1000x1.jpg', 'https://genius.com/artists/Scott-harris');
INSERT INTO Person (id, name, image_url, url)
VALUES ('49698', 'Cashmere Cat', 'https://images.genius.com/198d834497b4fa39667f137f98ea22ae.552x552x1.jpg', 'https://genius.com/artists/Cashmere-cat');
INSERT INTO Person (id, name, image_url, url)
VALUES ('28906', '​benny blanco', 'https://images.genius.com/07647177780837286bcd0fa950819462.1000x1000x1.jpg', 'https://genius.com/artists/Benny-blanco');
INSERT INTO Person (id, name, image_url, url)
VALUES ('28169', 'Frank Dukes', 'https://images.genius.com/cdc1e3192af06b780209ec9e4959d1b1.1000x1000x1.jpg', 'https://genius.com/artists/Frank-dukes');
INSERT INTO Person (id, name, image_url, url)
VALUES ('45372', 'Selena Gomez', 'https://images.genius.com/902d3ed593ed6f5e70efd5f694444c5b.960x960x1.jpg', 'https://genius.com/artists/Selena-gomez');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1632', 'Tory Lanez', 'https://images.genius.com/bdbe07b5106b7d2bd8fe6ed477ef3e2c.1000x1000x1.jpg', 'https://genius.com/artists/Tory-lanez');
INSERT INTO Person (id, name, image_url, url)
VALUES ('162702', 'Starrah', 'https://images.genius.com/1ea6c29578bc6e73588d14f269246ffb.770x770x1.png', 'https://genius.com/artists/Starrah');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1745', 'Childish Gambino', 'https://images.genius.com/90d733d87dcdbe5bb5f89062e6fb381f.500x500x1.jpg', 'https://genius.com/artists/Childish-gambino');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2197', 'Future', 'https://images.genius.com/833e2b1d817f1320be26668c01b3be33.780x780x1.png', 'https://genius.com/artists/Future');
INSERT INTO Person (id, name, image_url, url)
VALUES ('58613', 'Donut', 'https://images.genius.com/4519942a3d366f9398f8be181c717e2d.400x400x1.jpg', 'https://genius.com/artists/Donut');
INSERT INTO Person (id, name, image_url, url)
VALUES ('21716', 'Needlz', 'https://s3.amazonaws.com/rapgenius/1361806590_Needlz.jpg', 'https://genius.com/artists/Needlz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2196399', 'Khairi Cain', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Khairi-cain');
INSERT INTO Person (id, name, image_url, url)
VALUES ('341322', 'Liana Bank$', 'https://images.genius.com/e61f7d6c80d0cba23f7f7fd689fa3386.540x540x10.gif', 'https://genius.com/artists/Liana-bank');
INSERT INTO Person (id, name, image_url, url)
VALUES ('980212', 'Lil Jay (Crime Mob)', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Lil-jay-crime-mob');
INSERT INTO Person (id, name, image_url, url)
VALUES ('980801', 'Zayion McCall', 'https://images.genius.com/0b7b82039fb4df7392a60b11b58070cb.640x640x1.jpg', 'https://genius.com/artists/Zayion-mccall');
INSERT INTO Person (id, name, image_url, url)
VALUES ('136287', 'Martin Terefe', 'https://images.genius.com/856dd7bd60b4b3b44c6a12d03bf61c54.870x425x1.jpg', 'https://genius.com/artists/Martin-terefe');
INSERT INTO Person (id, name, image_url, url)
VALUES ('648391', 'Seeb', 'https://images.genius.com/d387ae8e2d4cba608e2017a51741ea77.1000x1000x1.jpg', 'https://genius.com/artists/Seeb');
INSERT INTO Person (id, name, image_url, url)
VALUES ('35155', 'Christoph Andersson', 'https://images.genius.com/637adb234d8f945d9ace5ebad35c9368.1000x1000x1.jpg', 'https://genius.com/artists/Christoph-andersson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('333306', 'Rice N’ Peas', 'https://images.genius.com/0a9a86d4f1dabad4591bf2731bb78e1d.750x750x1.jpg', 'https://genius.com/artists/Rice-n-peas');
INSERT INTO Person (id, name, image_url, url)
VALUES ('986319', 'Mike Woods', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Mike-woods');
INSERT INTO Person (id, name, image_url, url)
VALUES ('669399', 'Kevin White', 'https://images.genius.com/7fd89e9fb2f45e3903d96cf7ff360765.388x388x1.png', 'https://genius.com/artists/Kevin-white');
INSERT INTO Person (id, name, image_url, url)
VALUES ('148908', 'Marc E. Bassy', 'https://images.genius.com/aa539d7f9b08069cf46792582c2b7045.600x392x1.jpg', 'https://genius.com/artists/Marc-e-bassy');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27822', 'Zaytoven', 'https://images.genius.com/eec0806a75c053ed0882a1fe3198668e.1000x1000x1.jpg', 'https://genius.com/artists/Zaytoven');
INSERT INTO Person (id, name, image_url, url)
VALUES ('44575', 'London on da Track', 'https://images.genius.com/fcb14975af51a27a0ffb278a7524c81d.400x400x1.jpg', 'https://genius.com/artists/London-on-da-track');
INSERT INTO Person (id, name, image_url, url)
VALUES ('430404', '21 Savage', 'https://images.genius.com/38af6f15c4c3af0551bde5b9ee778d6e.889x889x1.jpg', 'https://genius.com/artists/21-savage');
INSERT INTO Person (id, name, image_url, url)
VALUES ('130', 'Drake', 'https://images.genius.com/bc985312781041952f9a11b657d7d0b8.905x905x1.jpg', 'https://genius.com/artists/Drake');
INSERT INTO Person (id, name, image_url, url)
VALUES ('55444', 'Greg Kurstin', 'https://images.genius.com/1e4b1db8fef9629acc9f622e3f4ecbf9.440x440x1.jpg', 'https://genius.com/artists/Greg-kurstin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('558190', 'Danny Wolf', 'https://images.genius.com/6070c99048e6978e797d08506b25a4c6.914x914x1.jpg', 'https://genius.com/artists/Danny-wolf');
INSERT INTO Person (id, name, image_url, url)
VALUES ('160032', 'Louie Lastic', 'https://images.genius.com/ee27a61769e10cd12a06ab5016d15324.638x638x1.jpg', 'https://genius.com/artists/Louie-lastic');
INSERT INTO Person (id, name, image_url, url)
VALUES ('33076', 'The Arcade', 'https://images.genius.com/4bdcc48a27aaaa21a88c4d955414a5ef.646x646x1.png', 'https://genius.com/artists/The-arcade');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1015154', 'Alex Ben-Abdullah', 'https://images.genius.com/ed96aab805e84d2b098c083ef41bbf8f.500x500x1.jpg', 'https://genius.com/artists/Alex-ben-abdullah');
INSERT INTO Person (id, name, image_url, url)
VALUES ('651315', 'Jon Mills', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Jon-mills');
INSERT INTO Person (id, name, image_url, url)
VALUES ('651316', 'Kurtis McKenzie', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Kurtis-mckenzie');
INSERT INTO Person (id, name, image_url, url)
VALUES ('155257', 'Ammar Malik', 'https://images.genius.com/4791a8a57f145327262c6f8a4bfc72d1.500x333x1.jpg', 'https://genius.com/artists/Ammar-malik');
INSERT INTO Person (id, name, image_url, url)
VALUES ('285817', 'Jacob Kasher', 'https://images.genius.com/c3dc9da9fafb5fd980d85ead05751b9a.200x200x1.jpg', 'https://genius.com/artists/Jacob-kasher');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1421', 'Kendrick Lamar', 'https://images.genius.com/25d8a9c93ab97e9e6d5d1d9d36e64a53.1000x1000x1.jpg', 'https://genius.com/artists/Kendrick-lamar');
INSERT INTO Person (id, name, image_url, url)
VALUES ('669', 'Adam Levine', 'https://images.genius.com/cc964ee2d36cd6f5046f18c6696f6992.1000x1000x1.jpg', 'https://genius.com/artists/Adam-levine');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1002050', 'Pasqué', 'https://s3.amazonaws.com/filepicker-images-rapgenius/DrpFz7maSSm1S6zE9Y9F_15035648_2150274645197051_2348732213329133568_n.jpg', 'https://genius.com/artists/Pasque');
INSERT INTO Person (id, name, image_url, url)
VALUES ('57092', 'Sigma', 'https://images.genius.com/05b1688e204aef6127fb0617d2b0a7c7.1000x667x1.jpg', 'https://genius.com/artists/Sigma');
INSERT INTO Person (id, name, image_url, url)
VALUES ('660558', 'Andrew Taggart', 'https://images.genius.com/5365afd9d2fbedf518a6d079b4573b8f.766x766x1.jpg', 'https://genius.com/artists/Andrew-taggart');
INSERT INTO Person (id, name, image_url, url)
VALUES ('331090', 'XYLØ', 'https://images.genius.com/33f9097c0d81d7d8487bd2d6070bed4e.1000x1000x1.jpg', 'https://genius.com/artists/Xyl');
INSERT INTO Person (id, name, image_url, url)
VALUES ('654749', 'Jon Asher', 'https://images.genius.com/132701a560f7c233f871bd575b6317fe.600x600x1.jpg', 'https://genius.com/artists/Jon-asher');
INSERT INTO Person (id, name, image_url, url)
VALUES ('223447', 'Melanie Fontana', 'https://images.genius.com/764190e66c28ce66d5b857cc21dde9f9.222x222x1.jpg', 'https://genius.com/artists/Melanie-fontana');
INSERT INTO Person (id, name, image_url, url)
VALUES ('51166', 'Purp Dogg', 'https://images.genius.com/2a80f7adf7dd1656b6145f75c03e86a3.640x640x1.jpg', 'https://genius.com/artists/Purp-dogg');
INSERT INTO Person (id, name, image_url, url)
VALUES ('7798', 'Inaya Day', 'https://images.genius.com/fc625995dcd2dc3792a70ee748a2d374.644x644x1.jpg', 'https://genius.com/artists/Inaya-day');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2184909', 'Christopher Rowe', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Christopher-rowe');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2184908', 'Antonio Carrillo', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Antonio-carrillo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('481172', 'Bernard Herrmann', 'https://images.genius.com/77928249b33c5ad80857b215520fe644.400x400x1.jpg', 'https://genius.com/artists/Bernard-herrmann');
INSERT INTO Person (id, name, image_url, url)
VALUES ('10586', 'Spooks', 'https://images.genius.com/dd0f83ca3b12867ca2926978dfa8712b.1000x1000x1.jpg', 'https://genius.com/artists/Spooks');
INSERT INTO Person (id, name, image_url, url)
VALUES ('579526', 'J. Davi$', 'https://s3.amazonaws.com/filepicker-images-rapgenius/fZWy1dVS0yFt9YCWjCWQ_avatars-000215087193-52zi81-t500x500.jpg', 'https://genius.com/artists/J-davi');
INSERT INTO Person (id, name, image_url, url)
VALUES ('628652', 'The Good Perry', 'https://images.genius.com/b3cd5daeb4714944c0d629c1b3c4a494.360x360x1.jpg', 'https://genius.com/artists/The-good-perry');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1028671', 'StepBfly', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Stepbfly');
INSERT INTO Person (id, name, image_url, url)
VALUES ('54077', 'Cassius Jay', 'https://images.genius.com/836b476920a62732094994af5e308533.834x834x1.jpg', 'https://genius.com/artists/Cassius-jay');
INSERT INTO Person (id, name, image_url, url)
VALUES ('52806', 'Jake Gosling', 'https://images.genius.com/68f24fd6e97083af9dd6700777fdf6fc.1000x708x1.jpg', 'https://genius.com/artists/Jake-gosling');
INSERT INTO Person (id, name, image_url, url)
VALUES ('652571', 'Danny Parker', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Danny-parker');
INSERT INTO Person (id, name, image_url, url)
VALUES ('43747', 'Phonix Beats', 'https://images.genius.com/b725745b8504a3ec6b52a4129bc2bd70.200x160x1.jpg', 'https://genius.com/artists/Phonix-beats');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27836', 'Shellback', 'https://images.genius.com/9389950a951ffc6fa639e2817609adee.618x348x1.jpg', 'https://genius.com/artists/Shellback');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27835', 'Max Martin', 'https://images.genius.com/a51caeddc969b881e80f7da75b6930ba.539x539x1.jpg', 'https://genius.com/artists/Max-martin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('988135', 'Naz', 'https://images.genius.com/7c98869718692329e3d2bda4ad66ecda.500x500x1.jpg', 'https://genius.com/artists/Naz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('593495', 'Lege Kale', 'https://images.genius.com/7d46cda7ceb1c3f6f27b525bbe2629e0.1000x1000x1.jpg', 'https://genius.com/artists/Lege-kale');
INSERT INTO Person (id, name, image_url, url)
VALUES ('573625', 'SuperDuperBrick', 'https://images.genius.com/305dd26443f68aafe10993e48727703c.804x804x1.jpg', 'https://genius.com/artists/Superduperbrick');
INSERT INTO Person (id, name, image_url, url)
VALUES ('34533', 'Ben Billions', 'https://images.genius.com/09f61531af507bb45d353f1d3e6545ae.522x522x1.jpg', 'https://genius.com/artists/Ben-billions');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27655', 'Doc McKinney', 'https://images.genius.com/3d76bf45c9a8ac094098e8630665e9d6.999x999x1.jpg', 'https://genius.com/artists/Doc-mckinney');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2358', 'The Weeknd', 'https://images.genius.com/6dddd0ef3b7f04df34e6bf95ca70975e.683x683x1.jpg', 'https://genius.com/artists/The-weeknd');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1362', 'Belly', 'https://s3.amazonaws.com/filepicker-images-rapgenius/HorpSGA7Qqar8HM5ScIx_Belly1.jpg', 'https://genius.com/artists/Belly');
INSERT INTO Person (id, name, image_url, url)
VALUES ('15740', 'Lana Del Rey', 'https://images.genius.com/e2096df3a04a6860907c2ba8a9b89126.1000x1000x1.jpg', 'https://genius.com/artists/Lana-del-rey');
INSERT INTO Person (id, name, image_url, url)
VALUES ('580572', 'Maaly Raw', 'https://images.genius.com/f4402f50b5207c85b0bf7f96e3523e81.500x500x1.jpg', 'https://genius.com/artists/Maaly-raw');
INSERT INTO Person (id, name, image_url, url)
VALUES ('23691', 'Don Cannon', 'https://images.genius.com/6156ca1935801d31a89bde5dfcc39d91.1000x1000x1.jpg', 'https://genius.com/artists/Don-cannon');
INSERT INTO Person (id, name, image_url, url)
VALUES ('43733', 'P-Nasty', 'https://images.genius.com/2d36dd42cb4872649f750fd2403db38c.537x537x1.jpg', 'https://genius.com/artists/P-nasty');
INSERT INTO Person (id, name, image_url, url)
VALUES ('335759', 'Slim Jxmmi', 'https://images.genius.com/0611b61677b3163a555e15a1ee50fe0a.976x976x1.jpg', 'https://genius.com/artists/Slim-jxmmi');
INSERT INTO Person (id, name, image_url, url)
VALUES ('209139', 'Swae Lee', 'https://images.genius.com/9a8ca2288987bb9d4e450ff5de598c78.905x905x1.jpg', 'https://genius.com/artists/Swae-lee');
INSERT INTO Person (id, name, image_url, url)
VALUES ('51766', 'Steve Mac', 'https://images.genius.com/22c669fee07999a9a8f32a6e47ed11d3.452x452x1.jpg', 'https://genius.com/artists/Steve-mac');
INSERT INTO Person (id, name, image_url, url)
VALUES ('188055', 'Mark Ralph', 'https://images.genius.com/432b37bfaca9f57e21966ccd609edfd1.356x356x1.jpg', 'https://genius.com/artists/Mark-ralph');
INSERT INTO Person (id, name, image_url, url)
VALUES ('740', 'Sean Paul', 'https://images.genius.com/0ee770c8815ffef8de79f96ea89705a3.1000x1000x1.jpg', 'https://genius.com/artists/Sean-paul');
INSERT INTO Person (id, name, image_url, url)
VALUES ('262801', 'Ina Wroldsen', 'https://images.genius.com/f5a6bf30936fc220300e13bc71576490.249x249x1.jpg', 'https://genius.com/artists/Ina-wroldsen');
INSERT INTO Person (id, name, image_url, url)
VALUES ('188054', 'Jack Patterson', 'https://images.genius.com/078f4541df880eebb368d24289e5352d.1000x1000x1.jpg', 'https://genius.com/artists/Jack-patterson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('296675', 'Anne-Marie', 'https://images.genius.com/0f27e23577a8586401d9dac5f3d0e132.1000x1000x1.jpg', 'https://genius.com/artists/Anne-marie');
INSERT INTO Person (id, name, image_url, url)
VALUES ('14777', 'Elite', 'https://images.genius.com/5fbda8ecf10964f411746a9e716b5e91.340x223x1.png', 'https://genius.com/artists/Elite');
INSERT INTO Person (id, name, image_url, url)
VALUES ('647112', 'Ronnie Foster', 'https://images.genius.com/782aa8312de16d34082f3dbebe95f0dc.400x400x1.jpg', 'https://genius.com/artists/Ronnie-foster');
INSERT INTO Person (id, name, image_url, url)
VALUES ('720', 'Labrinth', 'https://images.genius.com/d784918b09cd5e9577a51806a70497ac.1000x1000x1.jpg', 'https://genius.com/artists/Labrinth');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1028969', 'Alex Beitzke', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Alex-beitzke');
INSERT INTO Person (id, name, image_url, url)
VALUES ('618451', 'Bradley Spence', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Bradley-spence');
INSERT INTO Person (id, name, image_url, url)
VALUES ('997039', 'Neil Ormandy', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Neil-ormandy');
INSERT INTO Person (id, name, image_url, url)
VALUES ('997040', 'Steve Solomon', 'https://images.genius.com/aa488e485081376b670b5e0536af95a5.510x510x1.png', 'https://genius.com/artists/Steve-solomon');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27597', 'Cardiak', 'https://images.genius.com/1ad3a6aae54a390fcae2a1dea7147f80.311x311x1.jpg', 'https://genius.com/artists/Cardiak');
INSERT INTO Person (id, name, image_url, url)
VALUES ('30425', 'Cirkut', 'https://s3.amazonaws.com/rapgenius/cirkut.jpg', 'https://genius.com/artists/Cirkut');
INSERT INTO Person (id, name, image_url, url)
VALUES ('665102', 'Billy Walsh', 'https://images.genius.com/170b4ddf4b08df97ae2dfc498aae9f12.490x490x1.jpg', 'https://genius.com/artists/Billy-walsh');
INSERT INTO Person (id, name, image_url, url)
VALUES ('608241', 'Sir Dylan', 'https://images.genius.com/b64206d98f0a19e04974bf3a4acf2142.1000x1000x1.jpg', 'https://genius.com/artists/Sir-dylan');
INSERT INTO Person (id, name, image_url, url)
VALUES ('616112', 'Prince 85', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Prince-85');
INSERT INTO Person (id, name, image_url, url)
VALUES ('143593', 'Brasstracks', 'https://images.genius.com/c52a776fa9f1b7902f7cc6a24b926b23.400x400x1.jpg', 'https://genius.com/artists/Brasstracks');
INSERT INTO Person (id, name, image_url, url)
VALUES ('130026', '​theMIND', 'https://images.genius.com/e698c1c195f0b946157be8602c3c4902.467x467x1.jpg', 'https://genius.com/artists/Themind');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668557', 'Rachel Cato', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Rachel-cato');
INSERT INTO Person (id, name, image_url, url)
VALUES ('4', 'Lil Wayne', 'https://images.genius.com/b42bde67bc461dd55a00b577f33673bb.745x745x1.jpg', 'https://genius.com/artists/Lil-wayne');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668556', 'Lakeitsha Williams', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Lakeitsha-williams');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668555', 'Jonathan Hoard', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Jonathan-hoard');
INSERT INTO Person (id, name, image_url, url)
VALUES ('641040', 'Jeff Lane', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Jeff-lane');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668554', 'Jamie Woods', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Jamie-woods');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668553', 'James Francies', 'https://images.genius.com/441e8e3225533e1e9f2ad635b79c61ec.1000x1000x1.jpg', 'https://genius.com/artists/James-francies');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668366', 'HaHa Davis', 'https://images.genius.com/cbae93de42ce26cdca81fe7bab952c35.300x300x1.jpg', 'https://genius.com/artists/Haha-davis');
INSERT INTO Person (id, name, image_url, url)
VALUES ('572674', 'Cam O’bi', 'https://images.genius.com/4a69e4b0d7ab72f32a7c0adb9d002296.313x313x1.jpg', 'https://genius.com/artists/Cam-obi');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668552', 'Ashwin Torke', 'https://i.genius.com/bb9c12197ce3e7557ebab26678cffd7d30c88a85?url=https%3A%2F%2Fplatform-lookaside.fbsbx.com%2Fplatform%2Fprofilepic%2F%3Fasid%3D661287730881020%26height%3D200%26width%3D200%26ext%3D1529167957%26hash%3DAeTwlqoWdtBRmw4z', 'https://genius.com/artists/Ashwin-torke');
INSERT INTO Person (id, name, image_url, url)
VALUES ('14325', '2 Chainz', 'https://images.genius.com/f82a00deb2e816cc89005a9839eead69.1000x1000x1.jpg', 'https://genius.com/artists/2-chainz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27616', 'Vinylz', 'https://s3.amazonaws.com/rapgenius/1372924433_Vinylz-e1366826599913.jpg', 'https://genius.com/artists/Vinylz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('773986', 'Raul Cubina', 'https://images.genius.com/665310a0dbae1d6f4cc1d1fda35a1e3b.711x711x1.jpg', 'https://genius.com/artists/Raul-cubina');
INSERT INTO Person (id, name, image_url, url)
VALUES ('133136', 'Mark Williams', 'https://images.genius.com/45a0c43d434495c10669b88b7e45f83d.583x583x1.jpg', 'https://genius.com/artists/Mark-williams');
INSERT INTO Person (id, name, image_url, url)
VALUES ('346989', 'Travis Mendes', 'https://images.genius.com/5250c82adbd0166d45b3d99d03ab7a8e.1000x1000x1.jpg', 'https://genius.com/artists/Travis-mendes');
INSERT INTO Person (id, name, image_url, url)
VALUES ('359481', 'Roger Taylor', 'https://images.genius.com/0ac230359e1eab2216407dfa309cb95b.1000x1000x1.jpg', 'https://genius.com/artists/Roger-taylor');
INSERT INTO Person (id, name, image_url, url)
VALUES ('16631', 'Brian May', 'https://images.genius.com/66a71f8636105894572903964d9f7568.433x433x1.jpg', 'https://genius.com/artists/Brian-may');
INSERT INTO Person (id, name, image_url, url)
VALUES ('60493', 'Freddie Mercury', 'https://images.genius.com/27a4dfc9ecce8af0a793c23cf52db418.620x813x1.jpg', 'https://genius.com/artists/Freddie-mercury');
INSERT INTO Person (id, name, image_url, url)
VALUES ('540192', 'Olivia O’Brien', 'https://images.genius.com/246406e88db8146800f03a61f458a5f8.1000x1000x1.jpg', 'https://genius.com/artists/Olivia-obrien');
INSERT INTO Person (id, name, image_url, url)
VALUES ('155062', 'ILYA', 'https://images.genius.com/addfef0d7220105b2f51da5a73fa008c.587x587x1.jpg', 'https://genius.com/artists/Ilya');
INSERT INTO Person (id, name, image_url, url)
VALUES ('302826', 'Alexander Kronlund', 'https://images.genius.com/392e64ad9329d57363b34d41f13e2a35.401x401x1.jpg', 'https://genius.com/artists/Alexander-kronlund');
INSERT INTO Person (id, name, image_url, url)
VALUES ('179206', 'Savan Kotecha', 'https://images.genius.com/4bc4f41a26a9ddccb4016b909f0c2ca0.438x344x1.jpg', 'https://genius.com/artists/Savan-kotecha');
INSERT INTO Person (id, name, image_url, url)
VALUES ('12802', 'Mano', 'https://images.genius.com/aefe724b90685733e878007fc71a1c01.1000x1000x1.jpg', 'https://genius.com/artists/Mano');
INSERT INTO Person (id, name, image_url, url)
VALUES ('147213', 'Bobby Raps', 'https://images.genius.com/e9a2b46e9953b94dba77a50118e800ba.705x705x1.jpg', 'https://genius.com/artists/Bobby-raps');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27467', 'Ali Shaheed Muhammad', 'https://images.genius.com/ace9cb697c36e9db11a9e1cc64a76b01.224x224x1.jpg', 'https://genius.com/artists/Ali-shaheed-muhammad');
INSERT INTO Person (id, name, image_url, url)
VALUES ('162101', 'Daniel Wilson', 'https://images.genius.com/456e4d65147d28270b66bbccaa8aa7fb.512x512x1.jpg', 'https://genius.com/artists/Daniel-wilson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('33010', 'Metro Boomin', 'https://images.genius.com/94086fe06834a3f3147dfbd52f729cad.940x940x1.jpg', 'https://genius.com/artists/Metro-boomin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('574528', 'DaHeala', 'https://images.genius.com/9c08e6de716f1f6838672ca295a32747.1000x1000x1.jpg', 'https://genius.com/artists/Daheala');
INSERT INTO Person (id, name, image_url, url)
VALUES ('150927', 'John Oates', 'https://images.genius.com/1fc0b535ab295a717e1702ba4d63a38f.553x553x1.jpg', 'https://genius.com/artists/John-oates');
INSERT INTO Person (id, name, image_url, url)
VALUES ('3309', 'Daryl Hall', 'https://images.genius.com/2da6014fcde86c12914f7e2f25cbc5fd.400x398x1.jpg', 'https://genius.com/artists/Daryl-hall');
INSERT INTO Person (id, name, image_url, url)
VALUES ('676109', 'Geoffrey Patrick Earley', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Geoffrey-patrick-earley');
INSERT INTO Person (id, name, image_url, url)
VALUES ('676108', 'De Gasperis Brigante', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/De-gasperis-brigante');
INSERT INTO Person (id, name, image_url, url)
VALUES ('8743', 'Kai', 'https://images.genius.com/b168c5462cfd5baa9547d3b843912c92.950x950x1.png', 'https://genius.com/artists/Kai');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1012903', 'Shampoo Press & Curl', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Shampoo-press-and-curl');
INSERT INTO Person (id, name, image_url, url)
VALUES ('49094', 'Philip Lawrence', 'https://images.genius.com/6ee4730c24f39ead0ad526ecc8d4fc8e.300x300x1.jpg', 'https://genius.com/artists/Philip-lawrence');
INSERT INTO Person (id, name, image_url, url)
VALUES ('47127', 'Brody Brown', 'https://images.genius.com/31498855fd807d98e9593889d040e3c0.400x400x1.jpg', 'https://genius.com/artists/Brody-brown');
INSERT INTO Person (id, name, image_url, url)
VALUES ('551992', 'Emily Warren', 'https://images.genius.com/dee60c7cd10972d77896ce60fc308523.400x400x1.jpg', 'https://genius.com/artists/Emily-warren');
INSERT INTO Person (id, name, image_url, url)
VALUES ('508218', 'Daya', 'https://images.genius.com/0397fc4cb5fad9d8d7c665e48995ab0d.400x400x1.png', 'https://genius.com/artists/Daya');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1003643', 'Ryan Met', 'https://images.genius.com/b3c4edb3d4963731b84f0d1748aa396d.480x480x1.jpg', 'https://genius.com/artists/Ryan-met');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1108378', 'Adam Met', 'https://images.genius.com/3a4ba688010cb9399ca191cb620a76fa.1000x1000x1.jpg', 'https://genius.com/artists/Adam-met');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1108379', 'Jack Met', 'https://images.genius.com/711b911afd802d1327dd46f02b5d6759.300x300x1.jpg', 'https://genius.com/artists/Jack-met');
INSERT INTO Person (id, name, image_url, url)
VALUES ('29978', 'Mike WiLL Made-It', 'https://images.genius.com/1d29ef19a466f4bf49282b4d020cb593.895x895x1.jpg', 'https://genius.com/artists/Mike-will-made-it');
INSERT INTO Person (id, name, image_url, url)
VALUES ('13', 'Gucci Mane', 'https://images.genius.com/6f0a4980c8ef838036229e1d4dcd036c.408x408x1.jpg', 'https://genius.com/artists/Gucci-mane');
INSERT INTO Person (id, name, image_url, url)
VALUES ('39585', 'Kuk Harrell', 'https://images.genius.com/a16a2b3bcebd44e926a780725d37e9c7.400x400x1.jpg', 'https://genius.com/artists/Kuk-harrell');
INSERT INTO Person (id, name, image_url, url)
VALUES ('55089', 'Twice as Nice', 'https://images.genius.com/722bcad19536a240e5608d83933a1ba7.200x200x1.jpg', 'https://genius.com/artists/Twice-as-nice');
INSERT INTO Person (id, name, image_url, url)
VALUES ('29780', 'Mustard', 'https://s3.amazonaws.com/filepicker-images-rapgenius/a5Gy2GnyR0ijw96H739w_dj-mustard-bw-2016-billboard-1548.jpg', 'https://genius.com/artists/Mustard');
INSERT INTO Person (id, name, image_url, url)
VALUES ('671661', 'Nicholas Audino', 'https://images.genius.com/9c061e33bcb99d8777d86a96f7aa66a5.361x361x1.png', 'https://genius.com/artists/Nicholas-audino');
INSERT INTO Person (id, name, image_url, url)
VALUES ('642979', 'Sickdrumz', 'https://images.genius.com/1aa98ae799be2f0a74a2ca6734adc385.573x573x1.jpg', 'https://genius.com/artists/Sickdrumz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1306886', 'Derrus Rachel', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Derrus-rachel');
INSERT INTO Person (id, name, image_url, url)
VALUES ('499861', 'Lewis Hughes', 'https://images.genius.com/b17a4a1ed8a7e5ce08daa1abeb57f837.394x394x1.png', 'https://genius.com/artists/Lewis-hughes');
INSERT INTO Person (id, name, image_url, url)
VALUES ('325049', 'Khaled Rohaim', 'https://images.genius.com/49caf45c9dfa0d332c9b3ad3e68522a7.376x376x1.jpg', 'https://genius.com/artists/Khaled-rohaim');
INSERT INTO Person (id, name, image_url, url)
VALUES ('19132', 'Prince Charlez', 'https://images.genius.com/7b8078f770bc6602fb81b64b25632fad.1000x1000x1.jpg', 'https://genius.com/artists/Prince-charlez');
INSERT INTO Person (id, name, image_url, url)
VALUES ('50268', 'Tyler Joseph', 'https://images.genius.com/027669db179451836c4fcdd12550e320.960x960x1.jpg', 'https://genius.com/artists/Tyler-joseph');
INSERT INTO Person (id, name, image_url, url)
VALUES ('62236', 'Ricky Reed', 'https://images.genius.com/0a7a58efd806ff3c8a167e0d0f19f1d1.1000x667x1.jpg', 'https://genius.com/artists/Ricky-reed');
INSERT INTO Person (id, name, image_url, url)
VALUES ('653076', 'Pop & Oak', 'https://images.genius.com/c0561d9357efa99cc71691a26085390d.286x286x1.jpg', 'https://genius.com/artists/Pop-and-oak');
INSERT INTO Person (id, name, image_url, url)
VALUES ('394320', 'Sebastian Kole', 'https://images.genius.com/aaf366a2883abea4b39ad4f70cc6da06.1000x600x1.jpg', 'https://genius.com/artists/Sebastian-kole');
INSERT INTO Person (id, name, image_url, url)
VALUES ('675997', 'Coleridge Tillman', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Coleridge-tillman');
INSERT INTO Person (id, name, image_url, url)
VALUES ('575218', 'Epikh Pro', 'https://images.genius.com/2a7994cf386e5f3ccf82cc751966a46a.400x400x1.jpg', 'https://genius.com/artists/Epikh-pro');
INSERT INTO Person (id, name, image_url, url)
VALUES ('233140', 'Dope Boi Beatz', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Dope-boi-beatz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1217171', 'Vory', 'https://images.genius.com/c4b3fb5cc9d5885f58e51a232eca16c0.750x750x1.jpg', 'https://genius.com/artists/Vory');
INSERT INTO Person (id, name, image_url, url)
VALUES ('3264', 'Jermaine Dupri', 'https://images.genius.com/5fbdd9050c73a61f7597865e67c645f2.464x464x1.jpg', 'https://genius.com/artists/Jermaine-dupri');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1683276', 'Isom Brandon Stuart', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Isom-brandon-stuart');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1205', 'Mariah Carey', 'https://images.genius.com/8203effefc2dc66ab6509e515641c96e.1000x1000x1.jpg', 'https://genius.com/artists/Mariah-carey');
INSERT INTO Person (id, name, image_url, url)
VALUES ('36326', 'The MeKanics', 'https://images.genius.com/dfbb929397a9dd8c76c2c9034bf0f4c8.600x378x1.jpg', 'https://genius.com/artists/The-mekanics');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1096445', 'Foreign Teck', 'https://images.genius.com/1f2364bd3103ea7369788402f0999560.1000x1000x1.jpg', 'https://genius.com/artists/Foreign-teck');
INSERT INTO Person (id, name, image_url, url)
VALUES ('678132', 'Javelyn Hall', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Javelyn-hall');
INSERT INTO Person (id, name, image_url, url)
VALUES ('357100', 'Michael Johnson', 'https://images.genius.com/1755fd542da5bf70c8d8d874656e88fd.356x356x1.jpg', 'https://genius.com/artists/Michael-johnson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('11439', 'Afrojack', 'https://images.genius.com/50fbad42a1bf56b5f7365b3c1fabe80a.419x419x1.jpg', 'https://genius.com/artists/Afrojack');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27621', 'Giorgio Tuinfort', 'https://images.genius.com/eec8310d6222d3ed05c2777df191c0d0.466x466x1.jpg', 'https://genius.com/artists/Giorgio-tuinfort');
INSERT INTO Person (id, name, image_url, url)
VALUES ('552457', 'Mattman & Robin', 'https://images.genius.com/f2c56dde17acff7e7e75a55c3a75bab6.800x532x1.jpg', 'https://genius.com/artists/Mattman-and-robin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('409511', 'Justin Tranter', 'https://images.rapgenius.com/avatars/medium/259229ef3facffc2c0076a870506b426', 'https://genius.com/artists/Justin-tranter');
INSERT INTO Person (id, name, image_url, url)
VALUES ('142215', 'Robin Fredriksson', 'https://images.genius.com/44c81c4e15a170d488b41dfaccc34dbf.669x669x1.png', 'https://genius.com/artists/Robin-fredriksson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('142213', 'Mattias Larsson', 'https://images.genius.com/256bb846d22bdc482f07b73dcb2ea7a3.498x498x1.png', 'https://genius.com/artists/Mattias-larsson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('16515', 'Joe Jonas', 'https://images.genius.com/1585fa83daea01eb8a4d980561d85d0c.409x409x1.jpg', 'https://genius.com/artists/Joe-jonas');
INSERT INTO Person (id, name, image_url, url)
VALUES ('34793', 'Mike Elizondo', 'https://images.genius.com/40a2e2fe01d307e9b4f44a6b9a50ddec.280x232x1.jpg', 'https://genius.com/artists/Mike-elizondo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('876840', 'SHY Martin', 'https://images.genius.com/9c76e8d16bcd127a5038da103994264d.1000x1000x1.jpg', 'https://genius.com/artists/Shy-martin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('660556', 'SHY Nodi', 'https://images.genius.com/04dc52cc0891ace128c100a3083c7e09.640x640x1.jpg', 'https://genius.com/artists/Shy-nodi');
INSERT INTO Person (id, name, image_url, url)
VALUES ('227626', 'Phoebe Ryan', 'https://images.genius.com/36f629b7a8fb9fe41e9313e2bea04a2e.770x600x1.jpg', 'https://genius.com/artists/Phoebe-ryan');
INSERT INTO Person (id, name, image_url, url)
VALUES ('111393', 'Fred Ball', 'https://images.rapgenius.com/avatars/medium/99dee8c45bb8fa861f381ed1bc5e1ea6', 'https://genius.com/artists/Fred-ball');
INSERT INTO Person (id, name, image_url, url)
VALUES ('634311', 'Joseph Angel', 'https://images.genius.com/be17ad51b04726071768dee5132c75c6.651x651x1.jpg', 'https://genius.com/artists/Joseph-angel');
INSERT INTO Person (id, name, image_url, url)
VALUES ('182877', 'Velous', 'https://images.genius.com/0d601c26fcba5b61abcb4b6bad3b78b5.964x964x1.jpg', 'https://genius.com/artists/Velous');
INSERT INTO Person (id, name, image_url, url)
VALUES ('662', 'Boi-1da', 'https://images.genius.com/f1b95b403a63c49b2248d0e5c153092a.858x858x1.jpg', 'https://genius.com/artists/Boi-1da');
INSERT INTO Person (id, name, image_url, url)
VALUES ('92', 'Nicki Minaj', 'https://images.genius.com/262312ddbb51aa7e96309f5a9d5daa97.843x843x1.jpg', 'https://genius.com/artists/Nicki-minaj');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27935', 'Ludwig Göransson', 'https://images.genius.com/f91489201992d781cc5d5fb70b7ae268.395x395x1.jpg', 'https://genius.com/artists/Ludwig-goransson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('668957', 'Gary Mudbone Cooper', 'https://images.genius.com/24bb9be47d95794435f471de700ea3c1.175x175x1.jpg', 'https://genius.com/artists/Gary-mudbone-cooper');
INSERT INTO Person (id, name, image_url, url)
VALUES ('351', 'George Clinton', 'https://images.genius.com/3acf457834e812fe27f0309541e53e35.933x933x1.jpg', 'https://genius.com/artists/George-clinton');
INSERT INTO Person (id, name, image_url, url)
VALUES ('6471', 'Bootsy Collins', 'https://images.genius.com/ce3cef6abc250a60a8efdcf6e679dfed.400x400x1.jpg', 'https://genius.com/artists/Bootsy-collins');
INSERT INTO Person (id, name, image_url, url)
VALUES ('541009', 'Maneesh', 'https://images.genius.com/9f5500f8c96ae5235a7572eaac467bce.512x512x1.jpg', 'https://genius.com/artists/Maneesh');
INSERT INTO Person (id, name, image_url, url)
VALUES ('34522', 'Supa Dups', 'https://images.genius.com/927589eb674709d92438f81ae2cf2c23.630x420x1.jpg', 'https://genius.com/artists/Supa-dups');
INSERT INTO Person (id, name, image_url, url)
VALUES ('64581', 'Nineteen85', 'https://images.genius.com/552cc3e0e81342a8f8fe386f00592a3e.1000x1000x1.jpg', 'https://genius.com/artists/Nineteen85');
INSERT INTO Person (id, name, image_url, url)
VALUES ('29497', 'Dre Skull', 'https://images.genius.com/3a01965b067fead843b0a00a1f86a0d7.1000x668x1.jpg', 'https://genius.com/artists/Dre-skull');
INSERT INTO Person (id, name, image_url, url)
VALUES ('17195', 'Popcaan', 'https://images.genius.com/22ad26a6ad5981df00cee1a55f31fcbc.741x741x1.jpg', 'https://genius.com/artists/Popcaan');
INSERT INTO Person (id, name, image_url, url)
VALUES ('663034', 'A. Martin', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/A-martin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1398269', 'Jon White', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Jon-white');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1643847', 'Daniel Stephenson', 'https://images.genius.com/03629057cd0db1da69adcf7f27a6ccda.1000x1000x1.jpg', 'https://genius.com/artists/Daniel-stephenson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('4396', 'Mark Morrison', 'https://s3.amazonaws.com/rapgenius/cd4560227-fbmark-morrison-british-rap-and-r-b-music-star-october-2002-posters.jpg', 'https://genius.com/artists/Mark-morrison');
INSERT INTO Person (id, name, image_url, url)
VALUES ('216609', 'Fetty Wap', 'https://images.genius.com/6ae05a3b38a319adf0384a675d53b945.496x496x1.jpg', 'https://genius.com/artists/Fetty-wap');
INSERT INTO Person (id, name, image_url, url)
VALUES ('64420', 'NY Bangers', 'https://images.genius.com/c22166ff72aeed946c07612b6ba3758e.512x512x1.jpg', 'https://genius.com/artists/Ny-bangers');
INSERT INTO Person (id, name, image_url, url)
VALUES ('69949', 'Di Genius', 'https://images.genius.com/a5df7a4dc09ea8129e75470118c5d779.459x344x1.jpg', 'https://genius.com/artists/Di-genius');
INSERT INTO Person (id, name, image_url, url)
VALUES ('55684', 'Allen Ritter', 'https://images.genius.com/527f5a08bbacac18e6873e1d3817f386.400x400x1.jpg', 'https://genius.com/artists/Allen-ritter');
INSERT INTO Person (id, name, image_url, url)
VALUES ('663015', 'Andrew Thomas', 'https://images.genius.com/fbdc3e1bcfe871617b7dd098a24419e3.300x300x1.jpg', 'https://genius.com/artists/Andrew-thomas');
INSERT INTO Person (id, name, image_url, url)
VALUES ('663014', 'Patrick Roberts', 'https://images.genius.com/1c959687f9363e36de8ac55e4373e1bc.345x345x1.jpg', 'https://genius.com/artists/Patrick-roberts');
INSERT INTO Person (id, name, image_url, url)
VALUES ('663013', 'Garu Jackson', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Garu-jackson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('663012', 'Donald Dennis', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Donald-dennis');
INSERT INTO Person (id, name, image_url, url)
VALUES ('663011', 'Aquaman', 'https://images.genius.com/f1681f41c7b8022ab48828671a79f550.479x479x1.jpg', 'https://genius.com/artists/Aquaman');
INSERT INTO Person (id, name, image_url, url)
VALUES ('8550', 'Beenie Man', 'https://images.genius.com/b32c23227d1261eac85227d5867eab2e.788x788x1.jpg', 'https://genius.com/artists/Beenie-man');
INSERT INTO Person (id, name, image_url, url)
VALUES ('325827', 'DallasK', 'https://images.genius.com/ab1227a9cca02d3ae5a918ab4d1a378b.500x500x1.jpg', 'https://genius.com/artists/Dallask');
INSERT INTO Person (id, name, image_url, url)
VALUES ('9654', 'Ammo', 'https://images.genius.com/50659c5a49a5e2c51914e685479fabaa.220x280x1.jpg', 'https://genius.com/artists/Ammo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('653079', 'Jude Demorest', 'https://images.genius.com/c73492943bebf167d5ff4fb93b750817.1000x1000x1.jpg', 'https://genius.com/artists/Jude-demorest');
INSERT INTO Person (id, name, image_url, url)
VALUES ('149418', 'Brian Lee', 'https://images.genius.com/f6afbd9c79c2861ab29f6343eb30ac5a.330x330x1.jpg', 'https://genius.com/artists/Brian-lee');
INSERT INTO Person (id, name, image_url, url)
VALUES ('25005', 'Ty Dolla $ign', 'https://images.genius.com/d07735e0ce367e88926fd0bb120fb90d.1000x1000x1.jpg', 'https://genius.com/artists/Ty-dolla-sign');
INSERT INTO Person (id, name, image_url, url)
VALUES ('77014', 'Eskeerdo', 'https://images.genius.com/cf0771ffe13e96b1a59720cfa5f5bc34.1000x1000x1.jpg', 'https://genius.com/artists/Eskeerdo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('143754', 'Louis Bell', 'https://images.genius.com/e5e5ab07410bcde1d4bc916ee86f6ec1.727x727x1.jpg', 'https://genius.com/artists/Louis-bell');
INSERT INTO Person (id, name, image_url, url)
VALUES ('986640', 'Austin Rosen', 'https://images.genius.com/3ec6fe9a0ee0dc90c755de7ddf95138a.296x296x1.png', 'https://genius.com/artists/Austin-rosen');
INSERT INTO Person (id, name, image_url, url)
VALUES ('61600', 'Quavo', 'https://images.genius.com/f1ff6c1619a1b9e7adaa8b8789f23c68.563x563x1.jpg', 'https://genius.com/artists/Quavo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('486585', 'Lyle Leduff', 'https://images.genius.com/43a791550670eb61595ed7fbda7b653c.481x481x1.jpg', 'https://genius.com/artists/Lyle-leduff');
INSERT INTO Person (id, name, image_url, url)
VALUES ('23315', 'Southside', 'https://images.genius.com/4aafba6bdefe067064ef8448e66fd8a8.429x429x1.png', 'https://genius.com/artists/Southside');
INSERT INTO Person (id, name, image_url, url)
VALUES ('32429', 'CuBeatz', 'https://images.genius.com/100abac48eecf513dad29bf17db16013.700x700x1.jpg', 'https://genius.com/artists/Cubeatz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('669794', 'Tim Gomringer', 'https://images.genius.com/cb7ce8780ac63d3fd5d53e34f4e4f758.205x205x1.png', 'https://genius.com/artists/Tim-gomringer');
INSERT INTO Person (id, name, image_url, url)
VALUES ('669795', 'Kevin Gomringer', 'https://images.genius.com/3b2945045a96fcdb6567cb5647f22712.212x212x1.png', 'https://genius.com/artists/Kevin-gomringer');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1177', 'Taylor Swift', 'https://images.genius.com/7b60eaf2dfa28ce4267bf59f30f352d1.400x400x1.jpg', 'https://genius.com/artists/Taylor-swift');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1054259', 'Logan Sama', 'https://images.genius.com/228474d77351209ba2d5c326786aa6d6.799x799x1.jpg', 'https://genius.com/artists/Logan-sama');
INSERT INTO Person (id, name, image_url, url)
VALUES ('84565', 'China Black', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/China-black');
INSERT INTO Person (id, name, image_url, url)
VALUES ('816604', 'DJ Maphorisa', 'https://images.genius.com/04cbe72a1d134c280a8b3fe587b23536.549x549x1.jpg', 'https://genius.com/artists/Dj-maphorisa');
INSERT INTO Person (id, name, image_url, url)
VALUES ('459835', 'Crazy Cousinz', 'https://images.genius.com/69fd4e951e80266757d13bdd2f1c5cb3.400x400x1.jpg', 'https://genius.com/artists/Crazy-cousinz');
INSERT INTO Person (id, name, image_url, url)
VALUES ('155256', 'Kyla', 'https://images.genius.com/60e4f8e11ced51f98a82a47c34c48880.300x300x1.png', 'https://genius.com/artists/Kyla');
INSERT INTO Person (id, name, image_url, url)
VALUES ('20148', 'Wizkid', 'https://images.genius.com/e529d883159b0d872b49e9e67b61aa07.607x607x1.jpg', 'https://genius.com/artists/Wizkid');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27612', '40', 'https://images.genius.com/c999dd154986a45b8981323a2ea53f98.620x380x1.jpg', 'https://genius.com/artists/40');
INSERT INTO Person (id, name, image_url, url)
VALUES ('643405', 'Rogét Chahayed', 'https://images.genius.com/0ec7d86de5ad68aa2006d7707595ae7f.400x400x1.jpg', 'https://genius.com/artists/Roget-chahayed');
INSERT INTO Person (id, name, image_url, url)
VALUES ('579558', 'Karl Rubin Brutus', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Karl-rubin-brutus');
INSERT INTO Person (id, name, image_url, url)
VALUES ('576544', '​watt', 'https://s3.amazonaws.com/filepicker-images-rapgenius/ioZag93cQyC14aoRUlrY_C1iBmacUkAAYmDp.jpg', 'https://genius.com/artists/Watt');
INSERT INTO Person (id, name, image_url, url)
VALUES ('468880', 'Edwin Perez', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Edwin-perez');
INSERT INTO Person (id, name, image_url, url)
VALUES ('468879', 'Teddy Mendez', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Teddy-mendez');
INSERT INTO Person (id, name, image_url, url)
VALUES ('401980', 'Steve Marsden', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Steve-marsden');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1009606', 'Lumidee Cedeno', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Lumidee-cedeno');
INSERT INTO Person (id, name, image_url, url)
VALUES ('329564', 'Ali Tamposi', 'https://images.genius.com/6174204cacce64faf00b87547367d359.1000x1000x1.jpg', 'https://genius.com/artists/Ali-tamposi');
INSERT INTO Person (id, name, image_url, url)
VALUES ('658975', 'Joe King', 'https://images.genius.com/e07dc06f917b0cd5fca17f959a46b398.442x442x1.jpg', 'https://genius.com/artists/Joe-king');
INSERT INTO Person (id, name, image_url, url)
VALUES ('149826', 'Isaac Slade', 'https://images.genius.com/c6608d986e7d654d24681a2ec813a5c2.213x213x1.jpg', 'https://genius.com/artists/Isaac-slade');
INSERT INTO Person (id, name, image_url, url)
VALUES ('228636', 'Halsey', 'https://images.genius.com/76d21ad1ef4e18b9bfaaaa20fd4891eb.635x635x1.jpg', 'https://genius.com/artists/Halsey');
INSERT INTO Person (id, name, image_url, url)
VALUES ('984204', 'Shaun Frank', 'https://images.genius.com/86cbbdff403c8d88e791fab42b84ac4b.1000x1000x1.jpg', 'https://genius.com/artists/Shaun-frank');
INSERT INTO Person (id, name, image_url, url)
VALUES ('984008', 'Frederic Kennett', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Frederic-kennett');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27486', 'TM88', 'https://images.genius.com/8bdb068c7401b48e7d04f2d6316de50f.526x526x1.png', 'https://genius.com/artists/Tm88');
INSERT INTO Person (id, name, image_url, url)
VALUES ('336528', 'Smash David', 'https://images.genius.com/efb300f752bca48079bc4d94587fb7f3.382x382x1.png', 'https://genius.com/artists/Smash-david');
INSERT INTO Person (id, name, image_url, url)
VALUES ('330059', 'Amaire Johnson', 'https://images.genius.com/522ae0fe61ca0000abd18f8011a9fc80.525x525x1.jpg', 'https://genius.com/artists/Amaire-johnson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('11305', 'Hitmaka', 'https://images.genius.com/41879576f4a18b2015200b6f7b27b635.304x304x1.jpg', 'https://genius.com/artists/Hitmaka');
INSERT INTO Person (id, name, image_url, url)
VALUES ('72', 'Kanye West', 'https://images.genius.com/0a1795a288ff88f7bb6026880dcaf9a9.1000x1000x1.jpg', 'https://genius.com/artists/Kanye-west');
INSERT INTO Person (id, name, image_url, url)
VALUES ('278', 'Jeremih', 'https://images.genius.com/59567e4918671304d37eb021331d239d.550x550x1.jpg', 'https://genius.com/artists/Jeremih');
INSERT INTO Person (id, name, image_url, url)
VALUES ('20731', 'Mark Foster', 'https://images.genius.com/616d27031d7802b5f6a8ee7b99f65eae.809x809x1.jpg', 'https://genius.com/artists/Mark-foster');
INSERT INTO Person (id, name, image_url, url)
VALUES ('12418', 'Ed Sheeran', 'https://images.genius.com/1ff6b6189e1a78e497e09c90c1f6692e.1000x1000x1.jpg', 'https://genius.com/artists/Ed-sheeran');
INSERT INTO Person (id, name, image_url, url)
VALUES ('13585', 'Daft Punk', 'https://images.genius.com/a508888fd6a96cadcf835ecf95b1c1ae.1000x1000x1.jpg', 'https://genius.com/artists/Daft-punk');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1033803', 'Eric Chedeville', 'https://images.genius.com/fecb00f20126f25b5c2ccd77af3aa17e.581x581x1.jpg', 'https://genius.com/artists/Eric-chedeville');
INSERT INTO Person (id, name, image_url, url)
VALUES ('31634', 'Guy-Manuel de Homem-Christo', 'https://images.genius.com/ebe2e5dbb54f1414d3d0cbfd6c5c5d52.593x593x1.jpg', 'https://genius.com/artists/Guy-manuel-de-homem-christo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('42463', 'Thomas Bangalter', 'https://images.genius.com/f96ae0accbefb5cea27439d1060fc259.813x813x1.jpg', 'https://genius.com/artists/Thomas-bangalter');
INSERT INTO Person (id, name, image_url, url)
VALUES ('65700', 'The Corporation', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/The-corporation');
INSERT INTO Person (id, name, image_url, url)
VALUES ('139460', 'Rex Kudo', 'https://images.genius.com/d8a4da3de3a06f42aac4f08bd68e3509.256x256x1.jpg', 'https://genius.com/artists/Rex-kudo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('980331', 'Cashio', 'https://images.genius.com/49190473d949589e2491b0414f6b5b83.1000x1000x1.jpg', 'https://genius.com/artists/Cashio');
INSERT INTO Person (id, name, image_url, url)
VALUES ('681077', 'FKi 1st', 'https://images.genius.com/85683680fa25e6de8812ae59484887ca.1000x1000x1.png', 'https://genius.com/artists/Fki-1st');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1492929', 'Andre Dwayne Jackson', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Andre-dwayne-jackson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('52893', 'Yung Exclusive', 'https://images.genius.com/ad287fff2a9f33f6f4b54ace19eeda33.400x400x1.jpg', 'https://genius.com/artists/Yung-exclusive');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27259', 'Cardo', 'https://s3.amazonaws.com/rapgenius/4ccedb63a37fd69496b98132dc4ae4c5.jpeg', 'https://genius.com/artists/Cardo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('641148', 'Brock Korsan', 'https://images.genius.com/5842cb8fc598fd2022cbda72539f2673.892x892x1.jpg', 'https://genius.com/artists/Brock-korsan');
INSERT INTO Person (id, name, image_url, url)
VALUES ('59421', 'G Koop', 'https://images.genius.com/ae27979a9a5c251125d89ae28f83064a.315x315x1.jpg', 'https://genius.com/artists/G-koop');
INSERT INTO Person (id, name, image_url, url)
VALUES ('88813', 'Offset', 'https://images.genius.com/c7998ea0216f8ddeaaadb5ca063b4ae3.1000x1000x1.jpg', 'https://genius.com/artists/Offset');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2726', 'Quincy Jones', 'https://images.genius.com/36ead025160627b580da31fbf5ca34a7.750x750x1.jpg', 'https://genius.com/artists/Quincy-jones');
INSERT INTO Person (id, name, image_url, url)
VALUES ('25983', 'King Henry', 'https://images.genius.com/17f4117f4f11952c9704a97863bebcd4.1000x1000x1.jpg', 'https://genius.com/artists/King-henry');
INSERT INTO Person (id, name, image_url, url)
VALUES ('412137', 'Jr. Blender', 'https://images.genius.com/52a046e93831673d5c359ba5364bc09a.400x400x1.jpg', 'https://genius.com/artists/Jr-blender');
INSERT INTO Person (id, name, image_url, url)
VALUES ('12908', 'Diplo', 'https://images.genius.com/a5dfb8cc4e373238068b89a15b3194aa.1000x1000x1.jpg', 'https://genius.com/artists/Diplo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('21871', 'MØ', 'https://images.genius.com/9081365f904ad5e8b1442689cc335820.777x777x1.jpg', 'https://genius.com/artists/M');
INSERT INTO Person (id, name, image_url, url)
VALUES ('164761', 'Jamie Scott', 'https://images.genius.com/243c87a40a9c071b51ded302691ccc9f.499x499x1.png', 'https://genius.com/artists/Jamie-scott');
INSERT INTO Person (id, name, image_url, url)
VALUES ('39876', 'Switch', 'https://images.genius.com/4ae12bcaadba6d0f97879f549a41a517.300x300x1.jpg', 'https://genius.com/artists/Switch');
INSERT INTO Person (id, name, image_url, url)
VALUES ('669410', 'Topper Headon', 'https://images.genius.com/0b972138fc48cc8da459d47c37c30743.358x358x1.jpg', 'https://genius.com/artists/Topper-headon');
INSERT INTO Person (id, name, image_url, url)
VALUES ('152816', 'Paul Simonon', 'https://images.genius.com/4edf1ea2e9b85c859005593a833fd934.372x372x1.jpg', 'https://genius.com/artists/Paul-simonon');
INSERT INTO Person (id, name, image_url, url)
VALUES ('35064', 'Mick Jones', 'https://images.genius.com/3617222a5228e8aeedf143f9881e5655.461x461x1.jpg', 'https://genius.com/artists/Mick-jones');
INSERT INTO Person (id, name, image_url, url)
VALUES ('86678', 'Joe Strummer', 'https://images.genius.com/4b4b8973c310afa5a4badbea7280cbbf.783x783x1.jpg', 'https://genius.com/artists/Joe-strummer');
INSERT INTO Person (id, name, image_url, url)
VALUES ('7161', 'MIKE DEAN', 'https://images.genius.com/2b6c06b7eda50aef9ab31b2998b2298e.1000x1000x1.jpg', 'https://genius.com/artists/Mike-dean');
INSERT INTO Person (id, name, image_url, url)
VALUES ('639900', 'Menace', 'https://images.rapgenius.com/avatars/medium/1d04f2dbd7e5a9548c20e671afe71c5e', 'https://genius.com/artists/Menace');
INSERT INTO Person (id, name, image_url, url)
VALUES ('139040', 'Sevn Thomas', 'https://images.genius.com/988261766b0700b37e539389f8b39808.428x428x1.jpg', 'https://genius.com/artists/Sevn-thomas');
INSERT INTO Person (id, name, image_url, url)
VALUES ('634300', 'Rich Stephenson', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Rich-stephenson');
INSERT INTO Person (id, name, image_url, url)
VALUES ('329739', 'Monte Moir', 'https://images.genius.com/94731fb20c81097bb6987dabe6eac4f8.240x239x1.jpg', 'https://genius.com/artists/Monte-moir');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('41287', '169', '227');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('2069', '451', '130');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('665', '366', '425');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('500', '1578', '250');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('984358', '7', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('703', '306', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('568186', '139', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1015048', '31', '666');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1405', '479', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('492', '6722', '16220');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('241761', '372', '9706');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('980465', '143', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('625410', '62', '1814');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('11395', '3195', '15985');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('65238', '307', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('26577', '801', '10604');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('150934', '1002', '640');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('44080', '3267', '1453');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('11795', '123', '2230');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('626678', '989', '14929');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('565381', '95', '100');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('8662', '42', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('69342', '223', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('89', '4756', '2048');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('394321', '952', '8639');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('106693', '177', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('405554', '141', '1771');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('835', '1035', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('993779', '39', '257');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('13539', '581', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('16751', '8800', '46911');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('49470', '52', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('365', '1204', '1847');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('177756', '1076', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('264368', '1764', '19467');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('25939', '223', '883');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('162126', '1120', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('339543', '313', '4440');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('204611', '1861', '73419');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('34107', '213', '2747');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('26593', '764', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('151666', '1', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('944', '119', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('2578', '495', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1385462', '275', '393211');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('47131', '1423', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('2300', '1310', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('334', '1783', '425');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('326362', '4018', '13442');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('991355', '4', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('16775', '1124', '7043');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('69', '9635', '355');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('164661', '462', '1614');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('185600', '52', '100');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('49926', '30', '101');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('248458', '371', '1280');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('563', '1050', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('992687', '10', '2842');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('6412', '959', '12653');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('571062', '419', '2646');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('49449', '278', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('654', '401', '15496');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1042', '1056', '2539');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('195029', '1715', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('60437', '557', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('48185', '499', '10525');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1061395', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('610968', '1427', '12207');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('104044', NULL, '6332');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('26507', '4509', '1784');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('217208', '3942', '4679');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('23796', '4235', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('357', '3151', '1525');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('405415', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('20185', '6047', '2783');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('250301', '1201', '9768');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('49698', '157', '115');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1632', NULL, '9286');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('45372', NULL, '10520');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1745', '8619', '4554');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('2197', '4251', '4077');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('980801', NULL, '435');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('148908', NULL, '1679');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('430404', NULL, '4549');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1421', NULL, '41099');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('331090', NULL, '100');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('10586', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('579526', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('130', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('2358', '7330', '6225');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('740', NULL, '1929');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('296675', NULL, '2967');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('720', NULL, '243');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('14325', NULL, '8051');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('4', NULL, '3960');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('346989', NULL, '607');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('540192', NULL, '1904');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('8743', NULL, '1051');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('508218', NULL, '1921');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('13', NULL, '688');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('227626', NULL, '310');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('92', NULL, '3125');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('216609', NULL, '100');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('4396', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('25005', NULL, '1961');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('61600', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('155256', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('20148', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('228636', NULL, '1525');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('13585', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('21871', NULL, '2587');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('23796', '2532266', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('665', '2481759', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('150934', '2416822', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('984358', '2960556', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('204611', '5110616', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('106693', '2880960', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('8662', '54027', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13539', '2851057', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('41287', '2819412', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2069', '2463453', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('626678', '2400811', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2890555', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('34107', '2849861', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('365', '2875301', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('835', '1644', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('23796', '725792', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('500', '2872960', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('44080', '2845980', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('980465', '2820703', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('492', '2893922', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('150934', '2458848', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2890553', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('204611', '2891157', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('177756', '2819932', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('26577', '2436402', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2851948', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2909921', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2450584', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1015048', '2855384', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('150934', '2867244', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('89', '2413890', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('26593', '749215', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('334', '2467204', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('195029', '2811214', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('241761', '2451433', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('11395', '2355208', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2300', '2336620', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('25939', '2881810', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69', '2924189', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('89', '2398213', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('217208', '2418877', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2463402', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('195029', '2478138', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('357', '2342329', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2913726', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2852482', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1405', '2892211', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('625410', '2336758', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1745', '2905167', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1385462', '3904320', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('654', '2435615', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('568186', '2311373', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('16775', '2391084', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('394321', '2104392', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('20185', '2849767', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('6412', '2922155', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2911554', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2197', '2859956', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('703', '1429', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2911564', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('565381', '2306268', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('177756', '2457826', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('217208', '2456795', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69342', '2928485', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69', '599427', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('49470', '2688236', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69', '2923332', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('16751', '2471960', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('162126', '2496305', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('49449', '2407925', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('164661', '2860652', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('992687', '3857644', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('60437', '2427392', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2197', '2396302', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('151666', '2890675', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('944', '1633480', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('610968', '2404125', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1042', '2171', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2578', '64869', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('326362', '698675', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69', '2924188', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69', '2925371', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('65238', '3036726', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69342', '2881766', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('89', '2378935', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('185600', '2346601', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('563', '4006446', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2464123', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('980465', '2820812', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('339543', '2474069', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('26507', '2465219', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('48185', '2263909', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('26507', '2457495', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('993779', '2869012', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('47131', '2442052', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('150934', '2938684', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('49926', '201791', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2911557', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('49698', '2844173', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2911255', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('248458', '2488833', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('571062', '2444781', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('250301', '2388373', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('405554', '2908883', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('23796', '725791', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('11795', '664970', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('991355', '2861311', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('264368', '579968', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2300', '2336631', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('264368', '2312297', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('326362', '2865735', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('217208', '2830058', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('11395', '2346601', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('248458', '2496305', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1061395', '2960556', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('104044', '3036726', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('405415', '2892211', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1632', '2844173', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('45372', '2844173', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('980801', '2855384', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('148908', '2355208', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('217208', '2688236', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2197', '2688236', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('430404', '2890555', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1421', '2851057', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('331090', '2938684', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('10586', '2336758', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('579526', '2336758', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2859956', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('610968', '2922155', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('740', '2880960', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('296675', '2880960', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('720', '2908883', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('14325', '2471960', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('4', '2471960', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('346989', '749215', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('540192', '2263909', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1421', '2911554', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2396302', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('8743', '2407925', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('508218', '2416822', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2197', '2820703', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13', '2819932', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('16775', '64869', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('45372', '2388373', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('227626', '2867244', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('92', '2457495', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('89', '2463402', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('216609', '2861311', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('4396', '2861311', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('25005', '2427392', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('61600', '2865735', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('89', '2463453', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('155256', '2450584', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('20148', '2450584', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('610968', '2451433', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('357', '2819412', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2442052', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('228636', '2458848', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13585', '2909921', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1421', '2849767', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('217208', '2845980', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13585', '2851948', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('21871', '2481759', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('357', '2481759', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2398213', 'featured');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('620092', '2346601', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('51380', '2496305', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('162126', '2496305', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('248458', '2496305', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2180892', '3857644', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('992687', '3857644', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('209397', '2875301', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('228334', '2875301', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('209397', '2875301', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('228334', '2875301', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('365', '2875301', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('37880', '2960556', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('984358', '2960556', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1050477', '2881810', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('481514', '2881810', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('71540', '2881810', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('165764', '2881810', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('527629', '2881810', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('481514', '2881810', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1050477', '2881810', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('71540', '2881810', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('165764', '2881810', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('527629', '2881810', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('25939', '2881810', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('639684', '3036726', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('158919', '3036726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('65238', '3036726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('632021', '3036726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('649708', '3036726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('19818', '3036726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('309511', '3036726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('543018', '2892211', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1405', '2892211', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('405415', '2892211', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('543019', '2892211', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('543018', '2892211', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('543019', '2892211', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55411', '2892211', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('405415', '2892211', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1405', '2892211', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1030827', '2478138', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('131676', '2478138', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('354283', '2478138', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('71876', '2478138', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('354283', '2478138', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('195029', '2478138', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28906', '2844173', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2844173', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49698', '2844173', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28906', '2844173', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2844173', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49698', '2844173', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('45372', '2844173', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1632', '2844173', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('162702', '2844173', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('58613', '2488833', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('21716', '2488833', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('58613', '2488833', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2196399', '2488833', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('341322', '2488833', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('248458', '2488833', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('980212', '2855384', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1015048', '2855384', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('980801', '2855384', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('654', '2435615', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('136287', '2435615', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('648391', '2435615', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('136287', '2435615', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('654', '2435615', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11795', '664970', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11795', '664970', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('35155', '2355208', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11395', '2355208', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('333306', '2355208', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('986319', '2355208', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('669399', '2355208', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('148908', '2355208', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('35155', '2355208', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11395', '2355208', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27822', '2688236', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27822', '2688236', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49470', '2688236', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2197', '2688236', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('217208', '2688236', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('44575', '2890555', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('44575', '2890555', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('430404', '2890555', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2890555', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55444', '2391084', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55444', '2391084', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('16775', '2391084', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('558190', '2444781', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('571062', '2444781', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('558190', '2444781', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('571062', '2444781', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('160032', '2851057', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33076', '2851057', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28906', '2851057', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1015154', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('651315', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('651316', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('155257', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('285817', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('209397', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1421', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('669', '2851057', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('26577', '2436402', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1002050', '2436402', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1002050', '2436402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('26577', '2436402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('57092', '2938684', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('660558', '2938684', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('331090', '2938684', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('654749', '2938684', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('223447', '2938684', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('51166', '2336758', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('7798', '2336758', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2184909', '2336758', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2184908', '2336758', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('481172', '2336758', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('625410', '2336758', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('628652', '2404125', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('628652', '2404125', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('610968', '2404125', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27822', '2859956', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1028671', '2859956', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('54077', '2859956', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('54077', '2859956', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1028671', '2859956', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2197', '2859956', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27822', '2859956', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2859956', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('52806', '2811214', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('354283', '2811214', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('632021', '2811214', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('354283', '2811214', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('652571', '2811214', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('195029', '2811214', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '599427', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('43747', '599427', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '599427', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27836', '2336620', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2336620', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27836', '2336620', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2336620', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2300', '2336620', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('988135', '2922155', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('593495', '2922155', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('988135', '2922155', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('593495', '2922155', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('573625', '2922155', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('610968', '2922155', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('6412', '2922155', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34533', '2911255', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911255', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2911255', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2911255', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34533', '2911255', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911255', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1362', '2911255', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('15740', '2911255', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('993779', '2869012', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('993779', '2869012', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('334', '2467204', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27836', '2467204', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2467204', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27836', '2467204', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('334', '2467204', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2467204', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('580572', '2418877', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('23691', '2418877', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('580572', '2418877', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('23691', '2418877', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('217208', '2418877', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('43733', '2457826', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('335759', '2457826', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('209139', '2457826', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('106693', '2880960', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('51766', '2880960', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('188055', '2880960', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('740', '2880960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('51766', '2880960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('262801', '2880960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('188054', '2880960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('155257', '2880960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '2924189', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('14777', '2924189', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('647112', '2924189', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '2924189', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('720', '2908883', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('720', '2908883', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('405554', '2908883', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1028969', '2849861', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('618451', '2849861', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('997039', '2849861', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('997040', '2849861', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34107', '2849861', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2923332', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27597', '2923332', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '2923332', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('30425', '2911557', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2911557', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911557', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('665102', '2911557', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('608241', '2911557', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49698', '2911557', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('616112', '2911557', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911557', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2911557', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('143593', '2471960', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130026', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668557', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('4', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668556', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668555', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('641040', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668554', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668553', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668366', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('16751', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('572674', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('143593', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668552', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('14325', '2471960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27616', '2890553', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2890553', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('162702', '2890553', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2890553', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27616', '2890553', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2890553', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('26593', '749215', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('773986', '749215', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('133136', '749215', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('346989', '749215', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('26593', '749215', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55444', '2336631', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55444', '2336631', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2300', '2336631', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '2925371', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '2925371', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('359481', '4006446', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('16631', '4006446', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('60493', '4006446', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('48185', '2263909', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('540192', '2263909', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('48185', '2263909', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('155062', '2465219', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2465219', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('155062', '2465219', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('26507', '2465219', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2465219', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('302826', '2465219', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('179206', '2465219', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('12802', '2911564', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911564', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('30425', '2911564', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('12802', '2911564', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2911564', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911564', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('30425', '2911564', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2911554', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('147213', '2911554', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911554', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27467', '2911554', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('147213', '2911554', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2911554', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2911554', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('162101', '2911554', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1421', '2911554', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27467', '2911554', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2396302', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2396302', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34533', '2396302', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2396302', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34533', '2396302', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2396302', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('574528', '2396302', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2396302', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2197', '2396302', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('150927', '201791', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('3309', '201791', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('3309', '201791', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('676109', '2407925', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49449', '2407925', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('676108', '2407925', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49449', '2407925', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('676109', '2407925', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('8743', '2407925', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1012903', '2872960', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49094', '2872960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('47127', '2872960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('500', '2872960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('150934', '2416822', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('71876', '2416822', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('551992', '2416822', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('660558', '2416822', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('430404', '2820703', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2820703', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2820703', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('430404', '2820703', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2197', '2820703', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1003643', '2860652', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1108378', '2860652', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1003643', '2860652', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1108379', '2860652', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('29978', '2819932', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('29978', '2819932', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('13', '2819932', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('335759', '2819932', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('209139', '2819932', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('39585', '2413890', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2413890', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55089', '2413890', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('29780', '2413890', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('671661', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('642979', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1306886', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('499861', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('325049', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('39585', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('29780', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('89', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('19132', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('162702', '2413890', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('50268', '725792', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('62236', '725792', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('50268', '725792', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('653076', '2104392', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('394320', '2104392', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('394321', '2104392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('675997', '2104392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('653076', '2104392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2456795', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2456795', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('217208', '2456795', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('575218', '579968', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('233140', '579968', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1217171', '579968', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('3264', '579968', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1683276', '579968', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('575218', '579968', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1205', '579968', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('233140', '579968', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('264368', '579968', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('36326', '2312297', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1096445', '2312297', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('678132', '2312297', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('357100', '2312297', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('264368', '2312297', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2311373', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2311373', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2197', '2311373', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2311373', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11439', '64869', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27621', '64869', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2578', '64869', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11439', '64869', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2578', '64869', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('16775', '64869', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27621', '64869', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('250301', '2388373', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('250301', '2388373', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('45372', '2388373', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('285817', '2388373', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('552457', '2306268', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('409511', '2306268', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('142215', '2306268', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('142213', '2306268', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('16515', '2306268', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2913726', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2913726', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34533', '2913726', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2913726', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('30425', '2913726', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2197', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34533', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('30425', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1362', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('574528', '2913726', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('50268', '725791', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34793', '725791', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('50268', '725791', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('150934', '2867244', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('876840', '2867244', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('660556', '2867244', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('660558', '2867244', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('227626', '2867244', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('111393', '2378935', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('111393', '2378935', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('89', '2378935', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('634311', '2378935', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '2924188', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('182877', '2924188', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('662', '2924188', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27616', '2924188', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69', '2924188', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('155062', '2457495', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2457495', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('155062', '2457495', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('179206', '2457495', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('302826', '2457495', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27835', '2457495', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('92', '2457495', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('26507', '2457495', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27616', '2905167', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1745', '2905167', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27935', '2905167', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1745', '2905167', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('668957', '2905167', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('351', '2905167', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('6471', '2905167', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27935', '2905167', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('541009', '2463402', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34522', '2463402', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('64581', '2463402', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('541009', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('29497', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('17195', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('663034', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34522', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('64581', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('89', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2463402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1398269', '2861311', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('991355', '2861311', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1398269', '2861311', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1643847', '2861311', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('4396', '2861311', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('216609', '2861311', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('991355', '2861311', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('64420', '2474069', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('339543', '2474069', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34522', '2464123', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69949', '2464123', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55684', '2464123', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('662', '2464123', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('663015', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('663014', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('663013', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('663012', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('663011', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('69949', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55684', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34522', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('8550', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('662', '2464123', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('325827', '2427392', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('9654', '2427392', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('653079', '2427392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('325827', '2427392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('149418', '2427392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('25005', '2427392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('77014', '2427392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('9654', '2427392', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('143754', '2865735', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2865735', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2865735', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('326362', '2865735', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('986640', '2865735', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('143754', '2865735', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28169', '2865735', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2865735', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('61600', '2865735', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('486585', '2830058', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('23691', '2830058', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('486585', '2830058', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('23691', '2830058', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('217208', '2830058', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('23315', '2820812', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2820812', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('32429', '2820812', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('32429', '2820812', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('669794', '2820812', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('669795', '2820812', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('23315', '2820812', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2820812', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('430404', '2820812', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('39585', '2463453', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2069', '2463453', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1177', '2463453', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2069', '2463453', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('64581', '2450584', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1054259', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('84565', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('816604', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('459835', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('155256', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('20148', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27612', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('64581', '2450584', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('643405', '2451433', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('579558', '2451433', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('51380', '2451433', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('51380', '2451433', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('643405', '2451433', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('610968', '2451433', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('241761', '2451433', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('34793', '2532266', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('50268', '2532266', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('50268', '2532266', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('576544', '2819412', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('143754', '2819412', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('41287', '2819412', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('468880', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('468879', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('401980', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1009606', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('149418', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('41287', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('986640', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('357', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('329564', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('143754', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('576544', '2819412', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27612', '2442052', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27612', '2442052', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('47131', '2442052', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2442052', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('150934', '2458848', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('658975', '2458848', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('149826', '2458848', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('228636', '2458848', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('984204', '2458848', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('984008', '2458848', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('660558', '2458848', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27486', '2893922', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('336528', '2893922', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('330059', '2893922', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2893922', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11305', '2893922', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27486', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('336528', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('72', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('278', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('330059', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('11305', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('492', '2893922', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('20731', '1429', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('20731', '1429', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28906', '2342329', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28906', '2342329', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('357', '2342329', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('12418', '2342329', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('13585', '2909921', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2909921', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1033803', '2909921', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('31634', '2909921', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('42463', '2909921', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2909921', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('30425', '2909921', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('65700', '54027', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('65700', '54027', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('326362', '698675', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('139460', '698675', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('980331', '698675', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('681077', '698675', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1492929', '698675', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('326362', '698675', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('52893', '2849767', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('32429', '2849767', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27259', '2849767', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('641148', '2849767', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('52893', '2849767', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27259', '2849767', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('669795', '2849767', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('669794', '2849767', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1421', '2849767', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('20185', '2849767', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('59421', '2845980', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2845980', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('33010', '2845980', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('217208', '2845980', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('88813', '2845980', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('61600', '2845980', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('59421', '2845980', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('13585', '2851948', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('31634', '2851948', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('42463', '2851948', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('574528', '2851948', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2358', '2851948', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27655', '2851948', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('30425', '2851948', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('835', '1644', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2726', '1644', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('835', '1644', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('665', '2481759', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28906', '2481759', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('25983', '2481759', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('412137', '2481759', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('25983', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('412137', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('12908', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('357', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('21871', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('164761', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('12418', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('28906', '2481759', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('39876', '2171', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('12908', '2171', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1042', '2171', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('12908', '2171', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('669410', '2171', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('152816', '2171', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('35064', '2171', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('86678', '2171', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('7161', '2400811', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('639900', '2400811', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('639900', '2400811', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('626678', '2400811', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('39585', '2398213', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27612', '2398213', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('662', '2398213', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('39585', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('27612', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('139040', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('662', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('634300', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('329739', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('47131', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('130', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('89', '2398213', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('55684', '2398213', 'writer');
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2532266', 31, 1483246800, 401620);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2481759', 43, 1483246800, 342437);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2416822', 24, 1483246800, 446177);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2960556', 49, 1483246800, 313819);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('5110616', 52, 1483246800, 305401);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2880960', 66, 1483246800, 265739);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('54027', 59, 1483246800, 284664);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2851057', 16, 1483246800, 486364);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2819412', 9, 1483246800, 690483);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2463453', 36, 1483246800, 362959);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2400811', 44, 1483246800, 332310);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890555', 28, 1483246800, 419434);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2849861', 37, 1483246800, 361392);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2875301', 54, 1483246800, 301472);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('1644', 65, 1483246800, 269981);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('725792', 68, 1483246800, 264707);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2872960', 12, 1483246800, 574974);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2845980', 1, 1483246800, 1371493);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2820703', 14, 1483246800, 544620);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2893922', 10, 1483246800, 682688);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2458848', 4, 1483246800, 1010492);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890553', 2, 1483246800, 1180074);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2891157', 13, 1483246800, 567789);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2819932', 5, 1483246800, 874289);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2436402', 8, 1483246800, 714839);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2851948', 3, 1483246800, 1064351);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2909921', 11, 1483246800, 651807);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2450584', 7, 1483246800, 753150);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2855384', 56, 1483246800, 299010);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2867244', 38, 1483246800, 351014);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2413890', 42, 1483246800, 342524);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('749215', 82, 1483246800, 231839);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2467204', 29, 1483246800, 417329);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2811214', 46, 1483246800, 323626);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2451433', 6, 1483246800, 763259);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2355208', 76, 1483246800, 236873);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2336620', 53, 1483246800, 302383);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2881810', 78, 1483246800, 233690);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2924189', 47, 1483246800, 317884);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2398213', 48, 1483246800, 316050);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2418877', 70, 1483246800, 259985);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2463402', 34, 1483246800, 368536);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2478138', 26, 1483246800, 438954);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2342329', 55, 1483246800, 300179);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2913726', 51, 1483246800, 307482);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2852482', 39, 1483246800, 350286);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2892211', 74, 1483246800, 244295);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2336758', 17, 1483246800, 485127);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2905167', 63, 1483246800, 272870);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3904320', 71, 1483246800, 258637);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2435615', 79, 1483246800, 233185);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2311373', 57, 1483246800, 297396);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2391084', 41, 1483246800, 345244);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2104392', 45, 1483246800, 331379);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2849767', 62, 1483246800, 276401);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2922155', 40, 1483246800, 349836);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911554', 58, 1483246800, 295550);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2859956', 73, 1483246800, 249166);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('1429', 75, 1483246800, 242742);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911564', 81, 1483246800, 232197);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2306268', 60, 1483246800, 282236);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2457826', 50, 1483246800, 308264);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2456795', 32, 1483246800, 401546);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2928485', 64, 1483246800, 272841);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('599427', 72, 1483246800, 253285);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2688236', 77, 1483246800, 235274);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2923332', 67, 1483246800, 264865);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2471960', 21, 1483246800, 449345);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2496305', 93, 1483246800, 215772);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2407925', 100, 1483246800, 207102);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2860652', 67, 1483333200, 231009);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3857644', 15, 1483246800, 507450);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2427392', 30, 1483246800, 405483);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2396302', 61, 1483246800, 278813);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890675', 23, 1483246800, 446785);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('1633480', 69, 1483246800, 260834);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2404125', 83, 1483246800, 227622);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2171', 84, 1483246800, 227569);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('64869', 86, 1483246800, 226512);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('698675', 88, 1483246800, 221512);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2924188', 18, 1483246800, 478503);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2925371', 95, 1483246800, 214737);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3036726', 27, 1483246800, 435945);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2881766', 89, 1483246800, 220922);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2378935', 94, 1483246800, 215035);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2346601', 91, 1483246800, 217132);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('4006446', 87, 1483246800, 223789);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2464123', 35, 1483246800, 365140);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2820812', 22, 1483246800, 447063);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2474069', 19, 1483246800, 456308);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2465219', 33, 1483246800, 370887);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2263909', 92, 1483246800, 216032);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2457495', 25, 1483246800, 440123);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2869012', 82, 1483333200, 216349);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2442052', 88, 1483333200, 206890);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2938684', 99, 1483333200, 195895);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('201791', 98, 1483246800, 210173);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911557', 79, 1483333200, 217742);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2844173', 90, 1483246800, 219337);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911255', 20, 1483246800, 456291);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2488833', 84, 1483333200, 214009);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2444781', 97, 1483246800, 210924);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2388373', 95, 1483333200, 199831);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2908883', 61, 1483333200, 237695);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('725791', 85, 1483246800, 227187);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('664970', 100, 1483333200, 193376);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2861311', 85, 1483333200, 211299);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('579968', 96, 1483246800, 213378);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2336631', 93, 1483333200, 202835);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2312297', 87, 1483333200, 210005);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2865735', 98, 1483333200, 197483);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2830058', 99, 1483246800, 208263);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2845980', 1, 1483333200, 1161746);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890553', 2, 1483333200, 1076575);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2851948', 3, 1483333200, 963602);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2458848', 4, 1483333200, 782423);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2819932', 5, 1483333200, 733662);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2436402', 6, 1483333200, 633586);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2893922', 7, 1483333200, 611276);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2891157', 8, 1483333200, 611030);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3857644', 9, 1483333200, 583678);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2909921', 10, 1483333200, 565606);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2451433', 11, 1483333200, 561076);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2819412', 12, 1483333200, 502681);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2450584', 13, 1483333200, 487243);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2851057', 14, 1483333200, 484706);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2872960', 15, 1483333200, 475316);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2820703', 16, 1483333200, 474705);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2924188', 17, 1483333200, 473234);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890675', 18, 1483333200, 447433);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2336758', 19, 1483333200, 444104);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3036726', 20, 1483333200, 441973);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2849861', 21, 1483333200, 424490);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911255', 22, 1483333200, 417288);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2820812', 23, 1483333200, 415453);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2457495', 24, 1483333200, 402640);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2532266', 25, 1483333200, 388696);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890555', 26, 1483333200, 379428);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2474069', 27, 1483333200, 374661);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2922155', 28, 1483333200, 368515);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2456795', 29, 1483333200, 366167);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2867244', 30, 1483333200, 358902);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2811214', 31, 1483333200, 354581);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2104392', 32, 1483333200, 354408);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('5110616', 33, 1483333200, 339562);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2471960', 34, 1483333200, 337218);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2960556', 35, 1483333200, 336502);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2875301', 36, 1483333200, 326511);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2924189', 37, 1483333200, 323494);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2464123', 38, 1483333200, 313087);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2481759', 39, 1483333200, 312401);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2463402', 40, 1483333200, 309703);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2852482', 41, 1483333200, 304264);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2457826', 42, 1483333200, 302738);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2416822', 43, 1483333200, 299373);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2913726', 44, 1483333200, 297398);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2478138', 45, 1483333200, 296263);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2928485', 46, 1483333200, 289650);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911554', 47, 1483333200, 288870);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2413890', 48, 1483333200, 288253);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2880960', 49, 1483333200, 276614);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2905167', 50, 1483333200, 268394);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2923332', 51, 1483333200, 268024);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2400811', 52, 1483333200, 265985);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2427392', 53, 1483333200, 264828);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('749215', 54, 1483333200, 261756);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2355208', 55, 1483333200, 259668);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2881810', 56, 1483333200, 253619);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2398213', 57, 1483333200, 253312);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2467204', 58, 1483333200, 248239);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3904320', 59, 1483333200, 247000);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2881766', 60, 1483333200, 238041);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2396302', 62, 1483333200, 236628);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('725792', 63, 1483333200, 236196);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('599427', 64, 1483333200, 234566);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2391084', 65, 1483333200, 234531);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2892211', 66, 1483333200, 234373);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2465219', 68, 1483333200, 230703);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911564', 69, 1483333200, 230432);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2859956', 70, 1483333200, 230345);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2311373', 71, 1483333200, 228720);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2378935', 72, 1483333200, 228402);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2418877', 73, 1483333200, 227712);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2849767', 74, 1483333200, 225985);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2925371', 75, 1483333200, 225568);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2263909', 76, 1483333200, 222224);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2463453', 77, 1483333200, 220369);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2496305', 78, 1483333200, 218373);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('579968', 80, 1483333200, 217560);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2844173', 81, 1483333200, 216700);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('698675', 83, 1483333200, 215011);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2855384', 86, 1483333200, 211062);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2444781', 89, 1483333200, 205455);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2830058', 90, 1483333200, 205308);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2404125', 91, 1483333200, 204049);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2407925', 92, 1483333200, 203477);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('749215', 94, 1483333200, 200663);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('725791', 96, 1483333200, 199640);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2688236', 97, 1483333200, 198702);
DROP TABLE IF EXISTS Popularity;
CREATE TABLE Popularity AS
  SELECT Songs.id, scores.cumulative_score 
  FROM Sings LEFT JOIN Person ON Person.id = Sings.artist_id
  LEFT JOIN Songs ON Sings.song_id = Songs.id
  LEFT JOIN (SELECT id, SUM(score) AS cumulative_score
    FROM(SELECT song_id as id, (streams / position) AS score
        FROM Entries) x
        GROUP BY id)
    scores ON Songs.id = scores.id
  ORDER BY scores.cumulative_score DESC;
  