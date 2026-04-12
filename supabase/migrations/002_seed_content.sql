-- 002_seed_content.sql
-- Pre-seeded learning modules, chunks, and quiz questions (status: live)
-- source_hash values match the current content files so sync skips regeneration.

-- ─── MODULES ────────────────────────────────────────────────────────────────

INSERT INTO modules (id, slug, title, description, source_filename, source_hash, chunk_count, is_active) VALUES
  ('00000000-0000-0000-0000-000000000001', 'who-we-are',           'YourGP — Who We Are',
   'Our why, core values, the YourGP Flywheel, and unique culture practices.',
   'YourGP - Who We Are.md',                   '084270b711fba66b', 5, true),
  ('00000000-0000-0000-0000-000000000002', 'values-outcome-matrix','YourGP — Values & Outcome Matrix',
   'How YourGP recognises contribution across Sailor, Mid-Shipman, Skipper, and Commander levels.',
   'YourGP - Values & Outcome Matrix.md',      '34824becb2c2eba4', 7, true),
  ('00000000-0000-0000-0000-000000000003', 'clarity-the-advantage','YourGP — Clarity (The Advantage)',
   'Six critical questions that define organisational clarity at YourGP, based on Lencioni''s The Advantage.',
   'YourGP - Clarity (The Advantage).md',      '071d769cadf1b336', 4, true),
  ('00000000-0000-0000-0000-000000000004', 'leadership',           'Leadership at YourGP',
   'The 5 C''s of leadership and 15 standards that apply to everyone regardless of role.',
   'Leadership at YourGP.md',                  'a08fb51fab3b3c8d', 6, true),
  ('00000000-0000-0000-0000-000000000005', 'goals-2025',           'Our Goals for 2025',
   'YourGP''s BHAG, strategic goals, key performance areas, and key results for 2025.',
   'Goals 2025.md',                            'f160c6de3fce3039', 3, true),
  ('00000000-0000-0000-0000-000000000006', 'org-chart',            'YourGP Organisational Chart',
   'Structure of clinic teams, support functions, and business team as of March 2026.',
   'Organisational Chart March 2026.md',       'ff0b944c8edf842f', 4, true);

-- ─── CHUNKS — who-we-are ────────────────────────────────────────────────────

INSERT INTO chunks (id, module_id, chunk_index, title, content_hash, content, is_active) VALUES
  ('00000001-0000-0000-0000-000000000001','00000000-0000-0000-0000-000000000001',0,
   'YourGP — Who We Are','67340143d48e9431',
   E'**Last updated**: Kenneth Lobo, 6th February 2025\n\n---\n\n## What Is This and Why Are We Doing It?\n\nKenny and John were inspired by the Ritz-Carlton Leadership Center''s Foundations of Our Brand and thought "why don''t we have one like that?" Here is our first draft. What do you think? Leave feedback!',
   true),
  ('00000001-0000-0000-0000-000000000002','00000000-0000-0000-0000-000000000001',1,
   'Foundations of YourGP','5088c498bdf53581',
   E'With a clear vision to meaningfully improve health outcomes and guided by the timeless principles of care and compassion, Doctors John and Mel Deery set out to provide quality healthcare through their first general practice in 2012.\n\n### Our Why\n**Love others as you love yourself**: We want to deliver the kind of care we''d want for our own families and loved ones.\n\n### Our Vision\nTo meaningfully improve health outcomes by offering healthcare that is caring, innovative, and consistently excellent.\n\n### Our Values\n#### 1. Care\nGenuine care for our patients, team members, and communities is at the heart of what we do.\n#### 2. Excellence\nWe give our very best every day, knowing there''s always more to learn and improve.\n#### 3. Kaizen (Continuous Improvement)\nWe believe failure is not a loss. It''s a win. We learn and adapt.',
   true),
  ('00000001-0000-0000-0000-000000000003','00000000-0000-0000-0000-000000000001',2,
   'The YourGP Flywheel','e6b79f48e5aa5fe9',
   E'A continuous cycle of improvement, where each action builds on the last, creating a powerful force that drives us towards exceptional healthcare.\n\nSteps: Retain and Attract the Right Clinicians → Invest in the Best Facilities and People → Create a Culture of Caring, Excellence, and Innovation → Grow Resources → Retain and Attract the Right Patients.\n\nThe best Doctor-Patient relationships are not by chance. They are the result of carefully choosing not only the right doctors but also the right patients.',
   true),
  ('00000001-0000-0000-0000-000000000004','00000000-0000-0000-0000-000000000001',3,
   'Unique Practices That Reflect Our Ethos','c5f2397dd1c22398',
   E'1. Celebrating Our People — Brag Book, Get to Know Everyone Wall, birthday cakes, monthly coach gatherings.\n2. Personal, Non-Corporate Culture — owners are practising doctors within the organisation.\n3. A Listening and Feedback-Rich Culture — inspired by *Thank You for the Feedback*.\n4. Hiring for Cultural and Values Fit — inspired by *Foolproof Hiring*.\n5. Structured 1-on-1 Coaching — we don''t manage, we coach.\n6. Goal Setting — OKR (Objectives & Key Results) framework inspired by John Doerr.\n7. Lean Thinking — PDSA (Plan-Do-Study-Act) framework, celebrate failures.\n8. Investing in Learning from the Best — Scaling Up, Good to Great, Radical Candour, and many others.',
   true),
  ('00000001-0000-0000-0000-000000000005','00000000-0000-0000-0000-000000000001',4,
   'How These Practices Strengthen Our Culture','b2f4903bed67481c',
   E'These unique practices, whether inspired by external frameworks or born from our own ethos, create a workplace where team members feel valued, celebrated, and empowered. Together, they reinforce our core values of Care, Excellence, and Kaizen.\n\nWe measure engagement using the world-renowned Gallup framework.\n\n**Our Journey has just begun.** We know we''re not perfect -- but we are committed. Committed to learning, growing, and improving.\n\n## Our Locations\nYourGP@Crace: 1/5 Baratta Street, Crace\nYourGP@Lyneham: 62 Brigalow Street, Lyneham\nYourGP@Denman: 1B Felstead Vista, Denman Prospect\nAll in Canberra, Australian Capital Territory.',
   true);

-- ─── CHUNKS — values-outcome-matrix ────────────────────────────────────────

INSERT INTO chunks (id, module_id, chunk_index, title, content_hash, content, is_active) VALUES
  ('00000002-0000-0000-0000-000000000001','00000000-0000-0000-0000-000000000002',0,
   'YourGP — Values & Outcome Matrix','7c0931ed00b87eab',
   E'**Note**: This document has been replaced with capability matrices for roles across YourGP. For all practical applications, the capability matrices must be used. This document serves as a foundation for the capability matrices and is recommended reading.\n\n**Last updated**: Kenneth Lobo, February 2025',
   true),
  ('00000002-0000-0000-0000-000000000002','00000000-0000-0000-0000-000000000002',1,
   'Why We Created the Values and Outcome Matrix','7ae2d3c6206cd02e',
   E'We believe that everyone should be recognised not just for their job title, but for how they contribute to the YourGP community (Patients, Doctors and Staff).\n\nIn many workplaces, two people with the same role are rewarded the same, even if one is just meeting expectations and another is leading, supporting others, and driving improvements.\n\n**That''s why we created the Values and Outcome Matrix** — it is totally disconnected from job titles.',
   true),
  ('00000002-0000-0000-0000-000000000003','00000000-0000-0000-0000-000000000002',2,
   'What Does This Mean?','c33517d6f9c2481e',
   E'- You can stay in the role you love and still grow, thrive, and be rewarded for your contributions\n- You don''t have to become a manager to "level up" — you can lead from wherever you are\n- This matrix helps clarify what growth looks like\n\n### Example\nA receptionist meeting all behaviours of a "Sailor" — steady, reliable, and focused.\nAnother receptionist taking initiative, mentoring others, and solving problems like a "Skipper".\n\n## Roles & Outcomes (Not Behaviours)\n### Sailor → Mid-Shipman → Skipper → Commander',
   true),
  ('00000002-0000-0000-0000-000000000004','00000000-0000-0000-0000-000000000002',3,
   'Why This Matters','42c5e53e81e2ae36',
   E'We want to make it clear that you don''t need to "outgrow" your role to keep progressing. You can stay in your role, build on your strengths, and still grow.\n\nThis approach also helps us have open conversations about recognition, growth, and even salary.\n\n**We''re committed to building a place where everyone can grow and be recognised for their impact — no matter what their job title says.**\n\n**YGP community** = Doctors, Patients and Staff',
   true),
  ('00000002-0000-0000-0000-000000000005','00000000-0000-0000-0000-000000000002',4,
   'Value: Care','31cdb81e51d2ee47',
   E'**Sailor**: The YourGP community is welcomed and acknowledged kindly; patients and GPs experience timely and empathetic support.\n**Mid-Shipman**: Teams enjoy strong, caring relationships; communication ensures team members feel valued.\n**Skipper**: Systems ensure consistent care experiences across the organisation; team and individual achievements are celebrated.\n**Commander**: Every major initiative supports the YourGP community experience; team culture reflects care, excellence, and kaizen; teams are cohesive (Lencioni).',
   true),
  ('00000002-0000-0000-0000-000000000006','00000000-0000-0000-0000-000000000002',5,
   'Value: Excellence','b896099e8d4a1220',
   E'**Sailor**: Processes are followed consistently; work outputs meet or exceed defined quality standards.\n**Mid-Shipman**: Operational processes are improved regularly; compliance/regulatory requirements are understood; teams experiment with innovative approaches.\n**Skipper**: Team roles are clearly defined; financial responsibilities are clear and achieved; quality & compliance frameworks are installed; skippers actively support other Skippers by providing feedback and addressing challenges collaboratively.\n**Commander**: Evidence of excellence in service quality; core values are installed in hiring, training, and management; adapting to feedback and driving innovation is DNA.',
   true),
  ('00000002-0000-0000-0000-000000000007','00000000-0000-0000-0000-000000000002',6,
   'Value: Kaizen (Continuous Improvement)','6a04f3369099b48b',
   E'**Sailor**: Small, incremental improvements are regularly suggested and trialled; feedback is given and received from peers and supervisors.\n**Mid-Shipman**: Sailors participate or lead defined improvement cycles (e.g. PDSA); vulnerability is modelled through openness to feedback and learning from mistakes; learning is ongoing, with best practices shared.\n**Skipper**: Skippers lead and support team-specific training to build independence and expertise.\n**Commander**: (See Excellence matrix for additional Commander-level outcomes.)',
   true);

-- ─── CHUNKS — clarity-the-advantage ────────────────────────────────────────

INSERT INTO chunks (id, module_id, chunk_index, title, content_hash, content, is_active) VALUES
  ('00000003-0000-0000-0000-000000000001','00000000-0000-0000-0000-000000000003',0,
   'YourGP — Clarity (The Advantage)','5ca2bc3132669666',
   E'Healthy organisations need to address six critical questions.\n\n## 1. Why Do We Exist?\nInspired by Jesus'' teaching to "love others as you love yourself," we exist to provide world-class healthcare services and facilities that empower GPs to deliver exceptional patient care.\nOur purpose: Meaningfully improve health outcomes.\n\n## 2. How Do We Behave?\nCaring: We tell the truth kindly, even when it''s uncomfortable.\nExcellence: We do what we say we''ll do — on time and to the highest standard.\nKaizen (Continuous Improvement): We experiment, learn fast, and improve daily.\n\n## 3. What Do We Do?\nWe build systems, teams, and environments that enable GPs to deliver world-class patient care efficiently and sustainably.\n\n## 5. What Is Most Important Right Now?\nCurrent Business Goal #1: Bring visibility and accountability to our operations by developing a YourGP Dashboard.\nCEO Goal #1: People doing purposeful work.',
   true),
  ('00000003-0000-0000-0000-000000000002','00000000-0000-0000-0000-000000000003',1,
   '4. How Will We Succeed?','73327232a251ab9b',
   E'### Our Strategic Pillars\n1. **Staff**: High engagement (Gallup >4.5); Highly trained (3% of time); Quiz scores.\n2. **GPs**: Highly engaged GPs (NPS >80); Hitting self-prescribed clinical goals.\n3. **Patients**: Highly engaged patients (NPS >80); Google average 4.8.\n4. **Outcomes**: Profit on patient fees of 6%; Growth of revenue 15% p.a.',
   true),
  ('00000003-0000-0000-0000-000000000003','00000000-0000-0000-0000-000000000003',2,
   '6. Who Must Do What?','cf0204568c1759b8',
   E'**GPs**: Provide clinical excellence and genuine care to patients.\n**Reception and Admin Teams**: Provide incredible service to the GPs and patients.\n**Nursing Team**: Provide incredible service to the GPs and patients.\n**Site Managers** (Bernie Simonsen, Jessica Hinchy, Shae Connors, Megan Wright): Ensure clinics run smoothly; build strong relationships with GPs.\n**Director of Innovation** (Kenneth Lobo): Develop systems and processes to make things better.\n**Director of Finance** (Aiden Chang): Develop systems for financial clarity and forecasting.\n**Chief Medical Officer** (Melian Deery): Support high standards of care; liaise between GPs and leadership.\n**CEO** (John Deery): Set and communicate vision; set strategy; drive alignment; get results.\n**Patients**: Treat us with Dignity and Respect.',
   true),
  ('00000003-0000-0000-0000-000000000004','00000000-0000-0000-0000-000000000003',3,
   'Checklist for Organisational Health','f41ced1893c48b33',
   E'Five disciplines for a healthy organisation (Patrick Lencioni, *The Advantage*):\n\n**Discipline 1: Build a Cohesive Leadership Team** — Small enough (3–10 people); members trust one another; productive unfiltered conflict; clear-cut agreements after meetings; mutual accountability.\n\n**Discipline 2: Create Clarity** — Shared passion for the reason the organisation exists; clarified behavioural values; clear strategy; clear current goal.\n\n**Discipline 3: Overcommunicate Clarity** — Six aspects of clarity communicated to all employees; employees can accurately articulate values, purpose, and goals.\n\n**Discipline 4: Reinforce Clarity** — Values-based hiring; thorough onboarding; simple goal-setting and progress review system; poor values fit managed out; compensation built around values.\n\n**Discipline 5: Tactical and Strategic Meetings** — Separate meetings for tactical and strategic discussions; agendas set after reviewing progress against goals; quarterly off-site reviews.',
   true);

-- ─── CHUNKS — leadership ────────────────────────────────────────────────────

INSERT INTO chunks (id, module_id, chunk_index, title, content_hash, content, is_active) VALUES
  ('00000004-0000-0000-0000-000000000001','00000000-0000-0000-0000-000000000004',0,
   'Leadership at YourGP','5b3fa861a083bc9d',
   E'**Competency · Coachability · Clarity · Courage · Character**\n\nEveryone at YourGP can be a leader. These standards apply regardless of your role or title.',
   true),
  ('00000004-0000-0000-0000-000000000002','00000000-0000-0000-0000-000000000004',1,
   'Purpose','1869817b5c242986',
   E'At YourGP, how you lead matters as much as what you achieve. This document defines the leadership standard built on the **5 C''s**: Competency, Coachability, Clarity, Courage, and Character.\n\nIt draws heavily on Andy Stanley''s *Next Generation Leader*, alongside Brené Brown, Simon Sinek, and Patrick Lencioni.\n\n**How to Use This Document**\n- When you join: Read the 5 C''s summary and scan the 15 standards\n- Before your review: Work through the Leadership Self-Assessment honestly\n- When something feels hard: Find the standard that fits\n- In team huddles: Use the Daily Standards Summary\n\nNobody is expected to be all of this perfectly. What we expect is honesty about where we are, a genuine commitment to getting better, and the willingness to have real conversations.',
   true),
  ('00000004-0000-0000-0000-000000000003','00000000-0000-0000-0000-000000000004',2,
   'The 5 C''s — At a Glance','d28019ab4762f84d',
   E'**Competency**: Play to your strengths, delegate your weaknesses, develop others.\n**Coachability**: The best leaders never stop learning — and they let others help them see what they cannot.\n**Clarity**: Be clear even when you are not certain — clarity is perceived as leadership.\n**Courage**: Move despite fear, decide despite uncertainty, challenge despite comfort.\n**Character**: The product of the other four — who you become when competency, coachability, clarity, and courage are lived consistently.',
   true),
  ('00000004-0000-0000-0000-000000000004','00000000-0000-0000-0000-000000000004',3,
   'Leadership Standards','0f085624623e0b57',
   E'The two best-kept secrets of leadership: the less you do, the more you accomplish; the less you do, the more you enable others.\n\nUnder Clarity, Standard 9 "Face current reality" lists: Thou shalt not — pretend, turn a blind eye, exaggerate, shoot the bearer of bad news, hide behind the numbers, ignore constructive criticism, or isolate yourself.\n\nUnder Courage, the distinction between Careful and Fearful: Careful (cerebral, calculates risk, aims for success); Fearful (emotional, avoids risk, aims to avoid failure). Courage is not the absence of fear — it is the ability to move despite it.\n\nCharacter: every leader wears two badges — one visible (position/title) and one invisible (moral authority). It takes years to build and one moment to damage.',
   true),
  ('00000004-0000-0000-0000-000000000005','00000000-0000-0000-0000-000000000004',4,
   'Daily Standards Summary','b61b84ed08693c80',
   E'For team huddles and quick reference — one standard per day, rotating through all 15:\n1. Own the whole job — and know where you shine\n2. Know the difference between authority and competency\n3. Grow the people around you\n4. Stay coachable — always\n5. Seek feedback like your leadership depends on it\n6. Measure yourself against your potential, not your peers\n7. Communicate with clarity and say the hard things early\n8. Look up and look ahead\n9. Face current reality\n10. Make the call\n11. Stay steady when things are hard\n12. Never accept that the current way is the only way\n13. Lead with honesty and integrity\n14. Make sure everyone belongs\n15. Be someone people can rely on',
   true),
  ('00000004-0000-0000-0000-000000000006','00000000-0000-0000-0000-000000000004',5,
   'Sources','b9939a7185d82bee',
   E'- Andy Stanley — *Next Generation Leader*\n- Brené Brown — *Dare to Lead*\n- Simon Sinek — *Leaders Eat Last*\n- Patrick Lencioni — *The Five Dysfunctions of a Team*\n- Ken Blanchard — *The One Minute Manager*\n- Coach K (Mike Krzyzewski) — *Leading with the Heart*\n- Marcus Buckingham — *Now, Discover Your Strengths*\n\nLast updated: John Deery, 18th March 2026',
   true);

-- ─── CHUNKS — goals-2025 ────────────────────────────────────────────────────

INSERT INTO chunks (id, module_id, chunk_index, title, content_hash, content, is_active) VALUES
  ('00000005-0000-0000-0000-000000000001','00000000-0000-0000-0000-000000000005',0,
   'OUR GOALS FOR 2025','5c63744c1c291023',
   E'**Dr. John Deery**\n\n**YourGP Flywheel**: Invest in the Best Facilities & People → Retain & Attract the Right Clinicians → Grow Resources → Create a Culture of Caring, Excellence & Innovation → Retain & Attract the Right Patients.\n\n**Strategic Goals for 2025**:\n1. Fully developed GP pipeline\n2. Highly engaged staff & GPs\n3. Increase sustainability to 6% on patient fees\n4. Develop bench strength & future facilities\n\n**OUR BHAG**: Meaningfully impact health outcomes for all Australia',
   true),
  ('00000005-0000-0000-0000-000000000002','00000000-0000-0000-0000-000000000005',1,
   'Key Performance Areas','685fd3f42b47b0e7',
   E'**STAFF**: #One-on-Ones; Gallup Q12 Scores >4.5; Highly trained\n**DOCTORS**: Raving GPs NPS > 80\n**PATIENTS**: Raving Patients NPS>85; Google review: >4.8 Stars\n**OUTCOMES**: Clinical Goals Improvement projects\n**SUSTAINABILITY**: 6% profit on patient fees; 15% growth in revenue/profitability',
   true),
  ('00000005-0000-0000-0000-000000000003','00000000-0000-0000-0000-000000000005',2,
   'Key Results','bc3eb1357af9f9df',
   E'1. 10 new GPs joining us\n2. Working funnel that attracts future GPs\n3. 100% occupancy of consult rooms\n4. Identify our next 2 practices\n5. Train our next 2 practice managers\n6. Staff know they are winning (e.g. Job scorecards)\n7. Develop ownership mindset\n8. High-performing coaching team\n9. Crace GPs are highly engaged\n10. Staff training system is developed\n11. Complete accountability and visibility of our operations\n12. Staff Gallup >4.5\n13. Raving GPs, NPS >80\n14. Raving Patients, NPS>85',
   true);

-- ─── CHUNKS — org-chart ─────────────────────────────────────────────────────

INSERT INTO chunks (id, module_id, chunk_index, title, content_hash, content, is_active) VALUES
  ('00000006-0000-0000-0000-000000000001','00000000-0000-0000-0000-000000000006',0,
   'YourGP Organisational Chart','f86091b630f58be0',
   E'**Updated**: 5th March 2026\n\n## Overview\nPatients are at the centre. Three pillars serve them:\n- **Doctors [48]**: Independent Medical Practitioners & Registrars\n- **General Practices**: Clinics x 3, Staff x 24, Nurses x 8\n- **Business Team [5]**: Chief Executive Coach, Chief Medical Coach',
   true),
  ('00000006-0000-0000-0000-000000000002','00000000-0000-0000-0000-000000000006',1,
   'Clinic Teams','144a7a06752b7527',
   E'**YourGP@Crace** — in service of Patients: Site Manager, Crace Reception Team, Head Nurse (Nurses, Health Support Officer).\n**YourGP@Denman Prospect** — in service of Patients: Site Manager, Assistant Site Manager, Denman Reception Team, Head Nurse (Nurses).\n**YourGP@Lyneham** — in service of Patients: Site Manager, Lyneham Reception Team, Head Nurse (Nurses).',
   true),
  ('00000006-0000-0000-0000-000000000003','00000000-0000-0000-0000-000000000006',2,
   'Support Functions','d731befc7a672215',
   E'**Coaching Team** — in service of Doctors: Chief Executive Coach, Chief Medical Coach.\n**Practice Support Team** — in service of Clinic Teams: Practice Support Coach, Practice Support Staff (Malaysia).\n**Business Team** — in service of Clinic Teams: Head of Finance, Head of Projects & Digital Innovation.',
   true),
  ('00000006-0000-0000-0000-000000000004','00000000-0000-0000-0000-000000000006',3,
   'Structure','b50aed4050bbe3b4',
   E'- **Doctors**: Independent Medical Practitioners & Registrars\n- **Clinic Staff**: Reception teams, Nurses, Health Support Officers\n- **Leadership**: Coaches (Executive, Medical), Site Managers\n- **Business**: Finance, Projects & Digital Innovation\n\n**Total**: 48 Doctors, 24 Staff, 8 Nurses, 5 Business Team\n\n**Contact for feedback**: Kenneth Lobo & Atif Wan\n**Last updated**: 5th March 2026',
   true);

-- ─── QUESTIONS — who-we-are ─────────────────────────────────────────────────

INSERT INTO questions (chunk_id, question_text, question_type, options, correct_index, explanation, status) VALUES

-- chunk 0: intro / What Is This
('00000001-0000-0000-0000-000000000001',
 'What inspired Kenny and John to create the "Who We Are" document?',
 'mcq', '["A Harvard Business School case study","The Ritz-Carlton Leadership Center''s Foundations of Our Brand","A recommendation from their HR consultant","A competitor''s staff handbook"]',
 1, 'The document opens by stating it was inspired by the Ritz-Carlton Leadership Center''s Foundations of Our Brand.', 'live'),

('00000001-0000-0000-0000-000000000001',
 'Who last updated the "Who We Are" document and when?',
 'mcq', '["John Deery, January 2025","Melian Deery, March 2025","Kenneth Lobo, 6th February 2025","Aiden Chang, February 2025"]',
 2, 'The document states it was last updated by Kenneth Lobo on 6th February 2025.', 'live'),

('00000001-0000-0000-0000-000000000001',
 'What does the "Who We Are" document invite readers to do?',
 'mcq', '["Email the CEO with suggestions","Leave feedback on the document","Raise concerns with the HR team","Submit suggestions at the next team meeting"]',
 1, 'The document asks "What do you think? Leave feedback!" after presenting the first draft.', 'live'),

-- chunk 1: Foundations
('00000001-0000-0000-0000-000000000002',
 'When did Doctors John and Mel Deery open their first general practice?',
 'mcq', '["2008","2010","2012","2015"]',
 2, 'The document states they set out to provide quality healthcare through their first general practice in 2012.', 'live'),

('00000001-0000-0000-0000-000000000002',
 'What is YourGP''s "Our Why" statement?',
 'mcq', '["Excellence in every encounter","Love others as you love yourself","Healthier communities through innovation","Care, compassion, and continuous improvement"]',
 1, '"Our Why" is "Love others as you love yourself" — delivering the kind of care we''d want for our own families.', 'live'),

('00000001-0000-0000-0000-000000000002',
 'Which of the following is NOT one of YourGP''s three core values?',
 'mcq', '["Care","Integrity","Excellence","Kaizen"]',
 1, 'YourGP''s three core values are Care, Excellence, and Kaizen (Continuous Improvement). Integrity is not listed.', 'live'),

-- chunk 2: Flywheel
('00000001-0000-0000-0000-000000000003',
 'What does the YourGP Flywheel describe?',
 'mcq', '["A process for recruiting new patients","A continuous cycle of improvement where each action builds on the last","A financial model for practice growth","A staff performance review framework"]',
 1, 'The flywheel is "a continuous cycle of improvement, where each action builds on the last."', 'live'),

('00000001-0000-0000-0000-000000000003',
 'Which step in the YourGP Flywheel comes directly after "Retain and Attract the Right Clinicians"?',
 'mcq', '["Grow Resources","Create a Culture of Caring, Excellence, and Innovation","Invest in the Best Facilities and People","Retain and Attract the Right Patients"]',
 2, 'In the flywheel diagram: Retain and Attract the Right Clinicians → Invest in the Best Facilities and People.', 'live'),

('00000001-0000-0000-0000-000000000003',
 'According to the Flywheel, what is described as "not by chance"?',
 'mcq', '["Staff engagement scores","Practice revenue growth","The best Doctor-Patient relationships","Clinical quality standards"]',
 2, '"The best Doctor-Patient relationships are not by chance. They are the result of carefully choosing not only the right doctors but also the right patients."', 'live'),

-- chunk 3: Unique Practices
('00000001-0000-0000-0000-000000000004',
 'What is the "Brag Book" at YourGP?',
 'mcq', '["A record of patient testimonials displayed in waiting rooms","An online space where team members share thanks and recognition for each other","A display of awards won by the practice","A social media account for highlighting team achievements"]',
 1, 'The Brag Book is described as "an online space where team members share thanks and recognition for each other''s contributions."', 'live'),

('00000001-0000-0000-0000-000000000004',
 'Which goal-setting framework does YourGP use?',
 'mcq', '["KPI dashboards","Balanced Scorecard","OKR (Objectives & Key Results)","SMART goals"]',
 2, 'YourGP uses the OKR framework inspired by John Doerr, setting goals that are aligned, transparent, and accountable.', 'live'),

('00000001-0000-0000-0000-000000000004',
 'How does YourGP describe its management approach with team members?',
 'mcq', '["We manage — we set clear targets and measure results","We coach — managers invest in regular, structured 1-on-1 meetings","We delegate — team members set their own goals","We lead — managers direct daily operations closely"]',
 1, '"We don''t manage — we coach. Managers, or ''coaches,'' invest in regular, structured 1-on-1 meetings with their teams."', 'live'),

-- chunk 4: How These Practices Strengthen Our Culture
('00000001-0000-0000-0000-000000000005',
 'Which three core values do YourGP''s unique practices reinforce?',
 'mcq', '["Trust, Accountability, and Excellence","Care, Excellence, and Kaizen","Innovation, Care, and Integrity","Teamwork, Transparency, and Kaizen"]',
 1, 'The document states these practices reinforce the core values of Care, Excellence, and Kaizen.', 'live'),

('00000001-0000-0000-0000-000000000005',
 'Which framework does YourGP use to measure employee engagement?',
 'mcq', '["Net Promoter Score (NPS)","Myers-Briggs Type Indicator","Gallup Q12 framework","Balanced Scorecard"]',
 2, 'YourGP measures engagement using "the world-renowned Gallup framework."', 'live'),

('00000001-0000-0000-0000-000000000005',
 'What does YourGP acknowledge about its current state?',
 'mcq', '["That it will expand to five locations soon","That perfection has been achieved","That they are not perfect but are committed to learning and improving","That staff bonuses will be linked to Gallup scores"]',
 2, '"We know we''re not perfect — but we are committed. Committed to learning, growing, and improving."', 'live'),

-- ─── QUESTIONS — values-outcome-matrix ──────────────────────────────────────

-- chunk 0: intro / note
('00000002-0000-0000-0000-000000000001',
 'What replaced the Values and Outcome Matrix for day-to-day practical use?',
 'mcq', '["The OKR Framework","Capability matrices for roles","Gallup Q12 assessments","Job scorecards"]',
 1, 'The document notes it has been replaced by capability matrices for roles across YourGP.', 'live'),

('00000002-0000-0000-0000-000000000001',
 'What is the relationship between this document and the capability matrices?',
 'mcq', '["They are completely independent tools","This document is a foundation for the capability matrices and is recommended reading","This document supersedes the capability matrices","They serve the same purpose and can be used interchangeably"]',
 1, 'The document "serves as a foundation for the capability matrices and is recommended reading."', 'live'),

('00000002-0000-0000-0000-000000000001',
 'Who last updated the Values and Outcome Matrix document?',
 'mcq', '["John Deery","Melian Deery","Kenneth Lobo","Aiden Chang"]',
 2, 'The document was last updated by Kenneth Lobo in February 2025.', 'live'),

-- chunk 1: Why We Created
('00000002-0000-0000-0000-000000000002',
 'What problem was the Values and Outcome Matrix created to address?',
 'mcq', '["Staff were being promoted too quickly","Two people in the same role were rewarded equally regardless of their contribution level","Job titles were unclear across sites","Training was inconsistent across locations"]',
 1, 'In many workplaces, two people in the same role are rewarded equally even when one is leading, supporting others, and driving improvements.', 'live'),

('00000002-0000-0000-0000-000000000002',
 'What is a defining feature of the Values and Outcome Matrix?',
 'mcq', '["It is tied directly to job titles","It is totally disconnected from job titles","It only applies to senior staff","It replaces annual performance reviews"]',
 1, 'The matrix "is totally disconnected from job titles," allowing people to grow and be recognised regardless of their role.', 'live'),

('00000002-0000-0000-0000-000000000002',
 'Which level describes someone who is "steady, reliable, and focused" in their role?',
 'mcq', '["Skipper","Commander","Sailor","Mid-Shipman"]',
 2, 'The document uses a receptionist at "Sailor" level to illustrate someone meeting expectations — steady, reliable, and focused.', 'live'),

-- chunk 2: What Does This Mean
('00000002-0000-0000-0000-000000000003',
 'What does the Values and Outcome Matrix allow team members to do?',
 'mcq', '["Stay in their role and still grow, thrive, and be rewarded","Skip management approval for pay rises","Self-assess against clinical standards","Apply for any role regardless of experience"]',
 0, '"You can stay in the role you love and still grow, thrive, and be rewarded for your contributions."', 'live'),

('00000002-0000-0000-0000-000000000003',
 'A receptionist who mentors others and proactively solves problems would be at which level?',
 'mcq', '["Sailor","Commander","Skipper","Mid-Shipman"]',
 2, 'The document explicitly uses this scenario to describe Skipper-level behaviour.', 'live'),

('00000002-0000-0000-0000-000000000003',
 'What does the matrix make it easier to discuss openly?',
 'mcq', '["Clinical performance and patient outcomes","Recognition, growth, and salary","Holiday entitlements and shift swaps","Recruitment decisions"]',
 1, '"This approach also helps us have open conversations about recognition, growth, and even salary."', 'live'),

-- chunk 3: Why This Matters
('00000002-0000-0000-0000-000000000004',
 'Must team members leave their current role to keep progressing at YourGP?',
 'mcq', '["Yes, progression always requires a role change","Yes, but only after completing two years in role","No — they can build on their strengths and still grow","Only if they want a salary increase"]',
 2, '"You don''t need to ''outgrow'' your role to keep progressing. You can stay in your role, build on your strengths, and still grow."', 'live'),

('00000002-0000-0000-0000-000000000004',
 'What does "YGP community" refer to?',
 'mcq', '["Patients only","Staff and management only","Doctors, Patients, and Staff","The surrounding Canberra community"]',
 2, 'The document defines "YGP community = Doctors, Patients and Staff."', 'live'),

('00000002-0000-0000-0000-000000000004',
 'What is YourGP committed to building according to the "Why This Matters" section?',
 'mcq', '["A place where everyone is promoted within two years","A place where everyone can grow and be recognised for their impact regardless of job title","A place where salaries are linked exclusively to job title","A place where all staff progress to management roles"]',
 1, '"We''re committed to building a place where everyone can grow and be recognised for their impact — no matter what their job title says."', 'live'),

-- chunk 4: Care
('00000002-0000-0000-0000-000000000005',
 'What does a Sailor demonstrate for the Care value?',
 'mcq', '["Mentoring new staff on care practices","Driving strategic improvements to care systems","The YourGP community is welcomed and acknowledged kindly","Installing feedback systems for teams"]',
 2, 'Sailor level Care: "The YourGP community is welcomed and acknowledged kindly" and patients/GPs experience timely, empathetic support.', 'live'),

('00000002-0000-0000-0000-000000000005',
 'At Skipper level for the Care value, what systems must be in place?',
 'mcq', '["Social media monitoring tools","Systems ensuring consistent and reliable care experiences across the organisation","Automated patient feedback forms","Rostering systems for nurses"]',
 1, 'Skipper level Care requires "systems in place to ensure consistent and reliable care experiences across the organisation."', 'live'),

('00000002-0000-0000-0000-000000000005',
 'At Commander level for Care, what should team culture reflect?',
 'mcq', '["Efficiency and cost reduction","Care, excellence, and kaizen","Clinical governance and compliance","Patient volume and throughput"]',
 1, 'Commander level Care requires team culture to reflect "care, excellence, and kaizen."', 'live'),

-- chunk 5: Excellence
('00000002-0000-0000-0000-000000000006',
 'What is expected at Sailor level for the Excellence value?',
 'mcq', '["Leading complex improvement cycles","Coaching teams on performance expectations","Processes followed consistently and outputs meeting quality standards","Setting financial responsibilities for the team"]',
 2, 'Sailor-level Excellence: "Processes are followed consistently" and "work outputs meet or exceed defined quality standards."', 'live'),

('00000002-0000-0000-0000-000000000006',
 'What does Excellence at Skipper level require regarding team roles?',
 'mcq', '["Team members self-select their responsibilities","Team roles are clearly defined","Roles rotate every three months","Roles are determined by clinical staff"]',
 1, 'Skipper level Excellence: "Team roles are clearly defined."', 'live'),

('00000002-0000-0000-0000-000000000006',
 'What unique expectation do Skippers have regarding other Skippers?',
 'mcq', '["They compete for the same outcomes","They avoid interfering in each other''s areas","They actively support other Skippers by providing feedback and addressing challenges collaboratively","They report directly to the CEO"]',
 2, '"Skippers actively support other Skippers by providing feedback and assisting in addressing challenges collaboratively."', 'live'),

-- chunk 6: Kaizen
('00000002-0000-0000-0000-000000000007',
 'What is a Sailor expected to do for the Kaizen value?',
 'mcq', '["Lead organisation-wide improvement projects","Suggest and trial small incremental improvements and give/receive feedback","Design feedback systems for teams","Manage PDSA cycles independently"]',
 1, 'Sailor Kaizen: "Small, incremental improvements are regularly suggested and trialled" and feedback is given and received.', 'live'),

('00000002-0000-0000-0000-000000000007',
 'What improvement framework are Mid-Shipmen expected to participate in or lead?',
 'mcq', '["ISO 9001 audits","Six Sigma certification","PDSA (Plan-Do-Study-Act) cycles","Agile sprint reviews"]',
 2, 'Mid-Shipman Kaizen: "Sailors participate or lead defined improvement cycles (e.g. PDSA)."', 'live'),

('00000002-0000-0000-0000-000000000007',
 'What does Mid-Shipman level Kaizen require leaders to model?',
 'mcq', '["Strict adherence to existing procedures","Vulnerability through openness to feedback and learning from mistakes","Achieving perfect first-time results","Quarterly financial discipline"]',
 1, '"Vulnerability is modelled through openness to feedback and learning from mistakes."', 'live'),

-- ─── QUESTIONS — clarity-the-advantage ──────────────────────────────────────

-- chunk 0: sections 1-3 + 5
('00000003-0000-0000-0000-000000000001',
 'What teaching inspired YourGP''s reason for existence?',
 'mcq', '["''Do unto others as you would have them do unto you'' — Confucius","''Love others as you love yourself'' — inspired by Jesus'' teaching","''First, do no harm'' — Hippocrates","''Excellence is a habit'' — Aristotle"]',
 1, 'YourGP''s purpose is inspired by Jesus'' teaching to "love others as you love yourself."', 'live'),

('00000003-0000-0000-0000-000000000001',
 'Which of the following is one of YourGP''s three core behavioural values in the Clarity document?',
 'mcq', '["Innovation","Transparency","Kaizen (Continuous Improvement)","Sustainability"]',
 2, 'The three core values are Caring, Excellence, and Kaizen (Continuous Improvement).', 'live'),

('00000003-0000-0000-0000-000000000001',
 'What does YourGP do according to "3. What Do We Do?"',
 'mcq', '["Run hospital wards and emergency services","Build systems, teams, and environments that enable GPs to deliver world-class patient care","Provide telehealth services nationally","Employ GPs as salaried staff"]',
 1, '"We build systems, teams, and environments that enable GPs to deliver world-class patient care efficiently and sustainably."', 'live'),

-- chunk 1: How Will We Succeed
('00000003-0000-0000-0000-000000000002',
 'What Gallup engagement score do the strategic pillars target for staff?',
 'mcq', '[">3.5",">4.0",">4.5",">5.0"]',
 2, 'The Staff pillar specifies "High engagement (Gallup >4.5)."', 'live'),

('00000003-0000-0000-0000-000000000002',
 'What percentage of their time should staff dedicate to training?',
 'mcq', '["1%","2%","3%","5%"]',
 2, 'The Staff pillar specifies "Highly trained (3% of time)."', 'live'),

('00000003-0000-0000-0000-000000000002',
 'What annual revenue growth target is set in the Outcomes pillar?',
 'mcq', '["5% p.a.","10% p.a.","15% p.a.","20% p.a."]',
 2, 'The Outcomes pillar targets "Growth of revenue 15% p.a."', 'live'),

-- chunk 2: Who Must Do What
('00000003-0000-0000-0000-000000000003',
 'Who holds the role of Director of Innovation at YourGP?',
 'mcq', '["John Deery","Melian Deery","Aiden Chang","Kenneth Lobo"]',
 3, 'Kenneth Lobo is the Director of Innovation, responsible for developing systems and processes.', 'live'),

('00000003-0000-0000-0000-000000000003',
 'What is the CEO''s primary responsibility according to the Clarity document?',
 'mcq', '["Day-to-day clinic operations","Set vision, set strategy, drive alignment, and get results","Manage GP contracts and billing","Oversee all nursing staff"]',
 1, 'John Deery (CEO): Set and communicate the vision, Set Strategy, Drive alignment, Get Results.', 'live'),

('00000003-0000-0000-0000-000000000003',
 'How are patients expected to engage with YourGP according to "Who Must Do What?"',
 'mcq', '["Provide detailed Google reviews","Treat staff with Dignity and Respect","Complete all follow-up appointments","Pay accounts within 14 days"]',
 1, 'The document simply states patients should "Treat us with Dignity and Respect."', 'live'),

-- chunk 3: Checklist
('00000003-0000-0000-0000-000000000004',
 'How many disciplines are in the Checklist for Organisational Health?',
 'mcq', '["3","4","5","6"]',
 2, 'The checklist covers 5 disciplines: Build a Cohesive Leadership Team, Create Clarity, Overcommunicate Clarity, Reinforce Clarity, and Tactical and Strategic Meetings.', 'live'),

('00000003-0000-0000-0000-000000000004',
 'What size should the leadership team be to remain effective, per Discipline 1?',
 'mcq', '["2–5 people","3–10 people","5–15 people","Any size with clear hierarchy"]',
 1, '"The leadership team is small enough (three to ten people) to be effective."', 'live'),

('00000003-0000-0000-0000-000000000004',
 'What does Discipline 5 require regarding tactical and strategic discussions?',
 'mcq', '["Combine them in one weekly meeting","Handle them by email only","Address them in separate meetings","Alternate them monthly"]',
 2, '"Tactical and strategic discussions are addressed in separate meetings."', 'live'),

-- ─── QUESTIONS — leadership ──────────────────────────────────────────────────

-- chunk 0: intro tagline
('00000004-0000-0000-0000-000000000001',
 'What are the 5 C''s of leadership at YourGP?',
 'mcq', '["Communication, Collaboration, Creativity, Consistency, Character","Competency, Coachability, Clarity, Courage, Character","Care, Courage, Clarity, Competence, Culture","Commitment, Confidence, Clarity, Character, Cooperation"]',
 1, 'The 5 C''s are Competency, Coachability, Clarity, Courage, and Character.', 'live'),

('00000004-0000-0000-0000-000000000001',
 'Who can be a leader at YourGP?',
 'mcq', '["Only those with manager or above titles","Only clinical staff","Everyone, regardless of role or title","Those who have completed the leadership programme"]',
 2, '"Everyone at YourGP can be a leader. These standards apply regardless of your role or title."', 'live'),

('00000004-0000-0000-0000-000000000001',
 'When do YourGP''s leadership standards apply?',
 'mcq', '["Only for staff at Skipper level or above","Only for those with direct reports","Regardless of role or title — they apply to everyone","Only during leadership development programmes"]',
 2, '"These standards apply regardless of your role or title."', 'live'),

-- chunk 1: Purpose
('00000004-0000-0000-0000-000000000002',
 'Which book is the leadership document primarily drawn from?',
 'mcq', '["Simon Sinek''s ''Leaders Eat Last''","Patrick Lencioni''s ''The Five Dysfunctions of a Team''","Andy Stanley''s ''Next Generation Leader''","Brené Brown''s ''Dare to Lead''"]',
 2, 'The document "draws heavily on Andy Stanley''s Next Generation Leader."', 'live'),

('00000004-0000-0000-0000-000000000002',
 'What is explicitly stated is NOT expected of everyone regarding the leadership standards?',
 'mcq', '["Reading the 5 C''s summary","Being perfectly all of this","Attending a leadership workshop","Completing the self-assessment before reviews"]',
 1, '"Nobody is expected to be all of this perfectly. What we expect is honesty about where we are."', 'live'),

('00000004-0000-0000-0000-000000000002',
 'When should you use the Leadership Self-Assessment?',
 'mcq', '["Only during formal performance reviews","Whenever there is a leadership dispute","Before your review, working through it honestly","Once per year at the end of the financial year"]',
 2, 'The document suggests using the self-assessment specifically "Before your review: Work through the Leadership Self-Assessment honestly."', 'live'),

-- chunk 2: 5 C's At a Glance
('00000004-0000-0000-0000-000000000003',
 'How is "Character" described in the 5 C''s summary?',
 'mcq', '["The foundation of leadership — your personal ethics","The product of the other four Cs when lived consistently","The most important of the five Cs","A trait you either have or don''t have"]',
 1, 'Character is "the product of the other four — who you become when competency, coachability, clarity, and courage are lived consistently."', 'live'),

('00000004-0000-0000-0000-000000000003',
 'What is the one-sentence summary for "Clarity" in the 5 C''s?',
 'mcq', '["''Lead with honesty even in difficult times''","''Understand the vision and share it with others''","''Be clear even when you are not certain — clarity is perceived as leadership''","''Communicate decisions quickly and consistently''"]',
 2, 'The exact one-sentence summary is "Be clear even when you are not certain — clarity is perceived as leadership."', 'live'),

('00000004-0000-0000-0000-000000000003',
 'How is "Coachability" summarised in the 5 C''s?',
 'mcq', '["''Accept feedback gracefully and move on''","''The best leaders never stop learning — and they let others help them see what they cannot''","''Always seek the counsel of those more experienced''","''Demonstrate humility in every interaction''"]',
 1, '"The best leaders never stop learning — and they let others help them see what they cannot."', 'live'),

-- chunk 3: Leadership Standards
('00000004-0000-0000-0000-000000000004',
 'What are described as "the two best-kept secrets of leadership" under Competency?',
 'mcq', '["Hire slow, fire fast; and always have a plan B","The less you do the more you accomplish; and the less you do the more you enable others","Delegate everything; and measure results not effort","Lead by example; and never ask others to do what you won''t do yourself"]',
 1, '"The two best-kept secrets of leadership: the less you do, the more you accomplish; the less you do, the more you enable others to accomplish."', 'live'),

('00000004-0000-0000-0000-000000000004',
 'What is the distinction between "Careful" and "Fearful" under the Courage standard?',
 'mcq', '["Careful leaders are slow; Fearful leaders are fast","Careful: calculates risk, aims for success; Fearful: avoids risk, aims to avoid failure","Careful leaders consult others; Fearful leaders decide alone","There is no meaningful distinction — both are poor leadership"]',
 1, 'Careful: cerebral, calculates risk, aims for success. Fearful: emotional, avoids risk, aims to avoid failure.', 'live'),

('00000004-0000-0000-0000-000000000004',
 'What does Standard 9 "Face current reality" list as things a leader must never do?',
 'mcq', '["Hire without references or fire without process","Pretend, turn a blind eye, exaggerate, shoot the bearer of bad news, hide behind numbers, ignore criticism, or isolate yourself","Make decisions without data or skip stakeholder consultation","Bypass the chain of command or make unilateral decisions"]',
 1, 'Standard 9 lists seven "thou shalt not" items about honest leadership, starting with pretending and turning a blind eye.', 'live'),

-- chunk 4: Daily Standards Summary
('00000004-0000-0000-0000-000000000005',
 'How many standards are listed in the Daily Standards Summary?',
 'mcq', '["10","12","15","20"]',
 2, 'The summary lists 15 standards, one for each leadership standard in the document.', 'live'),

('00000004-0000-0000-0000-000000000005',
 'Which standard is number 7 in the Daily Standards Summary?',
 'mcq', '["''Make the call''","''Communicate with clarity and say the hard things early''","''Stay coachable — always''","''Face current reality''"]',
 1, 'Standard 7 is "Communicate with clarity and say the hard things early."', 'live'),

('00000004-0000-0000-0000-000000000005',
 'How is the Daily Standards Summary intended to be used?',
 'mcq', '["For annual performance reviews only","As a weekly written reflection exercise","For team huddles and quick reference, rotating one standard per day","As a screensaver rotation system"]',
 2, '"For team huddles and quick reference — one standard per day, rotating through."', 'live'),

-- chunk 5: Sources
('00000004-0000-0000-0000-000000000006',
 'Who wrote "Next Generation Leader," the primary source for this document?',
 'mcq', '["Brené Brown","Patrick Lencioni","Andy Stanley","Simon Sinek"]',
 2, 'Andy Stanley''s "Next Generation Leader" is the primary source listed.', 'live'),

('00000004-0000-0000-0000-000000000006',
 'Which book by Brené Brown is cited in the sources?',
 'mcq', '["Rising Strong","The Gifts of Imperfection","Dare to Lead","Daring Greatly"]',
 2, 'Brené Brown''s "Dare to Lead" is listed as a source.', 'live'),

('00000004-0000-0000-0000-000000000006',
 'When was the leadership document last updated?',
 'mcq', '["January 2026","February 2026","March 2026","April 2026"]',
 2, 'The document was last updated by John Deery on 18th March 2026.', 'live'),

-- ─── QUESTIONS — goals-2025 ──────────────────────────────────────────────────

-- chunk 0: goals overview
('00000005-0000-0000-0000-000000000001',
 'What is YourGP''s BHAG (Big Hairy Audacious Goal)?',
 'mcq', '["Become the largest GP network in the ACT","Meaningfully impact health outcomes for all Australia","Achieve 100% bulk billing by 2030","Open ten practices nationally"]',
 1, 'The BHAG is "Meaningfully impact health outcomes for all Australia."', 'live'),

('00000005-0000-0000-0000-000000000001',
 'Which of the following is NOT listed as a 2025 strategic goal?',
 'mcq', '["Fully developed GP pipeline","Highly engaged staff & GPs","Expand to Sydney and Melbourne","Increase sustainability to 6% on patient fees"]',
 2, 'The four strategic goals are: GP pipeline, engaged staff & GPs, 6% sustainability, and develop bench strength. Expansion to Sydney/Melbourne is not listed.', 'live'),

('00000005-0000-0000-0000-000000000001',
 'What is the profit margin target on patient fees in the 2025 goals?',
 'mcq', '["3%","4%","5%","6%"]',
 3, 'Strategic Goal 3 is "Increase sustainability to 6% on patient fees."', 'live'),

-- chunk 1: KPAs
('00000005-0000-0000-0000-000000000002',
 'What is the target NPS score for GPs in the 2025 KPAs?',
 'mcq', '[">60",">70",">80",">90"]',
 2, 'The target is "Raving GPs NPS > 80."', 'live'),

('00000005-0000-0000-0000-000000000002',
 'What patient NPS target is set in the 2025 KPAs?',
 'mcq', '[">70",">75",">80",">85"]',
 3, 'The target is "Raving Patients NPS>85."', 'live'),

('00000005-0000-0000-0000-000000000002',
 'What does the Staff KPA include alongside Gallup Q12 Scores?',
 'mcq', '["Patient satisfaction surveys","One-on-Ones and being highly trained","GP retention rates","Financial reporting skills"]',
 1, 'Staff KPA includes: #One-on-Ones, Gallup Q12 Scores >4.5, and Highly trained.', 'live'),

-- chunk 2: Key Results
('00000005-0000-0000-0000-000000000003',
 'How many new GPs are targeted to join YourGP in 2025?',
 'mcq', '["5","8","10","15"]',
 2, 'Key Result 1: "10 new GPs joining us."', 'live'),

('00000005-0000-0000-0000-000000000003',
 'How many new practices is YourGP aiming to identify in 2025?',
 'mcq', '["1","2","3","4"]',
 1, 'Key Result 4: "Identify our next 2 practices."', 'live'),

('00000005-0000-0000-0000-000000000003',
 'What is Key Result 11 focused on?',
 'mcq', '["Training 10 new receptionists","Launching a new patient app","Complete accountability and visibility of our operations","Reducing admin costs by 20%"]',
 2, 'Key Result 11: "Complete accountability and visibility of our operations."', 'live'),

-- ─── QUESTIONS — org-chart ───────────────────────────────────────────────────

-- chunk 0: overview
('00000006-0000-0000-0000-000000000001',
 'When was the YourGP Organisational Chart last updated?',
 'mcq', '["January 2026","February 2026","March 2026","April 2026"]',
 2, 'The chart was last updated on 5th March 2026.', 'live'),

('00000006-0000-0000-0000-000000000001',
 'How many doctors does YourGP have?',
 'mcq', '["24","36","48","60"]',
 2, 'The org chart shows 48 Doctors (Independent Practitioners & Registrars).', 'live'),

('00000006-0000-0000-0000-000000000001',
 'What two types of practitioners make up the "Doctors" category?',
 'mcq', '["Senior GPs and Registrars","Independent Medical Practitioners & Registrars","General Practitioners and Specialists","Full-time and Part-time GPs"]',
 1, 'The org chart describes Doctors as "Independent Medical Practitioners & Registrars."', 'live'),

-- chunk 1: Clinic Teams
('00000006-0000-0000-0000-000000000002',
 'How many clinic locations does YourGP operate?',
 'mcq', '["1","2","3","4"]',
 2, 'There are three clinic teams: YourGP@Crace, YourGP@Denman Prospect, and YourGP@Lyneham.', 'live'),

('00000006-0000-0000-0000-000000000002',
 'Which site has an "Assistant Site Manager" listed in its structure?',
 'mcq', '["YourGP@Crace","YourGP@Lyneham","YourGP@Denman Prospect","All three sites"]',
 2, 'Only Denman Prospect lists an "Assistant Site Manager" in its structure.', 'live'),

('00000006-0000-0000-0000-000000000002',
 'What nursing leadership role is present across all three clinic teams?',
 'mcq', '["Senior Nurse","Head Nurse","Nurse Practitioner","Clinical Nurse Specialist"]',
 1, 'All three clinics list a "Head Nurse" in their team structure.', 'live'),

-- chunk 2: Support Functions
('00000006-0000-0000-0000-000000000003',
 'Who does the Practice Support Team serve?',
 'mcq', '["Patients directly","The Business Team","Clinic Teams","Independent Medical Practitioners"]',
 2, 'The Practice Support Team is described as "in service of Clinic Teams."', 'live'),

('00000006-0000-0000-0000-000000000003',
 'Where are the Practice Support Staff located?',
 'mcq', '["All three Canberra clinics","Crace only","Malaysia","Working remotely within Australia"]',
 2, 'Practice Support Staff are based in Malaysia.', 'live'),

('00000006-0000-0000-0000-000000000003',
 'What two functions make up the Business Team?',
 'mcq', '["Marketing and IT","Legal and Finance","Head of Finance and Head of Projects & Digital Innovation","HR and Training"]',
 2, 'The Business Team consists of Head of Finance and Head of Projects & Digital Innovation.', 'live'),

-- chunk 3: Structure
('00000006-0000-0000-0000-000000000004',
 'How many clinic staff does YourGP have in total?',
 'mcq', '["12","16","24","32"]',
 2, '"Total: 48 Doctors, 24 Staff, 8 Nurses, 5 Business Team."', 'live'),

('00000006-0000-0000-0000-000000000004',
 'How many nurses does YourGP employ?',
 'mcq', '["5","6","8","10"]',
 2, 'The org chart total lists 8 Nurses.', 'live'),

('00000006-0000-0000-0000-000000000004',
 'Who should be contacted for feedback about the organisational chart?',
 'mcq', '["John Deery and Melian Deery","Kenneth Lobo and Atif Wan","Aiden Chang and Kenneth Lobo","All site managers"]',
 1, '"Contact for feedback: Kenneth Lobo & Atif Wan."', 'live');
