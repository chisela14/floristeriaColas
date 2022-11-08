create table floresColas.COLOR (
	code VARCHAR(7),
	name VARCHAR(20) NOT NULL,
	description VARCHAR(50),
    CONSTRAINT PK_COLOR PRIMARY KEY (code)
);

create table floresColas.FLOWER (
	code INT,
	name VARCHAR(50) UNIQUE NOT NULL,
	description VARCHAR(50),
	price DECIMAL(4,2) NOT NULL,
	color_code VARCHAR(7),
    CONSTRAINT PK_FLOWER PRIMARY KEY (code),
    CONSTRAINT FK_FLOWER FOREIGN KEY (color_code) REFERENCES floresColas.COLOR (code) ON DELETE CASCADE
);

create table floresColas.USERS (
	username VARCHAR(50),
	password VARCHAR(32) NOT NULL, -- TAMAÑO 32 PARA LA ENCRIPTACIÓN MD5
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	genre VARCHAR(50),
	admin VARCHAR(50),
    CONSTRAINT PK_USERS PRIMARY KEY (username)
);

create table floresColas.PURCHASE (
	username VARCHAR(50),
	flower_code INT,
	quantity INT NOT NULL,
	price DECIMAL(5,2) NOT NULL,
	date DATE,
    CONSTRAINT PK_PURCHASE PRIMARY KEY (username, flower_code, date),
    CONSTRAINT FK_PURCHASE FOREIGN KEY (username) REFERENCES floresColas.USERS (username) ON DELETE CASCADE,
    CONSTRAINT FK_PURCHASE FOREIGN KEY (flower_code) REFERENCES floresColas.FLOWER (code) ON DELETE CASCADE
);

-- INSERT COLOR TABLE 
insert into floresColas.COLOR (code, name, description) values ('#0d2175', 'Green', 'Asteraceae');
insert into floresColas.COLOR (code, name, description) values ('#59145f', 'Turquoise', 'Iridaceae');
insert into floresColas.COLOR (code, name, description) values ('#a6ae85', 'White', 'Convolvulaceae');
insert into floresColas.COLOR (code, name, description) values ('#fc3789', 'Khaki', 'Cucurbitaceae');
insert into floresColas.COLOR (code, name, description) values ('#317f9d', 'Violet', 'Polypodiaceae');
insert into floresColas.COLOR (code, name, description) values ('#b9ce62', 'Fuscia', 'Fabaceae');
insert into floresColas.COLOR (code, name, description) values ('#8ecd49', 'Maroon', 'Asteraceae');
insert into floresColas.COLOR (code, name, description) values ('#06250d', 'Yellow', 'Chenopodiaceae');
insert into floresColas.COLOR (code, name, description) values ('#a93371', 'Red', 'Rutaceae');
insert into floresColas.COLOR (code, name, description) values ('#a497df', 'Blue', 'Iridaceae');

-- INSERT FLOWER TABLE
insert into floresColas.FLOWER (code, name, description, price, color_code) values (1, 'Bearded Milkvetch', 'Astragalus villosus Michx.', 10.61, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (2, 'Sensitive Partridge Pea', 'Chamaecrista nictitans (L.) Moench ssp. patellaria (DC. ex Collad.) Irwin & Barneby var. glabrata (Vogel) Irwin & Barneby', 4.49, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (3, 'Bracted Colicroot', 'Aletris bracteata Northrop', 14.49, '#70ff0d');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (4, 'Italian Lords And Ladies', 'Arum italicum Mill.', 4.52, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (5, 'Goatgrass', 'Aegilops comosa Sm.', 13.3, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (6, 'Bleeding Heart', 'Lamprocapnos Endl.', 15.4, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (7, 'Bouquet Mudplantain', 'Heteranthera multiflora (Griseb.) Horn', 8.13, '#39b8a8');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (8, 'Sandmat', 'Chamaesyce ×keyensis Small', 17.08, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (9, 'Howell''s Reedgrass', 'Calamagrostis howellii Vasey', 17.78, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (10, 'Distant Phacelia', 'Phacelia distans Benth.', 14.95, '#a5b3c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (11, 'Manyseed Goosefoot', 'Chenopodium polyspermum L. var. acutifolium (Sm.) Gaudich.', 14.79, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (12, 'Purple Moorgrass', 'Molinia caerulea (L.) Moench', 17.19, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (13, 'Branching Phacelia', 'Phacelia ramosissima Douglas ex Lehm.', 17.69, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (14, 'Scribble Lichen', 'Opegrapha rupestris Pers.', 0.62, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (15, 'Tape Dwarf Polypody', 'Grammitis hessii (Maxon) Alain', 13.1, '#70ff0d');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (16, 'Orange Wall Lichen', 'Xanthoria polycarpa (Hoffm.) Rieber', 15.97, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (17, 'Kneeling Angelica', 'Angelica genuflexa Nutt.', 2.24, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (18, 'Lasianthus', 'Lasianthus Jack', 6.71, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (19, 'Beetle Spurge', 'Euphorbia eriantha Benth.', 3.62, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (20, 'Lone Mesa Snakeweed', 'Gutierrezia elegans Al Schneid. & P. Lyon', 5.96, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (21, 'Bowl Lichen', 'Psoroma Michx.', 2.59, '#39b8a8');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (22, 'Alpine Bluegrass', 'Poa alpina L.', 1.7, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (23, 'Stargrass', 'Cynodon plectostachyus (K. Schum.) Pilg.', 16.43, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (24, 'Southwestern False Cloak Fern', 'Argyrochosma limitanea (Maxon) Windham ssp. limitanea', 0.95, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (25, 'Luquillo Mountain Babyboot Orchid', 'Lepanthes eltoroensis Stimson', 5.94, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (26, 'Spanish Moss', 'Tillandsia usneoides (L.) L.', 14.98, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (27, 'Tufted Wallaby Grass', 'Rytidosperma caespitosum (Gaudich.) Connor & Edgar', 14.06, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (28, 'Shortfruit Willow', 'Salix brachycarpa Nutt. var. psammophila Raup', 12.47, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (29, 'Rocketsalad', 'Eruca Mill.', 2.75, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (30, 'Sharpleaf Snowberry', 'Symphoricarpos acutus (A. Gray) Dieck', 4.82, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (31, 'Oreganillo', 'Koanophyllon dolicholepis (Urb.) R.M. King & H. Rob.', 0.63, '#a5b3c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (32, 'Alaskan Glacier Buttercup', 'Ranunculus glacialis L. ssp. alaskensis Jurtzev', 2.49, '#70ff0d');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (33, 'Chaparral Nightshade', 'Solanum xanti A. Gray var. montanum Munz', 5.49, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (34, 'Tall Blazing Star', 'Liatris aspera Michx.', 17.19, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (35, 'Sandberg''s Biscuitroot', 'Lomatium sandbergii (J.M. Coult. & Rose) J.M. Coult. & Rose', 13.25, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (36, 'Broadleaf Stonecrop', 'Sedum spathulifolium Hook. ssp. pruinosum (Britton) R.T. Clausen & Uhl', 7.41, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (37, 'Mountain Oxytrope', 'Oxytropis oreophila A. Gray', 11.81, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (38, 'Teasel Clover', 'Trifolium retusum L.', 12.81, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (39, 'Miracle Fruit', 'Thaumatococcus daniellii (Benn.) Benth.', 9.09, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (40, 'Rangoon Creeper', 'Quisqualis L.', 13.88, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (41, 'Browneyed Susan', 'Rudbeckia triloba L. var. pinnatiloba Torr. & A. Gray', 5.64, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (42, 'Spikeoat', 'Avenula hookeri (Scribn.) Holub', 15.87, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (43, 'Lean Flatsedge', 'Cyperus setigerus Torr. & Hook.', 3.62, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (44, '''ohi''a Lehua', 'Metrosideros polymorpha Gaudich. var. polymorpha', 5.45, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (45, 'Map Lichen', 'Rhizocarpon pusillum Runem.', 14.86, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (46, 'Foothill Rush', 'Juncus trilocularis Zika', 16.66, '#a5b3c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (47, 'Ruby Saltbush', 'Enchylaena tomentosa R. Br.', 14.46, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (48, 'Poison Suckleya', 'Suckleya suckleyana (Torr.) Rydb.', 9.41, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (49, 'Lophosoria', 'Lophosoria C. Presl', 14.95, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (50, 'Woods'' Rose', 'Rosa woodsii Lindl.', 15.59, '#39b8a8');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (51, 'Island Blackberry', 'Rubus insulanus L.H. Bailey', 11.65, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (52, 'Visher''s Buckwheat', 'Eriogonum visheri A. Nelson', 5.57, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (53, 'Colza', 'Brassica rapa L. var. silvestris (Lam.) Briggs', 19.6, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (54, 'West Indian Bristlegrass', 'Setaria setosa (Sw.) P. Beauv. var. leiophylla (Nees) Arechav.', 18.45, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (55, 'Centipede Grass', 'Eremochloa Büse', 5.92, '#a5b3c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (56, 'Shale Barren Evening Primrose', 'Oenothera argillicola Mack.', 10.64, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (57, 'Yellow Spiderflower', 'Cleome lutea Hook.', 8.77, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (58, 'Bartramia Moss', 'Bartramia pomiformis Hedw.', 16.88, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (59, 'Sidebeak Pencilflower', 'Stylosanthes biflora (L.) Britton, Sterns & Poggenb.', 14.78, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (60, 'Running Strawberry Bush', 'Euonymus obovatus Nutt.', 5.44, '#70ff0d');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (61, 'Bush''s Goosefoot', 'Chenopodium berlandieri Moq. var. bushianum (Aellen) Cronquist', 16.78, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (62, 'Green Monardella', 'Monardella viridis Jeps. ssp. viridis', 6.6, '#a5b3c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (63, 'Seaside Kirschsteiniothelia Lichen', 'Kirschsteiniothelia maritima (Linder) D. Hawksw.', 18.22, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (64, 'Spiked Saxifrage', 'Saxifraga spicata D. Don', 18.49, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (65, 'Bluntlobe Grapefern', 'Botrychium oneidense (Gilbert) House', 1.35, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (66, 'Dwarf Groundsmoke', 'Gayophytum humile Juss.', 17.31, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (67, 'Wax Mallow', 'Malvaviscus arboreus Dill. ex Cav. var. drummondii (Torr. & A. Gray) Schery', 5.09, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (68, 'Thickleaf Pepperweed', 'Lepidium integrifolium Nutt. var. heterophyllum S. Watson', 8.26, '#a5b3c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (69, 'Vervain', 'Verbena ×moechina Moldenke', 2.98, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (70, 'Tree Morning Glory', 'Ipomoea pauciflora M. Martens & Galeotti', 6.69, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (71, 'Slender Toothwort', 'Cardamine angustata O.E. Schulz', 18.09, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (72, 'Tracy''s Desertparsley', 'Lomatium tracyi Mathias & Constance', 16.81, '#70ff0d');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (73, 'Shrubby Cinquefoil', 'Dasiphora Raf.', 4.22, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (74, 'Hidden Buckwheat', 'Eriogonum capistratum Reveal', 6.1, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (75, 'Wallowa Onion', 'Allium tolmiei (Hook.) Baker ex S. Watson var. platyphyllum (Tidestr.) Ownbey', 15.69, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (76, 'Rixford''s Rockwort', 'Scopulophila rixfordii (Brandegee) Munz & I.M. Johnst.', 12.27, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (77, 'Rush Milkweed', 'Asclepias subulata Decne.', 4.32, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (78, 'Dunebroom', 'Errazurizia Phil.', 3.64, '#39b8a8');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (79, 'Mata Gallina', 'Dioscorea polygonoides Humb. & Bonpl. ex Willd.', 13.32, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (80, 'Honokahua Melicope', 'Melicope orbicularis (Hillebr.) T.G. Hartley & B.C. Stone', 7.04, '#70ff0d');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (81, 'Purple Muhly', 'Muhlenbergia rigida (Kunth) Trin.', 4.28, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (82, 'Boyd''s Maiden Fern', 'Thelypteris boydiae (D.C. Eaton) K. Iwats.', 12.74, '#253ccc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (83, 'Seaside Alder', 'Alnus maritima (Marshall) Muhl. ex Nutt.', 18.71, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (84, 'Texas Rush', 'Juncus texanus (Engelm.) Coville', 6.58, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (85, 'Talinopsis', 'Talinopsis A. Gray', 18.28, '#680471');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (86, 'Arrowleaf Violet', 'Viola sagittata Aiton var. sagittata', 11.46, '#39b8a8');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (87, 'Blackspore Quillwort', 'Isoetes melanospora Engelm.', 4.08, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (88, 'Elmer''s Blue-eyed Grass', 'Sisyrinchium elmeri Greene', 4.78, '#777fa2');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (89, 'Elongate Dropseed', 'Sporobolus elongatus R. Br.', 11.75, '#a5b3c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (90, 'Yerba De Estrella', 'Rhynchospora ciliata (G. Mey.) Kük.', 17.55, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (91, 'California Hedgenettle', 'Stachys bullata Benth.', 13.49, '#39b8a8');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (92, 'Sumac', 'Rhus L.', 7.16, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (93, 'Shortleaf Spikesedge', 'Kyllinga brevifolia Rottb.', 8.13, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (94, 'Ptychomitrium Moss', 'Ptychomitrium Fürnr.', 16.49, '#29961e');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (95, 'Kihifern', 'Adenophorus Gaudich.', 14.31, '#39b8a8');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (96, 'Rosette Lichen', 'Physcia (Schreb.) Michx.', 15.85, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (97, 'Charleston Sandwort', 'Arenaria congesta Nutt. var. charlestonensis Maguire', 12.37, '#6f6919');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (98, 'Appalachian Violet', 'Viola appalachiensis Henry', 16.93, '#5752dc');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (99, 'Chinquapin', 'Chrysolepis Hjelmquist', 19.13, '#fae6c1');
insert into floresColas.FLOWER (code, name, description, price, color_code) values (100, 'Mescalero Milkwort', 'Polygala rimulicola Steyerm. var. mescalerorum T. Wendt & T.K. Todsen', 1.07, '#777fa2');

-- INSERT USERS TABLE 
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gzoppie0', 'a39410e16648b643b93f3539ae4be345', 'Geoffry', 'Zoppie', '9/30/1988', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('igraveney1', '972cb82f20847b9ce577fe107e20c2a3', 'Iris', 'Graveney', '11/5/1992', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gryan2', 'b2a04d9c63b00f07a37b8c83bf92b169', 'Garvey', 'Ryan', '8/28/1995', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('sdreher3', '2de44bc2216ab78287bb7111a5c0d0c4', 'Susie', 'Dreher', '9/16/1940', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('vledgard4', '20457cd07bf60167b0aff7c532d742b4', 'Vick', 'Ledgard', '12/21/1974', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('shardi5', 'c2b1c969a310cb2544dd870373393cca', 'Shay', 'Hardi', '4/3/1993', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('escutts6', '071b66cd8885bec4984cea7b7547e950', 'Eldin', 'Scutts', '3/17/1977', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('isuddick7', '459f04f8db2900541c4d7089de9a2de0', 'Inger', 'Suddick', '6/18/1990', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('lmccahill8', '509a7124b7e0eeb735deaa92c5c78057', 'Leigh', 'McCahill', '4/28/1945', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('hpooly9', '38beee62f60bf6262b16e162fc871802', 'Helsa', 'Pooly', '6/19/1930', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gyanova', '1b8e3f4b27e0e4ec8e0b842439b6c117', 'Glenn', 'Yanov', '6/14/2000', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('sneillb', 'c297127dc0dd33a9ce4d3bee185a936d', 'Sam', 'Neill', '8/12/1966', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('mjephcottc', 'a4e2d35ba8b8e83559a777d5f720cff7', 'Molli', 'Jephcott', '10/25/1985', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('cpittendreighd', 'e1e7fc05be3a6a072211e11958ad4d8a', 'Curt', 'Pittendreigh', '2/6/2002', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('rjarrete', 'c7b7efe3e22549beba9bcfd66f197b27', 'Roslyn', 'Jarret', '7/5/1986', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('rbenitf', '737a70a6ca89b897c07a162d45707367', 'Romeo', 'Benit', '8/24/1931', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gwynessg', '9eef59fb4ded3230a0d081efc8678077', 'Gamaliel', 'Wyness', '6/24/1955', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ewillardh', '2a65d1dd8878c46e26f6b1514ee3818d', 'Edee', 'Willard', '11/8/1972', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('hfarncombi', '3ee91dc015e5c0d0eb5920f13ad797eb', 'Hort', 'Farncomb', '6/21/1948', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('mlaybornj', 'd6b84a3f8a7227bdc08ede2fb4dd27f6', 'Maddalena', 'Layborn', '3/23/1957', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('rtriponk', '787abb9d955dedf8417fb790ef73ecf7', 'Rodger', 'Tripon', '2/27/2006', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('shazlel', '5f14ac4428c33c29aff9486d35694959', 'Shalne', 'Hazle', '6/13/1979', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('lkynvinm', '1ef7d10be0e72d228b0faa9443e3ba82', 'Lothario', 'Kynvin', '3/9/1972', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('aconachyn', '76655e84bf8af48f4cb51fa632fa93e5', 'Abramo', 'Conachy', '1/12/1975', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ecroleo', 'b343a6729c938fd3877dc69f1a9030b5', 'Emlynn', 'Crole', '4/21/1971', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ljaunceyp', '1d4850b3e4dd7c28f3a93521fdb06d0b', 'Lacee', 'Jauncey', '11/24/2002', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('cperingq', '222d90b8a292afe129b055ed9fa6b2af', 'Celestyn', 'Pering', '4/1/1923', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('rhuzzayr', '8c2848255a084d7a957a7f2fc5733ed2', 'Ruby', 'Huzzay', '9/19/1951', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('qtapsons', '61aca846ba3cae0a623a36e4110947a2', 'Quintana', 'Tapson', '10/8/1993', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('tclayfieldt', '3f42240d65d8132af31a30a0e311da03', 'Tabby', 'Clayfield', '11/17/1983', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('vheintzu', 'c6dd93d0b8f1876cd0898ede82ce18cd', 'Vidovic', 'Heintz', '4/11/1945', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('eklempsv', 'e772ec3e2214c56ef7a3267fbc26c633', 'Engelbert', 'Klemps', '12/20/1966', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('dfredew', '2f824770b5adaba1877b38d0f29bb22b', 'Debby', 'Frede', '4/4/1924', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ccoastx', '54690224574c6d41e1d01ccc6dcb36af', 'Cooper', 'Coast', '3/19/1977', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('mtanguyy', '2068a5fa9c5a51760cf060fe2a8e4c08', 'Maurie', 'Tanguy', '7/22/1962', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('karsonz', 'cc8b990b1373b3e98f40a6c893022995', 'Korella', 'Arson', '9/28/1922', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('swoffinden10', '277afdaf6afdbf7e2eaef13fdc7e0dfd', 'Sybil', 'Woffinden', '3/30/1939', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('moliveras11', '4d48b812f0464d21f3caca1f6f3b98da', 'Madeleine', 'Oliveras', '11/26/1944', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('cyouens12', '067785454f1c26ed189d5240e0a6e4cb', 'Clayson', 'Youens', '8/5/1947', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('cnorthwood13', 'b088326b771bff8f6da3b37d11612f7c', 'Christin', 'Northwood', '12/8/1994', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('bhynes14', '719df387273303564a7d83bf95ad36e5', 'Brigg', 'Hynes', '6/23/1946', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('yfearon15', '482f9f040edfcda1023d83070412bf22', 'Yul', 'Fearon', '1/21/2002', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('jvickars16', '0b8793164d9f9ddd9fd2d351c4edcfa9', 'Jannel', 'Vickars', '4/13/1977', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('parmand17', 'bddc7a18fd524dc2ce2a8a58ab89db2f', 'Paige', 'Armand', '3/19/1924', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('nandrzejewski18', 'aa1c162fe77d7414155acd28f82c2e56', 'Norah', 'Andrzejewski', '7/30/1953', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('mgetsham19', '96615664a37ef4842b8347c9166bb874', 'Milicent', 'Getsham', '5/1/1970', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('awratten1a', '219a1349330ca3c3d2f9db98f7df2b55', 'Ara', 'Wratten', '9/15/1927', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('lgoodridge1b', 'a75ed002871209a5ff012b136b5c95e6', 'Lucia', 'Goodridge', '6/27/2008', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('tjansema1c', '6598107f9e6cc4395f082d12fa75df2c', 'Tom', 'Jansema', '3/4/1993', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ochrishop1d', 'c4a39d1b128b5cfbcafb645379307213', 'Oby', 'Chrishop', '11/24/1972', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('bpester1e', '819343c069b384236f10e334ed68dff0', 'Bear', 'Pester', '12/29/1995', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('jcarleman1f', '7764f4e9d82c4f91ef160542ac31f52f', 'Joelle', 'Carleman', '4/30/1972', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('crignoldes1g', 'df153769596ff6914b74146bd14882db', 'Cordelie', 'Rignoldes', '12/22/1973', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('cwebber1h', '148c213c38247960feb155fd92b56914', 'Chrissy', 'Webber', '11/24/1972', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('eleban1i', 'c7e625879b590af3fdfebfa9e18ace80', 'Ellary', 'Leban', '11/13/1972', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('iace1j', '544d2202963a692af8b624312725f79b', 'Ingeberg', 'Ace', '12/21/1953', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gsanson1k', '90ece285a2c2102c3c5a58bbc7147e18', 'Godfrey', 'Sanson', '1/3/1993', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gwyllt1l', '3f1d1e696cfea678ee698e4102424344', 'Gawain', 'Wyllt', '5/14/1983', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('rskipperbottom1m', '9d787b69838cbf524b821004818aff31', 'Rock', 'Skipperbottom', '4/14/1922', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gbernadon1n', 'ec60d980987eece53815bdffcccc65b9', 'Glynis', 'Bernadon', '12/4/1982', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('castin1o', '429aa77238c1586c434e7a96ecb7faa1', 'Cammi', 'Astin', '9/22/1985', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('khorbart1p', '2eeb216cdbd168906e0f52a23d57266d', 'Kattie', 'Horbart', '3/5/2004', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('rarchbold1q', 'a00dac60fcd82d9559f0a5805b6e4c2b', 'Rochette', 'Archbold', '6/17/2000', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('jbrymner1r', '4a0117716155c72c283cfd54e9ecdd04', 'Joscelin', 'Brymner', '6/27/1925', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ggioan1s', '1d9366f5cad2525b3f6e1e6ea53fa207', 'Gregor', 'Gioan', '10/25/1943', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('acrosen1t', 'b6679137a369a063a7f914815b38e4bc', 'Andrej', 'Crosen', '1/8/1980', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('adeavall1u', 'b52eaaa4f83e790fde7045306a1f4f5c', 'Amalita', 'Deavall', '3/26/1926', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('sjosilowski1v', 'a76ae9b9417f2b67b81355e6aad46915', 'Skippie', 'Josilowski', '7/9/1970', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('vbockmaster1w', '3368af4d6c4cf7b6ee5e687ff8107924', 'Vinnie', 'Bockmaster', '8/11/1943', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('swillisch1x', '798399a3e280b74662011627a08d464b', 'Siana', 'Willisch', '11/19/1945', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('aharner1y', 'a2840658e54580a1654897e427326014', 'Adelle', 'Harner', '9/11/1959', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ccupper1z', 'd6239c833e036ccdc4a3da08dbb5f549', 'Coleman', 'Cupper', '10/9/1980', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('fcainey20', 'a4c9c92b3564a2a6e51744be56d96d9d', 'Finlay', 'Cainey', '6/5/1920', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('sbengochea21', 'ea6a80c4ccb6f835c6da4eb6f92fcf5d', 'Sianna', 'Bengochea', '9/15/2001', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('battard22', 'f8425d7a85e0639ca403f293104f1f72', 'Brod', 'Attard', '12/21/1981', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('sharris23', 'fe4cf9c17fa885031b998028b0378e4c', 'Sapphira', 'Harris', '8/24/1978', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('hcubbini24', 'adce570fbcf768b2bcf187b363c9b954', 'Henrietta', 'Cubbini', '3/24/2008', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('aandreacci25', 'd8ed7a1c9278aa3ab97c3f5125ee3542', 'Alla', 'Andreacci', '3/5/2006', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('arowaszkiewicz26', '016cb4e794384ad321874924d40222f0', 'Augusta', 'Rowaszkiewicz', '5/25/1995', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('pponceford27', '05bd2083b9f6d3a6cf9a22be423cdc9b', 'Pattie', 'Ponceford', '5/28/1971', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('cpadilla28', '5a0a6355add521d4c9193b98c3ebf6e0', 'Claudell', 'Padilla', '4/30/1980', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('fcorden29', '0a06593e4d3132cf2fc996b0066918de', 'Franz', 'Corden', '12/18/1936', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('wduffield2a', '545f15e5a064340d30c1a77a4b94d24b', 'Wynny', 'Duffield', '10/26/1967', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('rwoolston2b', '2bd0c73731900a887106ff2c8f1e0c36', 'Rice', 'Woolston', '2/23/1945', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('kitzchaky2c', 'd48bff2e69e1bc653affa128ecea1c5b', 'Krisha', 'Itzchaky', '4/4/1921', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('vlethby2d', 'fa2c874c6cb645817fa995bafbf45f6d', 'Valentia', 'Lethby', '3/18/1922', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('fmessiter2e', '45b07bc69679ee05afc0abd0110306ac', 'Flossy', 'Messiter', '8/31/1993', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('swilstead2f', 'cdb8f62470d0a0be8d0737507d77cec9', 'Suzie', 'Wilstead', '6/25/1989', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('hferreli2g', 'cbb564b47c3b482ef687f09ad5dc74bd', 'Heddie', 'Ferreli', '4/14/2008', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gkellen2h', '8987658b6dd286e865333200f9cab268', 'Giulio', 'Kellen', '8/27/1981', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('mkinver2i', '15e2700b4118cad34b0537a7589c84e4', 'Mildrid', 'Kinver', '10/22/2005', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('asteptow2j', 'c0ea4f4e34a99fb51cd17dc1becafd50', 'Allayne', 'Steptow', '9/14/1981', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('dbannon2k', 'b47f6ceb37c6007cf034b96320945230', 'Damita', 'Bannon', '1/18/1966', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('wfransewich2l', '5d9ba4db3cc16639d7c85d0576530679', 'Wilhelmine', 'Fransewich', '6/11/2001', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('vcowitz2m', '50fba89e919036b36228450c81efe52d', 'Viv', 'Cowitz', '8/17/1945', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('fearle2n', '67183446d01aea3a829ebf9c973e5af1', 'Felike', 'Earle', '6/13/1974', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ccisson2o', '339360b3021a1440e6a30198d22d3aae', 'Chev', 'Cisson', '9/7/1927', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('doleszczak2p', '9c55e718b1f207181f13d0c041f86dc9', 'Daphne', 'Oleszczak', '8/17/1922', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gegell2q', '778026fd258727f8dd523be1e837dbfa', 'Gabriello', 'Egell', '12/17/2003', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gweiner2r', '808d9e40f25a093cc596a371a6d9f2ac', 'Gregorio', 'Weiner', '10/30/1944', 'Male', true);

-- INSERT PURCHASE TABLE 
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('aconnor29', 76, 53, 91.86, '3/29/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 95, 55, 93.43, '11/12/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 65, 15, 10.79, '7/15/2022');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vpurkiss1b', 48, 35, 31.49, '11/28/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('aconnor29', 25, 52, 86.55, '8/31/2021');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dblanshard2l', 96, 46, 65.0, '2/8/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('wtreanor2d', 100, 61, 71.38, '3/27/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ethulborn2q', 75, 37, 14.53, '9/25/2020');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dhessel5', 69, 47, 28.52, '6/7/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('gsivyer8', 80, 89, 78.92, '9/7/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('msharrock1s', 24, 37, 74.82, '10/21/2017');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jgoaley1x', 43, 20, 10.28, '6/10/2021');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('hstoile1u', 41, 46, 55.39, '10/13/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jizhak1l', '#39b8a8', 95, 94.0, '6/14/2021');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('gison12', 53, 80, 9.45, '3/5/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('pcleverly17', 84, 34, 12.32, '6/20/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('wbalderston2f', 1, 67, 5.96, '3/7/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fbonavia9', 56, 75, 83.03, '12/15/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('abonsale1z', 44, 41, 80.7, '8/21/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('tvogele1r', 91, 71, 86.42, '12/17/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dtimmons10', 90, 36, 90.63, '4/7/2017');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('abonsale1z', 11, 87, 52.74, '11/17/2017');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('mtwinning1y', 92, 91, 35.39, '12/26/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dculbard2k', '#6f6919', 58, 57.85, '2/2/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('plabbeyf', 27, 6, 23.19, '1/13/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('wjanes2g', 75, 41, 9.59, '3/25/2017');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('bdendlee', '#680471', 80, 72.92, '8/15/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jgoaley1x', 54, 19, 11.45, '1/17/2022');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jforesr', 36, 14, 4.59, '11/12/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('brew2c', 93, 30, 89.52, '5/24/2017');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dlinney28', '#a5b3c1', 7, 95.34, '2/1/2022');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dlinney28', 85, 94, 97.19, '6/1/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('pstriblingn', '#5752dc', 49, 37.77, '10/8/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ereichartzy', 87, 94, 13.32, '2/20/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('aenburyh', 24, 4, 99.05, '12/29/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jizhak1l', 49, 51, 35.3, '12/13/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('esedgman1q', 50, 28, 19.12, '11/23/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('patlee4', 33, 37, 36.47, '1/18/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swaren19', 19, 40, 3.88, '4/12/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ejindrakb', 94, 78, 78.41, '6/5/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('tskingley1m', 68, 36, 93.51, '3/21/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('pstriblingn', 31, 18, 5.64, '8/7/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('plabbeyf', 30, 45, 13.59, '5/20/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jgoaley1x', 79, 20, 41.52, '6/26/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('astear14', 68, 10, 50.12, '7/17/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('mtesauroj', '#70ff0d', 47, 9.2, '8/3/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vcritchleyd', 24, 94, 32.64, '6/5/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lbyrch2m', 45, 36, 96.46, '3/20/2014');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('rsallowayet', 23, 4, 53.28, '4/10/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dblanshard2l', 39, 90, 56.67, '6/27/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('tvogele1r', 19, 92, 24.83, '2/3/2022');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lbozworth0', 70, 48, 64.45, '4/14/2021');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fcommings1n', 60, 90, 60.04, '9/27/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dculbard2k', '#29961e', 60, 95.0, '9/1/2020');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('cgoricke22', 49, 50, 10.21, '12/26/2020');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jmacfadyen2b', 78, 43, 85.9, '11/21/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('sigo1d', 94, 98, 4.39, '10/4/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lchaunce2', 19, 1, 76.44, '10/6/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('mvelden1f', 13, 90, 63.34, '10/2/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('cgoricke22', 92, 21, 77.26, '5/23/2014');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('tkennefordu', 54, 6, 11.85, '3/13/2012');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('astear14', 95, 54, 79.4, '9/1/2020');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('abonsale1z', 80, 42, 50.4, '10/24/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dculbard2k', 69, 40, 0.56, '5/8/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jburkert1o', 27, 62, 12.75, '3/24/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lchaunce2', 40, 11, 69.57, '3/22/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('mcolcombs', 72, 81, 80.67, '8/16/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('tkennefordu', 27, 55, 82.56, '6/9/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vgarfield1w', 16, 77, 31.51, '7/29/2021');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ktytherton2n', 30, 5, 95.74, '5/15/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('cgoricke22', 74, 31, 24.6, '12/30/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('plabbeyf', 36, 98, 19.05, '11/15/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('cstainingw', '#777fa2', 13, 79.68, '4/11/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('plabbeyf', '#253ccc', 5, 25.31, '12/17/2014');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('bratiea', 3, 16, 94.45, '1/30/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dblanshard2l', 40, 74, 56.48, '3/12/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lbozworth0', '#fae6c1', 100, 44.23, '12/9/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('aconnor29', 8, 52, 81.43, '11/24/2010');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('squinsee3', 90, 56, 78.47, '2/19/2017');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fcommings1n', 68, 37, 98.77, '9/12/2020');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('patlee4', 3, 46, 81.62, '8/26/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dgotobed2i', 25, 79, 2.53, '8/30/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lbozworth0', 93, 58, 43.41, '8/30/2020');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('jgoaley1x', 68, 10, 82.2, '5/7/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('tskingley1m', 100, 71, 79.57, '11/23/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swaren19', 78, 19, 98.15, '4/23/2014');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dgotobed2i', 17, 24, 43.54, '5/28/2017');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dhessel5', '#39b8a8', 74, 57.63, '11/28/2018');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ethulborn2q', 31, 51, 6.09, '3/21/2013');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('wjanes2g', 39, 1, 29.64, '11/14/2020');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('pcleverly17', 100, 67, 43.77, '11/5/2019');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vpurkiss1b', 89, 59, 35.05, '2/3/2016');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lbozworth0', 54, 100, 54.24, '6/18/2014');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lbielefeldm', 88, 43, 95.73, '12/29/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('wlines25', 90, 70, 64.02, '3/13/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dculbard2k', 88, 64, 23.99, '1/6/2022');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('clarge13', 11, 61, 81.09, '10/18/2015');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('lbozworth0', 3, 54, 67.06, '5/24/2011');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('alargent1', 81, 95, 1.72, '10/29/2022');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ohearnaman18', 37, 17, 91.45, '10/19/2021');