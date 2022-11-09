-- DATABASE AND USER CREATION
create database floresColas;
use floresColas;
grant all privileges on floresColas.* to 'colas'@'%' identified by 'chisela';


create table floresColas.COLOR (
	code VARCHAR(7),
	name VARCHAR(20) NOT NULL,
	description VARCHAR(50),
    CONSTRAINT PK_COLOR PRIMARY KEY (code)
);

-- INSERT COLOR TABLE 
insert into floresColas.COLOR (code, name, description) values ('#253ccc', 'Green', 'Asteraceae'); 
insert into floresColas.COLOR (code, name, description) values ('#70ff0d', 'Turquoise', 'Iridaceae'); 
insert into floresColas.COLOR (code, name, description) values ('#680471', 'White', 'Convolvulaceae'); 
insert into floresColas.COLOR (code, name, description) values ('#777fa2', 'Khaki', 'Cucurbitaceae'); 
insert into floresColas.COLOR (code, name, description) values ('#39b8a8', 'Violet', 'Polypodiaceae'); 
insert into floresColas.COLOR (code, name, description) values ('#5752dc', 'Fuscia', 'Fabaceae'); 
insert into floresColas.COLOR (code, name, description) values ('#a5b3c1', 'Maroon', 'Asteraceae');
insert into floresColas.COLOR (code, name, description) values ('#29961e', 'Yellow', 'Chenopodiaceae'); 
insert into floresColas.COLOR (code, name, description) values ('#6f6919', 'Red', 'Rutaceae'); 
insert into floresColas.COLOR (code, name, description) values ('#fae6c1', 'Blue', 'Iridaceae'); 

create table floresColas.FLOWER (
	code INT,
	name VARCHAR(50) UNIQUE NOT NULL,
	description VARCHAR(50),
	price DECIMAL(4,2) NOT NULL,
	color_code VARCHAR(7),
    CONSTRAINT PK_FLOWER PRIMARY KEY (code),
    CONSTRAINT FK_FLOWER FOREIGN KEY (color_code) REFERENCES floresColas.COLOR (code) ON DELETE CASCADE
); 

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

-- AUTO INCREMENT FOR FLOWER CODE
ALTER TABLE floresColas.FLOWER MODIFY code INT AUTO_INCREMENT, AUTO_INCREMENT=101;

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

-- INSERT USERS TABLE 
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ioliasa', md5('ioliasa'), 'Inma', 'Olias', '1993-08-31', 'Female', true); -- 1 admin 0 no admin se guardará
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('fmessiter2e', '45b07bc69679ee05afc0abd0110306ac', 'Flossy', 'Messiter', '1993-08-31', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('swilstead2f', 'cdb8f62470d0a0be8d0737507d77cec9', 'Suzie', 'Wilstead', '1989-06-25', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gsivyer8', 'cbb564b47c3b482ef687f09ad5dc74bd', 'Heddie', 'Ferreli', '2008-04-14', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('gkellen2h', '8987658b6dd286e865333200f9cab268', 'Giulio', 'Kellen', '1981-08-27', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('mkinver2i', '15e2700b4118cad34b0537a7589c84e4', 'Mildrid', 'Kinver', '2005-10-22', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ethulborn2q', 'c0ea4f4e34a99fb51cd17dc1becafd50', 'Allayne', 'Steptow', '981-09-24', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('dbannon2k', 'b47f6ceb37c6007cf034b96320945230', 'Damita', 'Bannon', '1966-01-18', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('wfransewich2l', '5d9ba4db3cc16639d7c85d0576530679', 'Wilhelmine', 'Fransewich', '2001-06-11', 'Female', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('vcowitz2m', '50fba89e919036b36228450c81efe52d', 'Viv', 'Cowitz', '1945-08-17', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('wtreanor2d', '67183446d01aea3a829ebf9c973e5af1', 'Felike', 'Earle', '1974-06-13', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('dblanshard2l', '339360b3021a1440e6a30198d22d3aae', 'Chev', 'Cisson', '1927-09-07', 'Male', false);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('vpurkiss1b', '9c55e718b1f207181f13d0c041f86dc9', 'Daphne', 'Oleszczak', '1922-08-17', 'Female', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('ibrogioniz', '778026fd258727f8dd523be1e837dbfa', 'Gabriello', 'Egell', '2003-12-17', 'Male', true);
insert into floresColas.USERS (username, password, first_name, last_name, date_of_birth, genre, admin) values ('aconnor29', '808d9e40f25a093cc596a371a6d9f2ac', 'Gregorio', 'Weiner', '1944-10-30', 'Male', true);

create table floresColas.PURCHASE (
	username VARCHAR(50),
	flower_code INT,
	quantity INT NOT NULL,
	price DECIMAL(5,2) NOT NULL,
	date DATE,
    CONSTRAINT PK_PURCHASE PRIMARY KEY (username, flower_code, date),
    CONSTRAINT FK_PURCHASE FOREIGN KEY (username) REFERENCES floresColas.USERS (username) ON DELETE CASCADE,
    CONSTRAINT FK2_PURCHASE FOREIGN KEY (flower_code) REFERENCES floresColas.FLOWER (code) ON DELETE CASCADE
);
-- INSERT PURCHASE TABLE 
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('aconnor29', 76, 53, 91.86, '2019-03-29');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 95, 55, 93.43, '2011-11-12');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 65, 15, 10.79, '2022-07-15');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vpurkiss1b', 48, 35, 31.49, '2013-11-28');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('aconnor29', 25, 52, 86.55, '2021-08-31');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dblanshard2l', 96, 46, 65.0, '2018-02-08');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('wtreanor2d', 100, 61, 71.38, '2019-03-27');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ethulborn2q', 75, 37, 14.53, '2020-09-25');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fmessiter2e', 69, 47, 28.52, '2016-06-07');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('gsivyer8', 80, 89, 78.92, '2019-09-07');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 24, 37, 74.82, '2017-10-21');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 43, 20, 10.28, '2021-06-10');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('aconnor29', 41, 46, 55.39, '2018-10-13');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dblanshard2l', 3, 95, 94.0, '2021-06-14');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('gsivyer8', 53, 80, 9.45, '2011-03-05');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('gsivyer8', 84, 34, 12.32, '2016-03-20');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ethulborn2q', 1, 67, 5.96, '2016-03-07');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ethulborn2q', 56, 75, 83.03, '2012-12-15');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vpurkiss1b', 44, 41, 80.7, '2015-08-21');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vpurkiss1b', 91, 71, 86.42, '2015-12-17');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swilstead2f', 90, 36, 90.63, '2017-04-07');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('vpurkiss1b', 11, 87, 52.74, '2017-11-17');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 92, 91, 35.39, '2011-12-26');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 8, 58, 57.85, '2011-02-02');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 27, 6, 23.19, '2012-01-13');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fmessiter2e', 75, 41, 9.59, '2017-03-25');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fmessiter2e', 3, 80, 72.92, '2018-08-15');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 54, 19, 11.45, '2022-01-17');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fmessiter2e', 36, 14, 4.59, '2018-11-12');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('fmessiter2e', 93, 30, 89.52, '2017-05-24');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dbannon2k', 6, 7, 95.34, '2022-02-01');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dbannon2k', 85, 94, 97.19, '2012-06-01');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dbannon2k', 4, 49, 37.77, '2019-10-08');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dbannon2k', 87, 94, 13.32, '2019-02-20');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swilstead2f', 24, 4, 99.05, '2013-12-29');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dblanshard2l', 49, 51, 35.3, '2012-12-13');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swilstead2f', 50, 28, 19.12, '2011-11-23');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swilstead2f', 33, 37, 36.47, '2016-01-18');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 19, 40, 3.88, '2018-04-12');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 94, 78, 78.41, '2018-06-25');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 68, 36, 93.51, '2015-03-21');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dbannon2k', 31, 18, 5.64, '2015-08-07');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ibrogioniz', 30, 45, 13.59, '2016-05-20');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 79, 20, 41.52, '2016-06-26');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 68, 10, 50.12, '2013-07-18');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 2, 47, 9.2, '2012-08-03');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 24, 94, 32.64, '2012-06-05');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('ioliasa', 45, 36, 96.46, '2014-03-20');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swilstead2f', 23, 4, 53.28, '2012-04-10');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('dblanshard2l', 39, 90, 56.67, '2016-06-27');
insert into floresColas.PURCHASE (username, flower_code, quantity, price, date) values ('swilstead2f', 19, 92, 24.83, '2022-02-03');

