CREATE DATABASE talentroute;
USE talentroute;


CREATE TABLE opportunities(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    university VARCHAR(255),
    requirements TEXT,
    application_link VARCHAR(255)
);

CREATE TABLE talents(
    email VARCHAR(255) PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    sport VARCHAR(50),
    dob DATE,
    phone VARCHAR(20),
    highest_achievement TEXT,
    education_level VARCHAR(50)
);

CREATE TABLE wishlist(
    id INT AUTO_INCREMENT PRIMARY KEY,
    talent_email VARCHAR(255),
    opportunity_id INT,
    status ENUM( 'applied','interested','not interested') DEFAULT 'interested',
    FOREIGN KEY (talent_email) REFERENCES talents(email),
    FOREIGN KEY (opportunity_id) REFERENCES opportunities(id)

);

CREATE TABLE refferals(
    id INT AUTO_INCREMENT PRIMARY KEY,
    talent_email VARCHAR(255),
    referee_name VARCHAR(255),
    referee_email VARCHAR(255),
    referee_phone VARCHAR(20),
    relationship VARCHAR(255),
    description TEXT,
    FOREIGN KEY (talent_email) REFERENCES talents(email)
);

-- ============================================================
-- TALENTROUTE SEED DATA
-- Kenyan Athletes & Local/International Opportunities
-- ============================================================

-- ------------------------------------------------------------
-- OPPORTUNITIES (10 records)
-- ------------------------------------------------------------
INSERT INTO opportunities (title, description, location, university, requirements, application_link) VALUES
(
  'Athletics Scholarship – Middle Distance',
  'Full athletic scholarship for talented middle-distance runners (800m/1500m). Covers tuition, accommodation, and a monthly stipend. Athlete must compete for the university team in NCAA Division I.',
  'Lexington, Kentucky, USA',
  'University of Kentucky',
  'Minimum 1:46 for 800m or 3:38 for 1500m. KCSE mean grade C+. TOEFL score 80+. Age 18–24.',
  'https://ukathletics.com/scholarships/apply'
),
(
  'Football Academy Trial – Premier League Club',
  'Residential trial programme for promising Kenyan footballers. Successful candidates earn a 6-month development contract with the club academy.',
  'Manchester, United Kingdom',
  NULL,
  'Age 16–21. Recommended by a licensed coach. Video reel (min 5 minutes match footage). Valid passport.',
  'https://manchestercityacademy.com/global-trials'
),
(
  'Swimming Excellence Grant',
  'Partial grant covering 60% of tuition for competitive swimmers. Athletes train with the university squad and have access to Olympic-standard facilities.',
  'Johannesburg, South Africa',
  'University of Johannesburg',
  'Personal best 200m freestyle under 1:52 (male) or 2:05 (female). National-level competition record required.',
  'https://uj.ac.za/sport/swimming-grant'
),
(
  'Kenya National U-23 Basketball Camp',
  'Residential selection camp to identify players for the Kenya U-23 national basketball squad ahead of FIBA AfroBasket qualifiers.',
  'Nairobi, Kenya',
  NULL,
  'Kenyan citizen. Age 18–23. Playing in the Kenya Basketball Federation league or a recognised county team.',
  'https://kbf.co.ke/u23-camp-2026'
),
(
  'Rugby Sevens High Performance Programme',
  'Six-month high-performance training programme run by World Rugby and hosted at the Kasarani Sports Complex. Top performers are considered for the Shujaa squad.',
  'Nairobi, Kenya',
  NULL,
  'Age 18–28. Must have played at least one season in the Kenya Cup or county championship. Medical clearance required.',
  'https://kru.co.ke/hpp-apply'
),
(
  'Athletics Full Scholarship – Sprints & Hurdles',
  'Full ride covering tuition, room, board, and books for sprinters and hurdlers. Athletes compete in the Big 12 Conference.',
  'Austin, Texas, USA',
  'University of Texas at Austin',
  'Sub 10.30 (100m) or sub 49.5 (400m) or sub 13.50 (110m hurdles). KCSE C+ and above. SAT 1000+ or ACT 21+.',
  'https://texassports.com/scholarships/track'
),
(
  'Volleyball Development Scholarship',
  'Partial scholarship (50% tuition) for female volleyball players. Includes professional coaching and participation in the Turkish Women Volleyball League.',
  'Istanbul, Turkey',
  'Istanbul Technical University',
  'Minimum height 178 cm for outside hitters/opposites, 182 cm for middle blockers. National team or Super League club experience.',
  'https://itu.edu.tr/sports/volleyball-scholarship'
),
(
  'AFC Champions League Youth Academy Placement',
  'One-year placement at a top Asian football club academy for African youth talent identified through the AFC–CAF partnership programme.',
  'Doha, Qatar',
  NULL,
  'Age 15–19. CAF-affiliated federation nomination. Medical fitness certificate. At least 2 seasons in a structured league.',
  'https://the-afc.com/caf-partnership/apply'
),
(
  'Moi University Sports Bursary – Athletics',
  'Sports bursary covering 70% of tuition fees for student-athletes pursuing undergraduate degrees while competing at national level.',
  'Eldoret, Kenya',
  'Moi University',
  'KCSE mean grade C. Proof of national-level competition (NOCK registration). Must maintain 2.0 GPA or equivalent.',
  'https://mu.ac.ke/sports-bursary'
),
(
  'Strathmore University Basketball Scholarship',
  'Merit-based scholarship for talented basketball players joining the Strathmore Blades programme competing in the KBF Premier League.',
  'Nairobi, Kenya',
  'Strathmore University',
  'KCSE mean grade B-. Age 18–26. Letter of recommendation from current coach. Trial date mandatory.',
  'https://strathmore.edu/sport/basketball-scholarship'
);


-- ------------------------------------------------------------
-- TALENTS (10 Kenyan athletes)
-- ------------------------------------------------------------
INSERT INTO talents (email, fullname, sport, dob, phone, highest_achievement, education_level) VALUES
(
  'faith.wanjiru@gmail.com',
  'Faith Wanjiru Kamau',
  'Athletics',
  '2002-03-14',
  '+254712345678',
  'Gold medal – 1500m, Kenya Secondary Schools Games 2019; Personal best 4:02 (1500m)',
  'KCSE'
),
(
  'brian.otieno@gmail.com',
  'Brian Otieno Odhiambo',
  'Football',
  '2000-07-22',
  '+254723456789',
  'Top scorer – Kenya National U-20 Championship 2021; Signed with AFC Leopards youth team',
  'Diploma'
),
(
  'amina.hassan@gmail.com',
  'Amina Hassan Abdi',
  'Swimming',
  '2003-11-05',
  '+254734567890',
  'Bronze medal – East African Swimming Championships 2022 (200m freestyle); National record holder U-20',
  'KCSE'
),
(
  'kevin.mutua@gmail.com',
  'Kevin Mutua Kioko',
  'Basketball',
  '1999-09-18',
  '+254745678901',
  'MVP – Kenya Basketball Federation Premier League 2023; Selected for Kenya U-23 national team',
  'Undergraduate'
),
(
  'grace.chebet@gmail.com',
  'Grace Chebet Koech',
  'Athletics',
  '2001-01-30',
  '+254756789012',
  'Silver medal – African U-20 Athletics Championship 2021 (3000m steeplechase); Personal best 9:28',
  'Undergraduate'
),
(
  'daniel.waweru@gmail.com',
  'Daniel Waweru Ndung\'u',
  'Rugby',
  '1998-06-12',
  '+254767890123',
  'Kenya Cup winner with KCB Rugby 2022; Called up to Kenya Simbas training squad',
  'Undergraduate'
),
(
  'lynne.achieng@gmail.com',
  'Lynne Achieng Owino',
  'Volleyball',
  '2002-04-08',
  '+254778901234',
  'Best libero – Kenya Volleyball Federation Women\'s League 2023; Kenya U-21 national team member',
  'KCSE'
),
(
  'james.kipchoge@gmail.com',
  'James Kipchoge Ruto',
  'Athletics',
  '2000-12-25',
  '+254789012345',
  'Personal best 10.18 (100m); Bronze medal – East African Games 2022 (4x100m relay)',
  'Diploma'
),
(
  'stella.mwangi@gmail.com',
  'Stella Mwangi Kariuki',
  'Football',
  '2003-08-17',
  '+254790123456',
  'Top scorer – Kenya Women Premier League 2023 (18 goals); Vihiga Queens FC striker',
  'KCSE'
),
(
  'peter.langat@gmail.com',
  'Peter Langat Bett',
  'Athletics',
  '1997-02-03',
  '+254701234567',
  'Commonwealth Games 2022 finalist – 800m; Personal best 1:44.8; National senior champion 2021 & 2022',
  'Undergraduate'
);


-- ------------------------------------------------------------
-- WISHLIST (10 records – varied statuses)
-- ------------------------------------------------------------
INSERT INTO wishlist (talent_email, opportunity_id, status) VALUES
('peter.langat@gmail.com',      1,  'applied'),
('faith.wanjiru@gmail.com',     1,  'interested'),
('grace.chebet@gmail.com',      1,  'interested'),
('james.kipchoge@gmail.com',    6,  'applied'),
('brian.otieno@gmail.com',      2,  'applied'),
('stella.mwangi@gmail.com',     2,  'interested'),
('brian.otieno@gmail.com',      8,  'interested'),
('amina.hassan@gmail.com',      3,  'applied'),
('kevin.mutua@gmail.com',       4,  'applied'),
('kevin.mutua@gmail.com',       10, 'interested'),
('daniel.waweru@gmail.com',     5,  'applied'),
('lynne.achieng@gmail.com',     7,  'applied'),
('faith.wanjiru@gmail.com',     9,  'not interested'),
('grace.chebet@gmail.com',      9,  'applied'),
('peter.langat@gmail.com',      6,  'interested');


-- ------------------------------------------------------------
-- REFERRALS (10 records)
-- ------------------------------------------------------------
INSERT INTO refferals (talent_email, referee_name, referee_email, referee_phone, relationship, description) VALUES
(
  'peter.langat@gmail.com',
  'Coach Julius Koech',
  'julius.koech@athleticskenya.or.ke',
  '+254711000001',
  'Head Coach – Athletics Kenya',
  'Peter is one of the most disciplined athletes I have worked with in 15 years of coaching. His tactical awareness in the 800m is exceptional and he adapts quickly to high-altitude training blocks.'
),
(
  'faith.wanjiru@gmail.com',
  'Mary Muthoni',
  'mary.muthoni@kenyasecondaryschools.ac.ke',
  '+254711000002',
  'PE Teacher & Coach – Moi Girls High School Eldoret',
  'Faith demonstrated remarkable composure under pressure from Form 1. She holds the school record in both the 1500m and cross-country and leads training sessions with younger athletes voluntarily.'
),
(
  'brian.otieno@gmail.com',
  'Dennis Ouma',
  'dennis.ouma@afcleopards.co.ke',
  '+254711000003',
  'Youth Team Manager – AFC Leopards',
  'Brian is a natural goal-scorer with excellent positioning and finishing. He has represented the club with professionalism and I am confident he will thrive in an academy environment abroad.'
),
(
  'amina.hassan@gmail.com',
  'Coach Salim Abdalla',
  'salim.abdalla@swimmingkenya.co.ke',
  '+254711000004',
  'National Swimming Coach',
  'Amina\'s technique in freestyle events is the best I have seen at the junior level in East Africa. She is coachable, punctual, and pushes her lane-mates to higher standards every session.'
),
(
  'kevin.mutua@gmail.com',
  'Prof. James Ndeto',
  'j.ndeto@strathmore.edu',
  '+254711000005',
  'Head of Sports – Strathmore University',
  'Kevin has been the backbone of the Blades programme for two seasons. His leadership on and off the court and his academic discipline make him an ideal candidate for an international scholarship.'
),
(
  'grace.chebet@gmail.com',
  'Coach Rose Tuwei',
  'rose.tuwei@athleticskenya.or.ke',
  '+254711000006',
  'Steeplechase Specialist Coach – Athletics Kenya',
  'Grace has the rare combination of speed and endurance required for the steeplechase. She improved her personal best by 14 seconds in a single season, which speaks volumes about her work ethic.'
),
(
  'daniel.waweru@gmail.com',
  'Innocent Simiyu',
  'i.simiyu@kcbrugby.co.ke',
  '+254711000007',
  'Head Coach – KCB Rugby',
  'Daniel is a hard-working loose forward with excellent breakdown skills and strong leadership qualities. He captained the junior side and was instrumental in our Kenya Cup win last season.'
),
(
  'lynne.achieng@gmail.com',
  'Coach Hellen Otieno',
  'hellen.otieno@kvf.co.ke',
  '+254711000008',
  'Technical Director – Kenya Volleyball Federation',
  'Lynne is the best libero of her age group in the country. Her reading of the game, passing accuracy, and communication on the court are already at senior international level.'
),
(
  'james.kipchoge@gmail.com',
  'Mr. Samuel Kariuki',
  'samuel.kariuki@nyahururuac.ac.ke',
  '+254711000009',
  'Athletics Coach – Nyahururu Athletic Club',
  'James has the explosive start and drive phase technique needed to compete at the highest level in the 100m. He trains diligently and has improved his reaction time significantly over the past year.'
),
(
  'stella.mwangi@gmail.com',
  'Tabitha Wambui',
  'tabitha.wambui@vihigaqueens.co.ke',
  '+254711000010',
  'Team Manager – Vihiga Queens FC',
  'Stella\'s goal-scoring record speaks for itself. She combines pace, technical skill, and a clinical finish. She is the first player to arrive at training and the last to leave, every single day.'
);