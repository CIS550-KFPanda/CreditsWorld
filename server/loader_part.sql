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
VALUES ('3857644', '2017 Playlist', 'Decades Of The 21st Century:2010-2019', NULL, 'NULL', 'https://images.genius.com/f0c7eb4741875841755dbc6a19b680f0.300x300x1.jpg', '2019');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('3036726', 'In The Name Of Love (Snavs Remix)', 'In the Name of Love (Remixes)', 'STMPD RCRDS', 'http://www.youtube.com/watch?v=yCYT9X8KE2w', 'https://images.genius.com/6aea4958a5d0cc197597bc4946f312ba.300x300x1.jpg', 'November 10, 2017');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2436402', 'Caroline', 'Good For You', 'Universal Music Group,Republic Records', 'http://www.youtube.com/watch?v=3j8ecF8Wt4E', 'https://images.genius.com/e5b85886dea15403c0e28e312bb22e1e.300x300x1.jpg', 'March 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2890675', 'The 25 Best Pop Songs of 2016: Nominations', '2016 Year-End List', NULL, 'NULL', 'https://images.genius.com/7e177b5f3341d07397a75c280dfc54ed.300x300x1.png', 'October 23, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2911255', 'Party Monster', 'Starboy', 'Republic Records,The Weeknd XO, Inc.,Universal Music Group', 'http://www.youtube.com/watch?v=diW6jXhLE0E', 'https://images.genius.com/235fbb681a9b3e40af8aa474ba16b9cd.300x300x1.jpg', 'November 18, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2891157', 'Best Songs of 2016 Nominations', 'Genius Best of 2016', NULL, 'NULL', 'https://images.genius.com/ca26177152bbe276a2fbc90b0ca7495a.300x300x1.png', 'October 24, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2924188', 'Deja Vu', '4 Your Eyez Only', NULL, 'http://www.youtube.com/watch?v=9d_jOIwEKPY', 'https://images.genius.com/37291e01ab860f66509cc60d0f0c75bf.300x300x1.jpg', 'December 9, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2336758', 'Chill Bill', 'Straight Bummin’', NULL, 'http://www.youtube.com/watch?v=J7IMwop3RHs', 'https://images.genius.com/952d814fc11cc4f5a0d2e5ec5e84e89a.300x300x1.jpg', 'June 25, 2015');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2890553', 'Fake Love', 'More Life', 'Cash Money Records,Young Money,Republic Records,Octobers Very Own', 'http://www.youtube.com/watch?v=jz_01KVkOBI', 'https://images.genius.com/4672f8523e0fbf7f7848185256e946f4.300x300x1.jpg', 'October 23, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2820703', 'X', 'Savage Mode', NULL, 'http://www.youtube.com/watch?v=SpXw0qiy3Wo', 'https://images.genius.com/74fd790126e1e11b02aa8a560e195859.300x300x1.jpg', 'July 15, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2893922', 'Bounce Back', 'I Decided.', 'G.O.O.D. Music,Def Jam Recordings', 'http://www.youtube.com/watch?v=phr1pOFK1V8', 'https://images.genius.com/6dbe3c351a64ae50d44858c7502c4365.300x300x1.jpg', 'October 31, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2451433', 'Broccoli', 'Big Baby DRAM', NULL, 'http://www.youtube.com/watch?v=K44j-sb1SRY', 'https://images.genius.com/5c743f0ab4939e1b435db108b4118040.300x300x1.jpg', 'April 6, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2909921', 'I Feel It Coming', 'Starboy', 'The Weeknd XO, Inc.,Universal Music Group,Republic Records', 'http://www.youtube.com/watch?v=qFLhGq0060w', 'https://images.genius.com/02d44f528e2f14794c9ac02eeb6268f3.300x300x1.jpg', 'November 18, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2851057', 'Don’t Wanna Know', 'Red Pill Blues', 'Top Dawg Entertainment,Aftermath,Friends Keep Secrets,Interscope Records,222 Records', 'http://www.youtube.com/watch?v=OxPv8mSTv9U', 'https://images.genius.com/73a34d501ab0ea962a4fcda19a957f86.300x300x1.jpg', 'October 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2819412', 'Let Me Love You', 'Encore', 'DJ Snake Productions Limited,Interscope Records', 'http://www.youtube.com/watch?v=euCqAq6BRa4', 'https://images.genius.com/073cd0dbdf330c416680c3705d09270a.300x300x1.jpg', 'August 4, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2872960', '24K Magic', '24K Magic', 'Atlantic Records', 'http://www.youtube.com/watch?v=UqyT8IEBkvY', 'https://images.genius.com/b282bdd631cf951aad0ed03f69a58356.300x300x1.jpg', 'October 7, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2819932', 'Black Beatles', 'SremmLife 2', NULL, 'http://www.youtube.com/watch?v=b8m9zhNAgKs', 'https://images.genius.com/3ae5fce394cec0598165a7fe68c8fa74.300x300x1.jpg', 'August 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2450584', 'One Dance', 'Views', 'Universal Music Group,Cash Money Records,Young Money,Republic Records', 'http://www.youtube.com/watch?v=iAbnEUA0wpA', 'https://images.rapgenius.com/103e5aed5053b63991934deae026b9d3.300x300x1.jpg', 'April 5, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2474069', 'OOOUUU', 'Herstory', NULL, 'http://www.youtube.com/watch?v=gVf_4Ns3qLU', 'https://images.genius.com/6697b65322ef90e9777557e902c1b3c4.300x300x1.jpg', 'May 12, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2845980', 'Bad and Boujee', 'Culture', 'Quality Control', 'http://www.youtube.com/watch?v=S-sJp1FfG7Q', 'https://images.genius.com/2fec6685c2aa2f875cab422bdb68d099.300x300x1.png', 'August 27, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2851948', 'Starboy', 'Starboy', 'The Weeknd XO, Inc.,Universal Music Group,Republic Records', 'http://www.youtube.com/watch?v=34Na4j8AVgA', 'https://images.genius.com/1df3b30ecda8ca80f687230b43897ed1.300x300x1.jpg', 'September 21, 2016');
INSERT INTO Songs (id, title, album, label,youtube_url, song_art_image_thumbnail_url, release_date_for_display)
VALUES ('2458848', 'Closer', 'Collage', NULL, 'http://www.youtube.com/watch?v=0zGcUoRlhmw', 'https://images.genius.com/6e44a91448d28714d0a0f91a27193e91.300x300x1.jpg', 'July 29, 2016');
INSERT INTO Person (id, name, image_url, url)
VALUES ('26577', 'Aminé', 'https://images.genius.com/b84dcf6b373199720716085d766624a1.540x540x1.jpg', 'https://genius.com/artists/Amine');
INSERT INTO Person (id, name, image_url, url)
VALUES ('992687', 'Vimto(TaylorSwift14)', 'https://images.genius.com/f0c7eb4741875841755dbc6a19b680f0.1000x1000x1.jpg', 'https://genius.com/artists/Vimtotaylorswift14');
INSERT INTO Person (id, name, image_url, url)
VALUES ('177756', 'Rae Sremmurd', 'https://images.genius.com/c1c133f78a89899c77f8ac4329d4298b.645x645x1.jpg', 'https://genius.com/artists/Rae-sremmurd');
INSERT INTO Person (id, name, image_url, url)
VALUES ('980465', '21 Savage & Metro Boomin', 'https://images.genius.com/d80415ba54e748cced97ffd872f1a482.630x630x1.jpg', 'https://genius.com/artists/21-savage-and-metro-boomin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('500', 'Bruno Mars', 'https://images.genius.com/edca1a867127a07d29f959070b1a2a5f.838x838x1.png', 'https://genius.com/artists/Bruno-mars');
INSERT INTO Person (id, name, image_url, url)
VALUES ('241761', 'DRAM', 'https://images.genius.com/6356cb78f83b5bd8c293e6eb87909206.1000x750x1.jpg', 'https://genius.com/artists/Dram');
INSERT INTO Person (id, name, image_url, url)
VALUES ('151666', 'Pop Genius', 'https://images.genius.com/7e177b5f3341d07397a75c280dfc54ed.512x512x1.png', 'https://genius.com/artists/Pop-genius');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2180892', 'Peter Karlsson, watt & Ali Payami, Taylor Swift, Ali Payami, Max Martin & Shellback,  Clara Taroncher, Luis Ángel O’Neill, Eric Pérez, Jorge Class & Matt Rad and many more', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Peter-karlsson-watt-and-ali-payami-taylor-swift-ali-payami-max-martin-and-shellback-clara-taroncher-luis-angel-oneill-eric-perez-jorge-class-and-matt-rad-and-many-more');
INSERT INTO Person (id, name, image_url, url)
VALUES ('65238', 'Martin Garrix', 'https://images.genius.com/055a3f25a6c81bcadd91c5bf0ab6d056.400x400x1.jpg', 'https://genius.com/artists/Martin-garrix');
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
VALUES ('41287', 'DJ Snake', 'https://images.genius.com/788e25951d4ca358d84a6237f53b7393.1000x1000x1.jpg', 'https://genius.com/artists/Dj-snake');
INSERT INTO Person (id, name, image_url, url)
VALUES ('13539', 'Maroon 5', 'https://images.genius.com/52af76244f7392149389dfc653cd0ec1.960x960x1.jpg', 'https://genius.com/artists/Maroon-5');
INSERT INTO Person (id, name, image_url, url)
VALUES ('204611', 'Genius', 'https://images.genius.com/8ed669cadd956443e29c70361ec4f372.1000x1000x1.png', 'https://genius.com/artists/Genius');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1002050', 'Pasqué', 'https://s3.amazonaws.com/filepicker-images-rapgenius/DrpFz7maSSm1S6zE9Y9F_15035648_2150274645197051_2348732213329133568_n.jpg', 'https://genius.com/artists/Pasque');
INSERT INTO Person (id, name, image_url, url)
VALUES ('625410', 'Rob $tone', 'https://images.genius.com/b4c411442720c17c11a38b90d3eb360d.683x683x1.png', 'https://genius.com/artists/Rob-stone');
INSERT INTO Person (id, name, image_url, url)
VALUES ('150934', 'The Chainsmokers', 'https://images.genius.com/3dbdcbf24ff923ce4e5feb7d777e76d1.400x400x1.png', 'https://genius.com/artists/The-chainsmokers');
INSERT INTO Person (id, name, image_url, url)
VALUES ('44080', 'Migos', 'https://images.genius.com/f9c991a8f021b26424a0ce9efa8ccee3.1000x1000x1.jpg', 'https://genius.com/artists/Migos');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2358', 'The Weeknd', 'https://images.genius.com/6dddd0ef3b7f04df34e6bf95ca70975e.683x683x1.jpg', 'https://genius.com/artists/The-weeknd');
INSERT INTO Person (id, name, image_url, url)
VALUES ('339543', 'Young M.A', 'https://images.genius.com/eac22acf0996fe81401676d52fe00183.803x803x1.jpg', 'https://genius.com/artists/Young-ma');
INSERT INTO Person (id, name, image_url, url)
VALUES ('130', 'Drake', 'https://images.genius.com/bc985312781041952f9a11b657d7d0b8.905x905x1.jpg', 'https://genius.com/artists/Drake');
INSERT INTO Person (id, name, image_url, url)
VALUES ('492', 'Big Sean', 'https://images.genius.com/fe9d52d64ed689e2e66252f43efab598.1000x1000x1.jpg', 'https://genius.com/artists/Big-sean');
INSERT INTO Person (id, name, image_url, url)
VALUES ('34533', 'Ben Billions', 'https://images.genius.com/09f61531af507bb45d353f1d3e6545ae.522x522x1.jpg', 'https://genius.com/artists/Ben-billions');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27655', 'Doc McKinney', 'https://images.genius.com/3d76bf45c9a8ac094098e8630665e9d6.999x999x1.jpg', 'https://genius.com/artists/Doc-mckinney');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1362', 'Belly', 'https://s3.amazonaws.com/filepicker-images-rapgenius/HorpSGA7Qqar8HM5ScIx_Belly1.jpg', 'https://genius.com/artists/Belly');
INSERT INTO Person (id, name, image_url, url)
VALUES ('15740', 'Lana Del Rey', 'https://images.genius.com/e2096df3a04a6860907c2ba8a9b89126.1000x1000x1.jpg', 'https://genius.com/artists/Lana-del-rey');
INSERT INTO Person (id, name, image_url, url)
VALUES ('69', 'J. Cole', 'https://images.genius.com/034c70a439a2b0c4c13b8b346b560111.999x999x1.jpg', 'https://genius.com/artists/J-cole');
INSERT INTO Person (id, name, image_url, url)
VALUES ('182877', 'Velous', 'https://images.genius.com/0d601c26fcba5b61abcb4b6bad3b78b5.964x964x1.jpg', 'https://genius.com/artists/Velous');
INSERT INTO Person (id, name, image_url, url)
VALUES ('662', 'Boi-1da', 'https://images.genius.com/f1b95b403a63c49b2248d0e5c153092a.858x858x1.jpg', 'https://genius.com/artists/Boi-1da');
INSERT INTO Person (id, name, image_url, url)
VALUES ('27616', 'Vinylz', 'https://s3.amazonaws.com/rapgenius/1372924433_Vinylz-e1366826599913.jpg', 'https://genius.com/artists/Vinylz');
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
VALUES ('28169', 'Frank Dukes', 'https://images.genius.com/cdc1e3192af06b780209ec9e4959d1b1.1000x1000x1.jpg', 'https://genius.com/artists/Frank-dukes');
INSERT INTO Person (id, name, image_url, url)
VALUES ('162702', 'Starrah', 'https://images.genius.com/1ea6c29578bc6e73588d14f269246ffb.770x770x1.png', 'https://genius.com/artists/Starrah');
INSERT INTO Person (id, name, image_url, url)
VALUES ('430404', '21 Savage', 'https://images.genius.com/38af6f15c4c3af0551bde5b9ee778d6e.889x889x1.jpg', 'https://genius.com/artists/21-savage');
INSERT INTO Person (id, name, image_url, url)
VALUES ('33010', 'Metro Boomin', 'https://images.genius.com/94086fe06834a3f3147dfbd52f729cad.940x940x1.jpg', 'https://genius.com/artists/Metro-boomin');
INSERT INTO Person (id, name, image_url, url)
VALUES ('2197', 'Future', 'https://images.genius.com/833e2b1d817f1320be26668c01b3be33.780x780x1.png', 'https://genius.com/artists/Future');
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
VALUES ('643405', 'Rogét Chahayed', 'https://images.genius.com/0ec7d86de5ad68aa2006d7707595ae7f.400x400x1.jpg', 'https://genius.com/artists/Roget-chahayed');
INSERT INTO Person (id, name, image_url, url)
VALUES ('579558', 'Karl Rubin Brutus', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Karl-rubin-brutus');
INSERT INTO Person (id, name, image_url, url)
VALUES ('51380', 'J Gramm', 'https://images.genius.com/a2988797673127ae5dfe26f242d01ed9.1000x1000x1.jpg', 'https://genius.com/artists/J-gramm');
INSERT INTO Person (id, name, image_url, url)
VALUES ('610968', 'Lil Yachty', 'https://images.genius.com/e9ed7a062d51e2c00a01c863ce55826f.851x851x1.jpg', 'https://genius.com/artists/Lil-yachty');
INSERT INTO Person (id, name, image_url, url)
VALUES ('13585', 'Daft Punk', 'https://images.genius.com/a508888fd6a96cadcf835ecf95b1c1ae.1000x1000x1.jpg', 'https://genius.com/artists/Daft-punk');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1033803', 'Eric Chedeville', 'https://images.genius.com/fecb00f20126f25b5c2ccd77af3aa17e.581x581x1.jpg', 'https://genius.com/artists/Eric-chedeville');
INSERT INTO Person (id, name, image_url, url)
VALUES ('31634', 'Guy-Manuel de Homem-Christo', 'https://images.genius.com/ebe2e5dbb54f1414d3d0cbfd6c5c5d52.593x593x1.jpg', 'https://genius.com/artists/Guy-manuel-de-homem-christo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('42463', 'Thomas Bangalter', 'https://images.genius.com/f96ae0accbefb5cea27439d1060fc259.813x813x1.jpg', 'https://genius.com/artists/Thomas-bangalter');
INSERT INTO Person (id, name, image_url, url)
VALUES ('30425', 'Cirkut', 'https://s3.amazonaws.com/rapgenius/cirkut.jpg', 'https://genius.com/artists/Cirkut');
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
VALUES ('209397', 'John Ryan', 'https://images.genius.com/be786dfbd003b7bf7d5ca7dad32db144.640x640x1.jpg', 'https://genius.com/artists/John-ryan');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1421', 'Kendrick Lamar', 'https://images.genius.com/25d8a9c93ab97e9e6d5d1d9d36e64a53.1000x1000x1.jpg', 'https://genius.com/artists/Kendrick-lamar');
INSERT INTO Person (id, name, image_url, url)
VALUES ('669', 'Adam Levine', 'https://images.genius.com/cc964ee2d36cd6f5046f18c6696f6992.1000x1000x1.jpg', 'https://genius.com/artists/Adam-levine');
INSERT INTO Person (id, name, image_url, url)
VALUES ('576544', '​watt', 'https://s3.amazonaws.com/filepicker-images-rapgenius/ioZag93cQyC14aoRUlrY_C1iBmacUkAAYmDp.jpg', 'https://genius.com/artists/Watt');
INSERT INTO Person (id, name, image_url, url)
VALUES ('143754', 'Louis Bell', 'https://images.genius.com/e5e5ab07410bcde1d4bc916ee86f6ec1.727x727x1.jpg', 'https://genius.com/artists/Louis-bell');
INSERT INTO Person (id, name, image_url, url)
VALUES ('468880', 'Edwin Perez', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Edwin-perez');
INSERT INTO Person (id, name, image_url, url)
VALUES ('468879', 'Teddy Mendez', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Teddy-mendez');
INSERT INTO Person (id, name, image_url, url)
VALUES ('401980', 'Steve Marsden', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Steve-marsden');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1009606', 'Lumidee Cedeno', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Lumidee-cedeno');
INSERT INTO Person (id, name, image_url, url)
VALUES ('149418', 'Brian Lee', 'https://images.genius.com/f6afbd9c79c2861ab29f6343eb30ac5a.330x330x1.jpg', 'https://genius.com/artists/Brian-lee');
INSERT INTO Person (id, name, image_url, url)
VALUES ('986640', 'Austin Rosen', 'https://images.genius.com/3ec6fe9a0ee0dc90c755de7ddf95138a.296x296x1.png', 'https://genius.com/artists/Austin-rosen');
INSERT INTO Person (id, name, image_url, url)
VALUES ('357', 'Justin Bieber', 'https://images.genius.com/b8a71aef947716b9e24dcbea07fd23d1.800x800x1.jpg', 'https://genius.com/artists/Justin-bieber');
INSERT INTO Person (id, name, image_url, url)
VALUES ('329564', 'Ali Tamposi', 'https://images.genius.com/6174204cacce64faf00b87547367d359.1000x1000x1.jpg', 'https://genius.com/artists/Ali-tamposi');
INSERT INTO Person (id, name, image_url, url)
VALUES ('1012903', 'Shampoo Press & Curl', 'https://assets.genius.com/images/default_avatar_300.png?1588262610', 'https://genius.com/artists/Shampoo-press-and-curl');
INSERT INTO Person (id, name, image_url, url)
VALUES ('49094', 'Philip Lawrence', 'https://images.genius.com/6ee4730c24f39ead0ad526ecc8d4fc8e.300x300x1.jpg', 'https://genius.com/artists/Philip-lawrence');
INSERT INTO Person (id, name, image_url, url)
VALUES ('47127', 'Brody Brown', 'https://images.genius.com/31498855fd807d98e9593889d040e3c0.400x400x1.jpg', 'https://genius.com/artists/Brody-brown');
INSERT INTO Person (id, name, image_url, url)
VALUES ('29978', 'Mike WiLL Made-It', 'https://images.genius.com/1d29ef19a466f4bf49282b4d020cb593.895x895x1.jpg', 'https://genius.com/artists/Mike-will-made-it');
INSERT INTO Person (id, name, image_url, url)
VALUES ('13', 'Gucci Mane', 'https://images.genius.com/6f0a4980c8ef838036229e1d4dcd036c.408x408x1.jpg', 'https://genius.com/artists/Gucci-mane');
INSERT INTO Person (id, name, image_url, url)
VALUES ('335759', 'Slim Jxmmi', 'https://images.genius.com/0611b61677b3163a555e15a1ee50fe0a.976x976x1.jpg', 'https://genius.com/artists/Slim-jxmmi');
INSERT INTO Person (id, name, image_url, url)
VALUES ('209139', 'Swae Lee', 'https://images.genius.com/9a8ca2288987bb9d4e450ff5de598c78.905x905x1.jpg', 'https://genius.com/artists/Swae-lee');
INSERT INTO Person (id, name, image_url, url)
VALUES ('64581', 'Nineteen85', 'https://images.genius.com/552cc3e0e81342a8f8fe386f00592a3e.1000x1000x1.jpg', 'https://genius.com/artists/Nineteen85');
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
VALUES ('64420', 'NY Bangers', 'https://images.genius.com/c22166ff72aeed946c07612b6ba3758e.512x512x1.jpg', 'https://genius.com/artists/Ny-bangers');
INSERT INTO Person (id, name, image_url, url)
VALUES ('59421', 'G Koop', 'https://images.genius.com/ae27979a9a5c251125d89ae28f83064a.315x315x1.jpg', 'https://genius.com/artists/G-koop');
INSERT INTO Person (id, name, image_url, url)
VALUES ('217208', 'Lil Uzi Vert', 'https://images.genius.com/05f2ee7ef53d1a68352ec67cda793d0c.469x469x1.jpg', 'https://genius.com/artists/Lil-uzi-vert');
INSERT INTO Person (id, name, image_url, url)
VALUES ('88813', 'Offset', 'https://images.genius.com/c7998ea0216f8ddeaaadb5ca063b4ae3.1000x1000x1.jpg', 'https://genius.com/artists/Offset');
INSERT INTO Person (id, name, image_url, url)
VALUES ('61600', 'Quavo', 'https://images.genius.com/f1ff6c1619a1b9e7adaa8b8789f23c68.563x563x1.jpg', 'https://genius.com/artists/Quavo');
INSERT INTO Person (id, name, image_url, url)
VALUES ('574528', 'DaHeala', 'https://images.genius.com/9c08e6de716f1f6838672ca295a32747.1000x1000x1.jpg', 'https://genius.com/artists/Daheala');
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
VALUES ('660558', 'Andrew Taggart', 'https://images.genius.com/5365afd9d2fbedf518a6d079b4573b8f.766x766x1.jpg', 'https://genius.com/artists/Andrew-taggart');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('26577', '801', '10604');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('992687', '10', '2842');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('177756', '1076', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('980465', '143', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('500', '1578', '250');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('241761', '372', '9706');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('151666', '1', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('65238', '307', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('104044', NULL, '6332');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('41287', '169', '227');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('13539', '581', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('204611', '1861', '73419');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('625410', '62', '1814');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('150934', '1002', '640');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('44080', '3267', '1453');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('2358', '7331', '6225');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('339543', '313', '4440');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('130', '13869', NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('492', '6722', '16220');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('10586', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('579526', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('69', '9635', '355');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('2197', NULL, '4077');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('610968', NULL, '12207');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('13585', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('1421', NULL, '41099');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('357', NULL, '1525');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('13', NULL, '688');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('155256', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('20148', NULL, NULL);
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('217208', NULL, '4679');
INSERT INTO Artists (artist_id, genius_followers, genius_iq)
VALUES ('228636', NULL, '1525');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('26577', '2436402', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2890553', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('177756', '2819932', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('992687', '3857644', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('44080', '2845980', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2851948', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('500', '2872960', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('65238', '3036726', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('241761', '2451433', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13539', '2851057', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2911255', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('980465', '2820703', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('625410', '2336758', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('339543', '2474069', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('492', '2893922', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('69', '2924188', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2358', '2909921', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('151666', '2890675', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('41287', '2819412', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('204611', '2891157', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('130', '2450584', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('150934', '2458848', 'primary');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('104044', '3036726', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('10586', '2336758', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('579526', '2336758', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('2197', '2820703', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('610968', '2451433', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13585', '2909921', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('1421', '2851057', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('357', '2819412', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13', '2819932', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('155256', '2450584', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('20148', '2450584', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('217208', '2845980', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('13585', '2851948', 'featured');
INSERT INTO Sings (artist_id, song_id, type)
VALUES ('228636', '2458848', 'featured');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('2180892', '3857644', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('992687', '3857644', 'writer');
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
VALUES ('26577', '2436402', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1002050', '2436402', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('1002050', '2436402', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('26577', '2436402', 'writer');
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
VALUES ('1012903', '2872960', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('49094', '2872960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('47127', '2872960', 'writer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('500', '2872960', 'writer');
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
VALUES ('64420', '2474069', 'producer');
INSERT INTO Crew_in (crew_id, song_id, type)
VALUES ('339543', '2474069', 'writer');
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
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2436402', 8, 1483246800, 714839);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890553', 2, 1483246800, 1180074);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2819932', 5, 1483246800, 874289);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3857644', 15, 1483246800, 507450);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2845980', 1, 1483246800, 1371493);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2851948', 3, 1483246800, 1064351);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2872960', 12, 1483246800, 574974);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('3036726', 20, 1483333200, 441973);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2451433', 6, 1483246800, 763259);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2851057', 16, 1483246800, 486364);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2911255', 20, 1483246800, 456291);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2820703', 14, 1483246800, 544620);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2336758', 17, 1483246800, 485127);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2474069', 19, 1483246800, 456308);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2893922', 10, 1483246800, 682688);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2924188', 18, 1483246800, 478503);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2909921', 11, 1483246800, 651807);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2890675', 18, 1483333200, 447433);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2819412', 9, 1483246800, 690483);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2891157', 13, 1483246800, 567789);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2450584', 7, 1483246800, 753150);
INSERT INTO Entries (song_id, position, date, streams)
VALUES ('2458848', 4, 1483246800, 1010492);
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
VALUES ('2336758', 19, 1483333200, 444104);
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
  